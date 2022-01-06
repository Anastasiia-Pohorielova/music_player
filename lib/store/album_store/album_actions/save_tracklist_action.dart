import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/track_model.dart';

class SaveTracklistAction {
  final List<TrackModel> trackList;
  SaveTracklistAction({required this.trackList});
}