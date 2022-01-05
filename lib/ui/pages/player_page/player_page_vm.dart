import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:music_player/store/song_store/song_selectors.dart';
import 'package:redux/redux.dart';

class  PlayerPageVM {
  final List<PlaylistModel> playlist;
  final List<TrackDto> albumPlaylist;
  final List<AlbumDto> albums;
  final void Function(TrackModel, String) addTrack;
  final void Function(String) createPlaylist;
  final void Function(int) deleteTrack;
  final void Function() getPlaylist;
  final void Function() pop;
  final void Function(IPageData) goToTrackPage;
  final void Function(TrackModel) goToAddToPlaylistPage;
  final void Function(IPageData) goToPlaylistPage;

  PlayerPageVM({
    required this.addTrack,
    required this.deleteTrack,
    required this.pop,
    required this.playlist,
    required this.getPlaylist,
    required this.goToTrackPage,
    required this.albumPlaylist,
    required this.albums,
    required this.goToAddToPlaylistPage,
    required this.createPlaylist,
    required this.goToPlaylistPage,
  });

  static PlayerPageVM fromStore(Store<AppState> store) {
    return PlayerPageVM(
      pop: RouteSelectors.doPop(store),
      goToAddToPlaylistPage: RouteSelectors.goToAddToPlaylistScreen(store),
      addTrack: PlaylistSelectors.addToPlaylist(store),
      deleteTrack: PlaylistSelectors.deleteFromPlaylist(store),
      playlist:  PlaylistSelectors.getPlaylist(store),
      getPlaylist: PlaylistSelectors.getPlaylistFromApi(store),
      goToTrackPage: RouteSelectors.goToTrackPage(store),
      albumPlaylist: SongSelectors.getTrackList(store),
      albums: SongSelectors.getAlbumList(store),
      createPlaylist: PlaylistSelectors.createNewPlaylist(store),
      goToPlaylistPage: RouteSelectors.goToPlaylistPage(store),
    );
  }
}
