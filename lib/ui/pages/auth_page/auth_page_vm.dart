import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/authentication/authentication_selectors.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:redux/redux.dart';

class AuthPageVM {
  final void Function() pop;
  final void Function() goToRegisterPage;
  final void Function() goToLoginPage;
  final void Function(String email, String password) loginWithEmail;
  final void Function(String email, String password) registerWithEmail;

  AuthPageVM({
    required this.pop,
    required this.goToRegisterPage,
    required this.goToLoginPage,
    required this.loginWithEmail,
    required this.registerWithEmail,
  });

  static AuthPageVM fromStore(Store<AppState> store) {
    return AuthPageVM(
      pop: RouteSelectors.doPop(store),
      goToLoginPage: RouteSelectors.goToLoginScreen(store),
      goToRegisterPage: RouteSelectors.goToRegisterScreen(store),
      loginWithEmail: AuthSelectors.loginWithEmail(store),
      registerWithEmail: AuthSelectors.registerWithEmail(store),
    );
  }
}
