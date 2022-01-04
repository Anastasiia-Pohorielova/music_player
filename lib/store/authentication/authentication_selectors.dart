import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/authentication/authentication_actions.dart';
import 'package:redux/redux.dart';

class AuthSelectors {
  static void Function(String,String) loginWithEmail(Store<AppState> store) {
    return (email, password) => store.dispatch(LoginWithEmailAction(email: email, password: password));
  }

  static void Function(String,String) registerWithEmail(Store<AppState> store) {
    return (email, password) => store.dispatch(RegisterWithEmailAction(email: email, password: password));
  }
}