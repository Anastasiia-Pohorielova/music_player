import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/player_store/player_state.dart';
import 'package:music_player/store/player_store/start_playing_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class PlaylistEpics {
  static final indexEpic = combineEpics<AppState>([
    // addToPlaylistEpic,
    // removeFromPlaylistEpic,
    // getPlaylistEpic,
    openPLaylistEpic,
  ]);

  static Stream<dynamic> openPLaylistEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<OpenAudioPlayerAction>().switchMap((action) async* {
      await store.state.playerState.audioPlayer.open(
        Playlist(
          audios: List.generate(store.state.playerState.tracklist.length, (index) {
            return Audio.network(
              store.state.playerState.tracklist[index].trackDto.preview,
              metas: Metas(
                id: store.state.playerState.tracklist[index].trackDto.id.toString(),
                title: store.state.playerState.tracklist[index].trackDto.title,
                album: store.state.playerState.tracklist[index].albumName,
                image: MetasImage.network(store.state.playerState.tracklist[index].coverUrl),
                artist: store.state.playerState.tracklist[index].trackDto.artist.name,
              ),
            );
          }),
          startIndex: 0,
        ),
        autoStart: false,
      );
      yield StartPlayingAction();
    });
    // static Stream<dynamic> addToPlaylistEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    //   return actions.whereType<AddToPlaylistAction>().switchMap((action) async* {
    //     await PlaylistRepository.instance.addToPlaylist(action);
    //     yield GetPlaylistAction();
    //   });
    // }
    //
    // static Stream<dynamic> removeFromPlaylistEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    //   return actions.whereType<DeleteFromPlaylistAction>().switchMap((action) async* {
    //     await PlaylistRepository.instance.deleteFromPlaylist(action);
    //     yield GetPlaylistAction();
    //   });
    // }
    //
    // static Stream<dynamic> getPlaylistEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    //   return actions.whereType<GetPlaylistAction>().switchMap((action) async* {
    //     final List<TrackDto>? playlist = await PlaylistRepository.instance.getPlaylist(action);
    //     if (playlist == null) {
    //       return;
    //     }
    //     yield SavePlaylistAction(playlist: playlist);
    //   });
    // }
  }
}
