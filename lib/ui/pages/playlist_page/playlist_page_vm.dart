import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/player_store/player_selectors.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:redux/redux.dart';

class  PlaylistPageVM {
  final List<PlaylistModel> playlist;
  final void Function() startPlaying;
  final void Function() stopPlaying;
  final bool isPlaying;
  final void Function(List<TrackModel>) getPlayingTracklist;
  final List<TrackModel> playingPlaylist;
  final void Function() openPlayer;
  final AssetsAudioPlayer audioPlayer;

  PlaylistPageVM({
    required this.playlist,
    required this.startPlaying,
    required this.stopPlaying,
    required this.isPlaying,
    required this.getPlayingTracklist,
    required this.playingPlaylist,
    required this.openPlayer,
    required this.audioPlayer,
  });

  static PlaylistPageVM fromStore(Store<AppState> store) {
    return PlaylistPageVM(
      playlist:  PlaylistSelectors.getPlaylist(store),
      startPlaying: PlayerSelectors.startPlaying(store),
      stopPlaying: PlayerSelectors.stopPlaying(store),
      isPlaying: PlayerSelectors.isPlaying(store),
      getPlayingTracklist: PlaylistSelectors.addPlaylistToListen(store),
      playingPlaylist: PlayerSelectors.getPlayingPlaylist(store),
      openPlayer: PlayerSelectors.openPlayer(store),
      audioPlayer: PlayerSelectors.audioPlayer(store),
    );
  }
}
