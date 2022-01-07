import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/services/playlist_service/playlist_service.dart';
import 'package:music_player/store/player_store/add_to_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/delete_from_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/get_palylist_action.dart';

class PlaylistRepository {
  PlaylistRepository._privateConstructor();

  static final PlaylistRepository instance = PlaylistRepository._privateConstructor();

  Future<void> addToPlaylist(AddToPlaylistAction action) async {
  //  return PlaylistService.instance.addToPlaylist(action);
  }

  Future<void> deleteFromPlaylist(DeleteFromPlaylistAction action) async {
    return PlaylistService.instance.deleteFromPlaylist(action);
  }

  Future<List<TrackDto>?> getPlaylist(GetPlaylistAction action) async {
    return PlaylistService.instance.getPlaylist(action);
  }
}
