import 'package:music_player/models/dto/album_dto.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/album_store/album_selectors.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:redux/redux.dart';

class  PlayerPageVM {
  final List<PlaylistModel> playlist;
  final List<TrackModel> albumPlaylist;
  final void Function(String) createPlaylist;
  final void Function() pop;
  final void Function(TrackModel) goToAddToPlaylistPage;

  PlayerPageVM({
    required this.pop,
    required this.playlist,
    required this.albumPlaylist,
    required this.goToAddToPlaylistPage,
    required this.createPlaylist,
  });

  static PlayerPageVM fromStore(Store<AppState> store) {
    return PlayerPageVM(
      pop: RouteSelectors.doPop(store),
      goToAddToPlaylistPage: RouteSelectors.goToAddToPlaylistScreen(store),
      playlist:  PlaylistSelectors.getPlaylist(store),
      albumPlaylist: AlbumSelectors.getTrackList(store),
      createPlaylist: PlaylistSelectors.createNewPlaylist(store),
    );
  }
}
