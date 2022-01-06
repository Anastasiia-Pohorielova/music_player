import 'package:music_player/models/dto/album_dto.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/services/album_service/album_service.dart';
import 'package:music_player/store/album_store/album_actions/get_album_action.dart';
import 'package:music_player/store/album_store/album_actions/get_tracklist_action.dart';

class SongRepository {
  SongRepository._privateConstructor();

   static final SongRepository instance = SongRepository._privateConstructor();

  Future<List<AlbumDto>?> getAlbum(GetAlbumAction action) async {
      return AlbumService.instance.getAlbum(action);
     }
  Future<List<TrackDto>?> getTrackList(GetTracklistAction action, String? url) async {
    return AlbumService.instance.getTrackList(action, url!);
  }
}