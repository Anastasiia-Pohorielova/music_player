import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/track_model.dart';

class AddToPlaylistAction {
  final TrackModel newTrack;
  final String playlistTitle;

  AddToPlaylistAction({
    required this.newTrack,
    required this.playlistTitle,
  });
}
