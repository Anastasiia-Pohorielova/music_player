//
//
// class AuthenticationRepository {
//   AuthenticationRepository._privateConstructor();
//
//   static final AuthenticationRepository instance = AuthenticationRepository._privateConstructor();
//
//   Future<UserDto?> getUserSignUp(SignUpUserAction action) async {
//     return AuthenticationService.instance.signUpUser(action);
//   }
//
//   Future<UserDto?> getUserSignIn(SignInUserAction action) {
//     return AuthenticationService.instance.signInUser(action);
//   }
//
//   Future<String?> getUserLogOut(LogOutAction action, String token) {
//     return AuthenticationService.instance.logOutUser(action, token);
//   }
// }
