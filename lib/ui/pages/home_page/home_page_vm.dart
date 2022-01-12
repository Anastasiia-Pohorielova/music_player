import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/player_store/player_selectors.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:redux/redux.dart';

class  HomePageVM {
  final List<PlaylistModel> playlist;
  final bool isPlaying;

  HomePageVM({
    required this.playlist,
    required this.isPlaying,
  });

  static HomePageVM fromStore(Store<AppState> store) {
    return HomePageVM(
      playlist:  PlaylistSelectors.getPlaylist(store),
      isPlaying: PlayerSelectors.isPlaying(store),
    );
  }
}
