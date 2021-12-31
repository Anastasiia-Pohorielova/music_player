import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:music_player/store/song_store/song_selectors.dart';
import 'package:redux/redux.dart';

class SearchPageVM {
  final void Function(String) getAlbums;
  final List<AlbumDto> albums;
  final void Function(IPageData) goToAlbumPage;

  SearchPageVM({
    required this.albums,
    required this.getAlbums,
    required this.goToAlbumPage,
  });

  static SearchPageVM fromStore(Store<AppState> store) {
    return SearchPageVM(
     albums: SongSelectors.getAlbumList(store),
      getAlbums: SongSelectors.getAlbumsBySearch(store),
      goToAlbumPage: RouteSelectors.goToAlbumPage(store),
    );
  }
}
