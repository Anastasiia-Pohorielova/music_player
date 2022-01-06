import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:redux/redux.dart';

class  PlaylistPageVM {
  final List<PlaylistModel> playlist;

  final void Function(IPageData) goToTrackPage;

  PlaylistPageVM({
    required this.playlist,
    required this.goToTrackPage,
  });

  static PlaylistPageVM fromStore(Store<AppState> store) {
    return PlaylistPageVM(
      playlist:  PlaylistSelectors.getPlaylist(store),
      goToTrackPage: RouteSelectors.goToTrackPage(store),
    );
  }
}
