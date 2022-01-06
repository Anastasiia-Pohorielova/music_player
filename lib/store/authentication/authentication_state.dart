import 'dart:collection';

import 'package:music_player/res/const.dart';
import 'package:music_player/store/authentication/authentication_actions.dart';
import 'package:music_player/store/shared/reducer.dart';

class AuthState {
  final String token;

  const AuthState({
    required this.token,
  });

  factory AuthState.initial() {
    return AuthState(
      token: emptyString,
    );
  }

  AuthState copyWith({
    String? token
  }) {
    return AuthState(
      token: token ?? this.token,
    );
  }

  AuthState reducer(dynamic action) {
    return Reducer<AuthState>(
        actions: HashMap.from({
          SaveUserAction: (dynamic action) => _saveUser(action),
        })).updateState(action, this);
  }

  AuthState _saveUser(SaveUserAction action) {
    return copyWith(token: action.token);
  }
}
