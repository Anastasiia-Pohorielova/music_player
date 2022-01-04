import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';

class PlaylistModel {
  final String title;
  final List<String> tracks;
  final DateTime createdAt;

  PlaylistModel({
    required this.title,
    required this.tracks,
    required this.createdAt,
  });
}
