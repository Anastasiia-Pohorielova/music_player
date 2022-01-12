import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/authentication/authentication_selectors.dart';
import 'package:redux/redux.dart';

class AuthPageVM {
  final void Function(String email, String password) loginWithEmail;
  final void Function(String email, String password) registerWithEmail;

  AuthPageVM({
    required this.loginWithEmail,
    required this.registerWithEmail,
  });

  static AuthPageVM fromStore(Store<AppState> store) {
    return AuthPageVM(
      loginWithEmail: AuthSelectors.loginWithEmail(store),
      registerWithEmail: AuthSelectors.registerWithEmail(store),
    );
  }
}
