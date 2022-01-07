import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:redux/redux.dart';

class  HomePageVM {
  final List<PlaylistModel> playlist;
  final void Function(IPageData) goToPlaylistPage;
  final bool isPlaying;

  HomePageVM({
    required this.playlist,
    required this.goToPlaylistPage,
    required this.isPlaying,
  });

  static HomePageVM fromStore(Store<AppState> store) {
    return HomePageVM(
      playlist:  PlaylistSelectors.getPlaylist(store),
      goToPlaylistPage: RouteSelectors.goToPlaylistPage(store),
      isPlaying: PlaylistSelectors.isPlaying(store),
    );
  }
}
