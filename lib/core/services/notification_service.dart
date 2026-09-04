import 'dart:developer' as developer;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'medicine_reminder_scheduler.dart' show onMedicineReminderAction;

/// Handles a background/terminated FCM message.
/// Must be a TOP-LEVEL function (not a class method) — Firebase spawns
/// this in a separate isolate when the app isn't running.
@pragma('vm:entry-point')
Future<void> firebaseBackgroundMessageHandler(RemoteMessage message) async {
  // Keep this minimal — no UI, no provider access. Just log/record.
  developer.log('Background FCM message: ${message.messageId}', name: 'FCM');
}

/// Wraps FCM + local notification display + tap-to-navigate.
///
/// Usage: call [NotificationService.instance.initialize] once, after
/// Firebase.initializeApp() and after the router is built, passing the
/// same GlobalKey<NavigatorState> used by GoRouter's `navigatorKey`.
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _localNotifications =
  FlutterLocalNotificationsPlugin();

  GlobalKey<NavigatorState>? _navigatorKey;
  Future<void> Function(String token)? _onTokenRefresh;

  static const _channelId = 'sangwari_maa_default';
  static const _channelName = 'Sangwari Maa Notifications';
  static const _channelDescription =
      'Reminders, alerts, and updates from Sangwari Maa';

  Future<void> initialize(
      GlobalKey<NavigatorState> navigatorKey, {
        Future<void> Function(String token)? onTokenRefresh,
      }) async {
    _navigatorKey = navigatorKey;
    _onTokenRefresh = onTokenRefresh;

    // ── Local notifications (Android channel + init) ──────────────────
    const androidInit = AndroidInitializationSettings('@drawable/ic_notification');
    const initSettings = InitializationSettings(android: androidInit);

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        // Button tap (Taken / Skip / Remind in 30 min) vs. a plain tap
        // on the notification body itself.
        if (response.actionId != null) {
          onMedicineReminderAction(response);
          return;
        }
        final route = response.payload;
        if (route != null && route.isNotEmpty) {
          _navigateTo(route);
        }
      },
      onDidReceiveBackgroundNotificationResponse: onMedicineReminderAction,
    );

    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation
    <AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // ── FCM permission (Android 13+ needs runtime POST_NOTIFICATIONS) ──
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // ── Background handler (registered once, top-level) ────────────────
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);

    // ── Foreground messages: FCM doesn't auto-show a banner while the
    //    app is open, so we show it ourselves via local notifications ──
    FirebaseMessaging.onMessage.listen(_showLocalNotification);

    // ── User taps a notification while app is backgrounded (not killed) ─
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final route = message.data['route'];
      if (route != null && route.isNotEmpty) {
        _navigateTo(route);
      }
    });

    // ── App was launched by tapping a notification from a killed state ──
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      final route = initialMessage.data['route'];
      if (route != null && route.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _navigateTo(route);
        });
      }
    }

    // ── Token refresh — forwards to whatever callback was passed in,
    //    e.g. AuthRepository.updateFcmToken ────────────────────────────
    FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
      developer.log('FCM token refreshed: $token', name: 'FCM');
      await _onTokenRefresh?.call(token);
    });
  }

  /// Call after login to get the token for backend registration.
  Future<String?> getToken() => FirebaseMessaging.instance.getToken();

  void _showLocalNotification(RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

    _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          icon: '@drawable/ic_notification',
          largeIcon: const DrawableResourceAndroidBitmap(
            '@drawable/logo',
          ),
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      payload: message.data['route'],
    );

    FirebaseAnalytics.instance.logEvent(name: 'notification_received');
  }

  void _navigateTo(String route) {
    final context = _navigatorKey?.currentContext;
    if (context == null) return;
    FirebaseAnalytics.instance.logEvent(name: 'notification_opened');
    context.push(route);
  }
}