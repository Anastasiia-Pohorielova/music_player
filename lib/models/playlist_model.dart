import 'package:music_player/models/track_model.dart';

class PlaylistModel {
  final String title;
  final List<TrackModel> tracks;
  final DateTime createdAt;

  PlaylistModel({
    required this.title,
    required this.tracks,
    required this.createdAt,
  });
}
