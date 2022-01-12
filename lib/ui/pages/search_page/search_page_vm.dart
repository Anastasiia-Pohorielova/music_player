import 'package:music_player/models/dto/album_dto.dart';
import 'package:music_player/store/album_store/album_selectors.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:redux/redux.dart';

class SearchPageVM {
  final void Function(String) getAlbums;
  final List<AlbumDto> albums;

  SearchPageVM({
    required this.albums,
    required this.getAlbums,
  });

  static SearchPageVM fromStore(Store<AppState> store) {
    return SearchPageVM(
     albums: AlbumSelectors.getAlbumList(store),
      getAlbums: AlbumSelectors.getAlbumsBySearch(store),
    );
  }
}
