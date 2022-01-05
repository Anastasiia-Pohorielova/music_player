import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';

class TrackModel implements IPageData {
  final TrackDto trackDto;
  final String coverUrl;
  final String albumName;

  const TrackModel({
    required this.trackDto,
    required this.coverUrl,
    required this.albumName,
  });
}
