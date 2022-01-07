import 'package:music_player/models/track_model.dart';

class AddPlaylistToListenAction {
  final List<TrackModel> playlist;
  AddPlaylistToListenAction({required this.playlist});
}