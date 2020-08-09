import 'package:flutter_project_boilerplate/core/api/response/auth/session_response.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:copy_with_extension/copy_with_extension.dart';

// Generated code by @CopyWith
part 'auth_state.g.dart';

@immutable
@CopyWith()
class AuthState {
  // Initialize the default values here:
  const AuthState({
    SessionResponse currentSession
  })
      : this.currentSession = currentSession;

  /// Current logged on user.
  final SessionResponse currentSession;

}
