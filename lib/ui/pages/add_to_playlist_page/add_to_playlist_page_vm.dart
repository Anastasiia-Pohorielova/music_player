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

class AddToPlaylistPageVM {
  final List<PlaylistModel> playlist;
  final void Function(TrackModel, String) addTrack;
  final void Function(int) deleteTrack;
  final void Function() pop;

  AddToPlaylistPageVM({
    required this.addTrack,
    required this.deleteTrack,
    required this.pop,
    required this.playlist,
  });

  static AddToPlaylistPageVM fromStore(Store<AppState> store) {
    return AddToPlaylistPageVM(
      pop: RouteSelectors.doPop(store),
      addTrack: PlaylistSelectors.addToPlaylist(store),
      deleteTrack: PlaylistSelectors.deleteFromPlaylist(store),
      playlist: PlaylistSelectors.getPlaylist(store),
    );
  }
}
