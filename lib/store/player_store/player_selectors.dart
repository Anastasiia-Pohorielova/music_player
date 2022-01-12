import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/player_store/player_state.dart';
import 'package:music_player/store/player_store/start_playing_action.dart';
import 'package:music_player/store/player_store/stop_playing_action.dart';
import 'package:redux/redux.dart';

class PlayerSelectors {

  static AssetsAudioPlayer audioPlayer(Store<AppState> store) {
    return store.state.playerState.audioPlayer;
  }

  static bool isPlaying(Store<AppState> store) {
    return store.state.playerState.isPlaying;
  }

  static List<TrackModel> getPlayingPlaylist(Store<AppState> store) {
    return store.state.playerState.tracklist;
  }

  static Function() startPlaying(Store<AppState> store) {
    return () => store.dispatch(StartPlayingAction());
  }

  static Function() stopPlaying(Store<AppState> store) {
    return () => store.dispatch(StopPlayingAction());
  }

  static Function() openPlayer(Store<AppState> store) {
    return () => store.dispatch(OpenAudioPlayerAction());
  }


}
