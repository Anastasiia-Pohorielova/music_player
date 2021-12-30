import 'package:music_player/store/playlist/playlist_epics.dart';
import 'package:music_player/store/playlist/playlist_state.dart';
import 'package:music_player/store/song_store/song_epics.dart';
import 'package:music_player/store/song_store/song_state.dart';
import 'package:redux_epics/redux_epics.dart';

class AppState {
  final SongState songState;
  final PlaylistState playlistState;

  const AppState({
    required this.songState,
    required this.playlistState,
  });

  factory AppState.initial() {
    return AppState(
      songState: SongState.initial(),
      playlistState: PlaylistState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      songState: state.songState.reducer(action),
      playlistState: state.playlistState.reducer(action),
    );
  }

  static final getAppEpic = combineEpics<AppState>([
    SongEpics.indexEpic,
    PlaylistEpics.indexEpic,
  ]);
}
