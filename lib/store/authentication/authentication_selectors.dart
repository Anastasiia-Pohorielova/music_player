// import 'package:music_player/models/user_model.dart';
// import 'package:music_player/store/application/app_state.dart';
// import 'package:redux/redux.dart';
//
// class AuthenticationSelectors {
//   static String getUser(Store<AppState> store) {
//     return store.state.authenticationState.token;
//   }
//
//   static bool getSwipeTutorial(Store<AppState> store) {
//     return store.state.authenticationState.swipeTutorial;
//   }
//
//   static void Function() getChangeSwipeTutorialValue(Store<AppState> store) {
//     return () => store.dispatch(ChangeSwipeTutorialValueAction());
//   }
//
//   static Function(UserModel) signInUser(Store<AppState> store) {
//     return (user) => store.dispatch(SignInUserAction(user: user));
//   }
//
//   static Function(String) signInWithToken(Store<AppState> store) {
//     return (token) => store.dispatch(SaveUserAction(token: token));
//   }
//
//   static Function(UserModel) signUpUser(Store<AppState> store) {
//     return (user) => store.dispatch(SignUpUserAction(user: user));
//   }
//
//   static Function() signInGoogleUser(Store<AppState> store) {
//     return () => store.dispatch(SignInGoogleAction());
//   }
//
//   static Function() signUpGoogleUser(Store<AppState> store) {
//     return () => store.dispatch(SignUpGoogleAction());
//   }
//
//   static Function() logOutUser(Store<AppState> store) {
//     return () => store.dispatch(LogOutAction());
//   }
//
//   static Function(UserModel) recoverUser(Store<AppState> store) {
//     return (user) => store.dispatch(
//           RecoverPasswordAction(
//             email: user.email,
//             password: user.password,
//           ),
//         );
//   }
//
//   static Function(String) checkEmail(Store<AppState> store) {
//     return (email) => store.dispatch(CheckEmailAction(email: email));
//   }
//
//   static String getEmail(Store<AppState> store) {
//     return store.state.authenticationState.email;
//   }
// }
