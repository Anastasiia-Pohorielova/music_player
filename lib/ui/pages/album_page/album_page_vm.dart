import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/album_store/album_selectors.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/player_store/player_selectors.dart';
import 'package:music_player/store/playlist/playlist_selectors.dart';
import 'package:redux/redux.dart';

class AlbumPageVM {
  final void Function(int) getTrackList;
  final List<TrackModel> trackList;
  final void Function() startPlaying;
  final void Function() stopPlaying;
  final bool isPlaying;
  final void Function(List<TrackModel>) savePlayingTracklist;
  final List<TrackModel> playingTrackList;
  final void Function() openPlayer;
  final AssetsAudioPlayer audioPlayer;

  AlbumPageVM({
    required this.trackList,
    required this.getTrackList,
    required this.startPlaying,
    required this.stopPlaying,
    required this.isPlaying,
    required this.savePlayingTracklist,
    required this.playingTrackList,
    required this.openPlayer,
    required this.audioPlayer,
  });

  static AlbumPageVM fromStore(Store<AppState> store) {
    return AlbumPageVM(
      trackList: AlbumSelectors.getTrackList(store),
      getTrackList: AlbumSelectors.getTrackListFromApi(store),
      startPlaying: PlayerSelectors.startPlaying(store),
      stopPlaying: PlayerSelectors.stopPlaying(store),
      isPlaying: PlayerSelectors.isPlaying(store),
      savePlayingTracklist: PlaylistSelectors.addPlaylistToListen(store),
      playingTrackList: PlayerSelectors.getPlayingPlaylist(store),
      openPlayer: PlayerSelectors.openPlayer(store),
      audioPlayer: PlayerSelectors.audioPlayer(store),
    );
  }
}
