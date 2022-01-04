import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:music_player/store/song_store/song_selectors.dart';
import 'package:redux/redux.dart';

class AlbumPageVM {
  final void Function(int) getTrackList;
  final List<TrackDto> trackList;
  final void Function() pop;
  final void Function(IPageData) goToTrackPage;
  AlbumPageVM({
    required this.trackList,
    required this.getTrackList,
    required this.pop,
    required this.goToTrackPage,
  });

  static AlbumPageVM fromStore(Store<AppState> store) {
    return AlbumPageVM(
      trackList: SongSelectors.getTrackList(store),
      getTrackList: SongSelectors.getTrackListFromApi(store),
      pop: RouteSelectors.doPop(store),
      goToTrackPage: RouteSelectors.goToTrackPage(store),
    );
  }
}