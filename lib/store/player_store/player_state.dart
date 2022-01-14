import 'dart:collection';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/player_store/start_playing_action.dart';
import 'package:music_player/store/player_store/stop_playing_action.dart';
import 'package:music_player/store/playlist/playlist_actions/add_playlist_to_listen_action.dart';
import 'package:music_player/store/shared/reducer.dart';

class PlayerState {
  final List<TrackModel> tracklist;
  final bool isPlaying;
  final AssetsAudioPlayer audioPlayer;

  const PlayerState({
    required this.tracklist,
    required this.isPlaying,
    required this.audioPlayer,
  });

  factory PlayerState.initial() {
    return PlayerState(
      tracklist: <TrackModel>[],
      isPlaying: false,
      audioPlayer: AssetsAudioPlayer(),
    );
  }

  PlayerState copyWith({List<TrackModel>? tracklist, bool? isPlaying, AssetsAudioPlayer? audioPlayer}) {
    return PlayerState(
      tracklist: tracklist ?? this.tracklist,
      isPlaying: isPlaying ?? this.isPlaying,
      audioPlayer: audioPlayer ?? this.audioPlayer,
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
    audioPlayer.play();
    return copyWith(isPlaying: true);
  }

  PlayerState _stopPlaying(StopPlayingAction action) {
    audioPlayer.stop();
    return copyWith(isPlaying: false);
  }


}

class OpenAudioPlayerAction {
  OpenAudioPlayerAction();
}
