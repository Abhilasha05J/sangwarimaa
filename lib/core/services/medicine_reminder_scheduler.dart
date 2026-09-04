import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;
import 'medicine_offline_queue.dart';

/// Schedules and manages the daily IFA/Calcium medicine reminders.
/// One account per device — no beneficiaryId needed anywhere.
class MedicineReminderScheduler {
  MedicineReminderScheduler._();
  static final MedicineReminderScheduler instance = MedicineReminderScheduler._();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  static const _channelId = 'medicine_reminders';
  static const _channelName = 'Medicine Reminders';
  static const _channelDescription = 'Daily IFA and Calcium tablet reminders';

  bool _tzInitialized = false;

  Future<void> ensureTimezoneInitialized() async {
    if (_tzInitialized) return;
    tz_data.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
    _tzInitialized = true;
  }

  // Future<bool> ensureExactAlarmPermission() async {
  //   final androidPlugin = _plugin
  //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  //   if (androidPlugin == null) return true; // not Android
  //
  //   final canSchedule = await androidPlugin.canScheduleExactNotifications() ?? false;
  //   if (canSchedule) return true;
  //
  //   // This opens the system "Alarms & reminders" settings screen —
  //   // no in-app dialog exists for this permission on Android 14+.
  //   await androidPlugin.requestExactAlarmsPermission();
  //   return await androidPlugin.canScheduleExactNotifications() ?? false;
  // }
  Future<bool> ensureExactAlarmPermission() async {
    debugPrint('=== ensureExactAlarmPermission CALLED ===');
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    debugPrint('=== androidPlugin: $androidPlugin ===');
    if (androidPlugin == null) return true;

    final canSchedule = await androidPlugin.canScheduleExactNotifications() ?? false;
    debugPrint('=== canScheduleExactNotifications: $canSchedule ===');
    if (canSchedule) return true;

    debugPrint('=== calling requestExactAlarmsPermission ===');
    try {
      await androidPlugin.requestExactAlarmsPermission();
      debugPrint('=== requestExactAlarmsPermission returned, no error ===');
    } catch (e, st) {
      debugPrint('=== requestExactAlarmsPermission THREW: $e ===');
      debugPrint('$st');
    }
    final result = await androidPlugin.canScheduleExactNotifications() ?? false;
    debugPrint('=== final canScheduleExactNotifications: $result ===');
    return result;
  }
  Future<void> scheduleDaily({
    required String medicineType, // 'iron' | 'calcium'
    required String title,
    required String body,
    int hour = 8,
    int minute = 0,
  }) async {
    await ensureTimezoneInitialized();

    final notificationId = _idFor(medicineType);

    final androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      icon: '@drawable/ic_notification',
      largeIcon: const DrawableResourceAndroidBitmap(
        '@drawable/logo',
      ),
      importance: Importance.high,
      priority: Priority.high,
      actions: <AndroidNotificationAction>[
        const AndroidNotificationAction('TAKEN', 'Taken', showsUserInterface: false, cancelNotification: true),
        const AndroidNotificationAction('REMIND_30MIN', 'Remind in 30 min', showsUserInterface: false, cancelNotification: true),
        const AndroidNotificationAction('SKIP', 'Skip', showsUserInterface: false, cancelNotification: true),
      ],
    );

    await _plugin.zonedSchedule(
      notificationId,
      title,
      body,
      _nextInstanceOfTime(hour, minute),
      NotificationDetails(android: androidDetails),
      payload: medicineType,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      // DELETE the line below if `flutter pub deps` shows v18+ installed —
      // it was removed in 18.0.0 and won't compile on that version.
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );

    developer.log('Scheduled daily $medicineType reminder at $hour:$minute', name: 'MedicineReminder');
  }

  /// One-off snooze reminder, 30 minutes out. Public so the top-level
  /// action handler can call it without reaching into a private field.
  Future<void> scheduleSnoozeReminder(String medicineType) async {
    await ensureTimezoneInitialized();
    await _plugin.zonedSchedule(
      '${medicineType}_snooze'.hashCode & 0x7fffffff,
      'Reminder: take your $medicineType tablet',
      '',
      tz.TZDateTime.now(tz.local).add(const Duration(minutes: 30)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      payload: medicineType,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // Same note as above — remove if on v18+.
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancel(String medicineType) => _plugin.cancel(_idFor(medicineType));

  Future<void> cancelAll() => _plugin.cancelAll();

  int _idFor(String medicineType) => medicineType.hashCode & 0x7fffffff;

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }
}

/// Handles the response when a medicine reminder's action button is tapped —
/// including when the app is fully killed. Must stay top-level.
@pragma('vm:entry-point')
void onMedicineReminderAction(NotificationResponse response) async {
  final medicineType = response.payload;
  if (medicineType == null) return;

  switch (response.actionId) {
    case 'TAKEN':
      await enqueueMedicineTaken(medicineType, DateTime.now());
      developer.log('Queued TAKEN: $medicineType', name: 'MedicineReminder');
      break;

    case 'SKIP':
      developer.log('SKIPPED: $medicineType', name: 'MedicineReminder');
      break;

    case 'REMIND_30MIN':
      await MedicineReminderScheduler.instance.scheduleSnoozeReminder(medicineType);
      break;
  }
}