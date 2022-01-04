import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/repositories/song_repository/song_repository.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/song_store/song_actions/get_album_action.dart';
import 'package:music_player/store/song_store/song_actions/get_tracklist_action.dart';
import 'package:music_player/store/song_store/song_actions/save_albums_action.dart';
import 'package:music_player/store/song_store/song_actions/save_tracklist_action.dart';
import 'package:music_player/utils/logger.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class SongEpics {
  static final indexEpic = combineEpics<AppState>([
    getAlbums,
    getTrackList,
  ]);

  static Stream<dynamic> getAlbums(Stream<dynamic> actions, EpicStore<AppState> store) {
      return actions.whereType<GetAlbumAction>().switchMap((action) async* {
        final List<AlbumDto>? albums = await SongRepository.instance.getAlbum(action);
        if (albums == null) {
          return;
        }
        yield SaveAlbumsAction(albums: albums);
      });
    }

  static Stream<dynamic> getTrackList(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetTracklistAction>().switchMap((action) async* {
      final List<TrackDto>? trackList = await SongRepository.instance.getTrackList(action, store.state.songState.albums[action.id].urlTrackList);
      Log.d('tracklist', trackList!.first.title);
      if (trackList == null) {
        return;
      }
      yield SaveTracklistAction(trackList: trackList);
    });
  }

}