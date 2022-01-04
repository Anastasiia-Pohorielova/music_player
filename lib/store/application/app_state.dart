import 'package:music_player/store/authentication/authentication_epics.dart';
import 'package:music_player/store/authentication/authentication_state.dart';
import 'package:music_player/store/loader/loader_reducer.dart';
import 'package:music_player/store/loader/loader_state.dart';
import 'package:music_player/store/playlist/playlist_epics.dart';
import 'package:music_player/store/playlist/playlist_state.dart';
import 'package:music_player/store/song_store/song_epics.dart';
import 'package:music_player/store/song_store/song_state.dart';
import 'package:redux_epics/redux_epics.dart';

class AppState {
  final SongState songState;
  final PlaylistState playlistState;
  final AuthState authState;
  final LoaderState loaderState;

  const AppState({
    required this.songState,
    required this.playlistState,
    required this.authState,
    required this.loaderState,
  });

  factory AppState.initial() {
    return AppState(
      songState: SongState.initial(),
      playlistState: PlaylistState.initial(),
      authState: AuthState.initial(),
      loaderState: LoaderState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      songState: state.songState.reducer(action),
      playlistState: state.playlistState.reducer(action),
      authState: state.authState.reducer(action),
      loaderState: loaderReducer(state.loaderState, action),
    );
  }

  static final getAppEpic = combineEpics<AppState>([
    SongEpics.indexEpic,
    PlaylistEpics.indexEpic,
    AuthenticationEpics.indexEpic,
  ]);
}
