import 'dart:collection';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/player_store/stop_playing_action.dart';
import 'package:music_player/store/playlist/playlist_actions/add_playlist_to_listen_action.dart';
import 'package:music_player/store/player_store/add_to_playlist_action.dart';
import 'package:music_player/store/player_store/start_playing_action.dart';
import 'package:music_player/store/shared/reducer.dart';

class PlayerState {
  final List<TrackModel> tracklist;
  final bool isPlaying;

  const PlayerState({
    required this.tracklist,
    required this.isPlaying,
  });

  factory PlayerState.initial() {
    return PlayerState(
      tracklist: <TrackModel>[],
      isPlaying: false,
    );
  }

  PlayerState copyWith({List<TrackModel>? tracklist, bool? isPlaying}) {
    return PlayerState(
      tracklist: tracklist ?? this.tracklist,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  PlayerState reducer(dynamic action) {
    return Reducer<PlayerState>(
        actions: HashMap.from({
          AddPlaylistToListenAction: (dynamic action) => _saveDataToPlayerPlaylist(action),
          StartPlayingAction: (dynamic action) => _startPlaying(action),
          StopPlayingAction: (dynamic action) => _stopPlaying(action),
        })).updateState(action, this);
  }


  PlayerState _saveDataToPlayerPlaylist(AddPlaylistToListenAction action) {
    return copyWith(tracklist: action.playlist);
  }

  PlayerState _startPlaying(StartPlayingAction action) {
    return copyWith(isPlaying: true);
  }

  PlayerState _stopPlaying(StopPlayingAction action) {
    return copyWith(isPlaying: false);
  }
}
