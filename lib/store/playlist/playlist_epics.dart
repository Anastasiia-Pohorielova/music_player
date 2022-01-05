// import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
// import 'package:music_player/repositories/playlist_repository/playlist_repository.dart';
// import 'package:music_player/store/application/app_state.dart';
// import 'package:music_player/store/playlist/playlist_actions/add_to_playlist_action.dart';
// import 'package:music_player/store/playlist/playlist_actions/delete_from_playlist_action.dart';
// import 'package:music_player/store/playlist/playlist_actions/get_palylist_action.dart';
// import 'package:music_player/store/playlist/playlist_actions/save_playlist_action.dart';
// import 'package:redux_epics/redux_epics.dart';
// import 'package:rxdart/rxdart.dart';
//
// class PlaylistEpics {
//   static final indexEpic = combineEpics<AppState>([
//     addToPlaylistEpic,
//     removeFromPlaylistEpic,
//     getPlaylistEpic,
//   ]);
//
//   static Stream<dynamic> addToPlaylistEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
//     return actions.whereType<AddToPlaylistAction>().switchMap((action) async* {
//       await PlaylistRepository.instance.addToPlaylist(action);
//       yield GetPlaylistAction();
//     });
//   }
//
//   static Stream<dynamic> removeFromPlaylistEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
//     return actions.whereType<DeleteFromPlaylistAction>().switchMap((action) async* {
//       await PlaylistRepository.instance.deleteFromPlaylist(action);
//       yield GetPlaylistAction();
//     });
//   }
//
//   static Stream<dynamic> getPlaylistEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
//     return actions.whereType<GetPlaylistAction>().switchMap((action) async* {
//       final List<TrackDto>? playlist = await PlaylistRepository.instance.getPlaylist(action);
//       if (playlist == null) {
//         return;
//       }
//       yield SavePlaylistAction(playlist: playlist);
//     });
//   }
// }
