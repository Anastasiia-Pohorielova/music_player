

import 'package:music_player/services/auth_service/auth_service.dart';
import 'package:music_player/store/authentication/authentication_actions.dart';

class AuthenticationRepository {
  AuthenticationRepository._privateConstructor();

  static final AuthenticationRepository instance = AuthenticationRepository._privateConstructor();

  Future<String?> loginWithEmail(LoginWithEmailAction action) async {
    return AuthService.instance.loginWithEmail(action);
  }

  Future<String?> registerWithEmail(RegisterWithEmailAction action) {
    return AuthService.instance.registerWithEmail(action);
  }
}
