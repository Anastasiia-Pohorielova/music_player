import 'package:music_player/store/authentication/authentication_epics.dart';
import 'package:music_player/store/authentication/authentication_state.dart';
import 'package:redux_epics/redux_epics.dart';

class AppState {

  const AppState();

  factory AppState.initial() {
    return AppState(
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
     // dialogState: state.dialogState.reducer(action),
    );
  }

  static final getAppEpic = combineEpics<AppState>([
  //  AuthenticationGoogleEpics.indexEpic,
  ]);
}
