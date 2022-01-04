import 'package:music_player/store/shared/base_action.dart';

class LoginWithEmailAction extends BaseAction {
  final String email;
  final String password;
  LoginWithEmailAction({required this.email, required this.password,}) : super(type: 'LoginWithEmail');
}

class RegisterWithEmailAction extends BaseAction {
  final String email;
  final String password;
  RegisterWithEmailAction({required this.email, required this.password,}) : super(type: 'RegisterWithEmail');
}

class SaveUserAction extends BaseAction {
  String token;
  SaveUserAction({required this.token});
}