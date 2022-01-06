import 'package:music_player/store/album_store/album_epics.dart';
import 'package:music_player/store/album_store/album_state.dart';
import 'package:music_player/store/authentication/authentication_epics.dart';
import 'package:music_player/store/authentication/authentication_state.dart';
import 'package:music_player/store/loader/loader_reducer.dart';
import 'package:music_player/store/loader/loader_state.dart';
import 'package:music_player/store/playlist/playlist_epics.dart';
import 'package:music_player/store/playlist/playlist_state.dart';
import 'package:redux_epics/redux_epics.dart';

class AppState {
  final AlbumState songState;
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
      songState: AlbumState.initial(),
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
    AlbumEpics.indexEpic,
    //PlaylistEpics.indexEpic,
    AuthenticationEpics.indexEpic,
  ]);
}
