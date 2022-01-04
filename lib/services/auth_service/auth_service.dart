import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_player/res/const.dart';
import 'package:music_player/store/authentication/authentication_actions.dart';
import 'package:music_player/utils/logger.dart';

class AuthService {
  AuthService._privateConstructor();

  static final AuthService instance = AuthService._privateConstructor();

  Future<String> loginWithEmail(LoginWithEmailAction action) async {
    try {
      UserCredential? userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: action.email,
        password: action.password,
      );
      return await userCred.user!.getIdToken();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Log.e('Firebase:', 'No user found for that email.');
        return emptyString;
      } else if (e.code == 'wrong-password') {
        Log.e('Firebase:', 'Wrong password provided for that user.');
        return emptyString;
      }
    }
    return emptyString;
  }

  Future<String> registerWithEmail(RegisterWithEmailAction action) async {
    try {
      UserCredential? userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: action.email,
        password: action.password,
      );
      return await userCred.user!.getIdToken();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Log.e('Firebase:', 'No user found for that email.');
        return e.code;
      } else if (e.code == 'wrong-password') {
        Log.e('Firebase:', 'Wrong password provided for that user.');
        return e.code;
      }
      else {
        print(e.code);
        print('error');
      }
    }
    return emptyString;
  }
}
