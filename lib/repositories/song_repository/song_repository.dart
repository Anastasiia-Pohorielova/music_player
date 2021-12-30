import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/services/song_service/song_service.dart';
import 'package:music_player/store/song_store/song_actions/get_album_action.dart';
import 'package:music_player/store/song_store/song_actions/get_tracklist_action.dart';

class SongRepository {
  SongRepository._privateConstructor();

   static final SongRepository instance = SongRepository._privateConstructor();

  Future<List<AlbumDto>?> getAlbum(GetAlbumAction action) async {
      return SongService.instance.getAlbum(action);
     }
  Future<List<TrackDto>?> getTrackList(GetTracklistAction action, String url) async {
    return SongService.instance.getTrackList(action, url);
  }
}