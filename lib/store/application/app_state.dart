import 'package:music_player/store/authentication/authentication_epics.dart';
import 'package:music_player/store/authentication/authentication_state.dart';
import 'package:music_player/store/song_store/song_epics.dart';
import 'package:music_player/store/song_store/song_state.dart';
import 'package:redux_epics/redux_epics.dart';

class AppState {
  final SongState songState;

  const AppState({required this.songState});

  factory AppState.initial() {
    return AppState(
      songState: SongState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      songState: state.songState.reducer(action),
    );
  }

  static final getAppEpic = combineEpics<AppState>([
    SongEpics.indexEpic,
  ]);
}
