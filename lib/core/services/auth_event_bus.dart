import 'dart:async';

/// Singleton event bus for auth lifecycle events.
/// The interceptor has no BuildContext, so it signals session expiry here.
/// The widget tree listens and navigates accordingly.
class AuthEventBus {
  AuthEventBus._();
  static final AuthEventBus instance = AuthEventBus._();

  final _controller = StreamController<AuthEvent>.broadcast();
  Stream<AuthEvent> get stream => _controller.stream;

  void fire(AuthEvent event) {
    if (!_controller.isClosed) _controller.add(event);
  }

  void dispose() => _controller.close();
}

enum AuthEvent {
  /// Refresh token expired or invalid — user must log in again.
  sessionExpired,
}