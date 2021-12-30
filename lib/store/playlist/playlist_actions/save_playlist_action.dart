import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';

class SavePlaylistAction {
  final List<TrackDto> playlist;
  SavePlaylistAction({required this.playlist});
}