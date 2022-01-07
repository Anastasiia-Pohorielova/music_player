import 'dart:collection';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/playlist_model.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/player_store/add_to_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/create_new_playlist_action.dart';
import 'package:music_player/store/playlist/playlist_actions/delete_from_playlist_action.dart';
import 'package:music_player/store/player_store/start_playing_action.dart';
import 'package:music_player/store/shared/reducer.dart';

class PlaylistState {
  final List<TrackModel> tracklist;
  final List<PlaylistModel> playlists;

  const PlaylistState({
    required this.playlists,
    required this.tracklist,
  });

  factory PlaylistState.initial() {
    return PlaylistState(
      playlists: <PlaylistModel>[],
      tracklist: <TrackModel>[],
    );
  }

  PlaylistState copyWith({List<PlaylistModel>? playlists, List<TrackModel>? tracklist}) {
    return PlaylistState(
      playlists: playlists ?? this.playlists,
      tracklist: tracklist ?? this.tracklist,
    );
  }

  PlaylistState reducer(dynamic action) {
    return Reducer<PlaylistState>(
        actions: HashMap.from({
      AddToPlaylistAction: (dynamic action) => _addTrackToPlayList(action),
      CreateNewPlaylistAction: (dynamic action) => _createNewPlayList(action),
      DeleteFromPlaylistAction: (dynamic action) => _deleteTrackFromPlayList(action),
    })).updateState(action, this);
  }

  PlaylistState _addTrackToPlayList(AddToPlaylistAction action) {
    playlists.firstWhere((element) => element.title == action.playlistTitle).tracks.add(action.newTrack);
    return copyWith(playlists: playlists);
  }

  PlaylistState _createNewPlayList(CreateNewPlaylistAction action) {
    var newPlaylist = PlaylistModel(createdAt: DateTime.now(), title: action.title, tracks: []);
    playlists.add(newPlaylist);
    return copyWith(playlists: playlists);
  }

  PlaylistState _deleteTrackFromPlayList(DeleteFromPlaylistAction action) {
    for (var item in playlists) {
      item.tracks.removeWhere((element) => element.trackDto.id == action.trackId);
    }
    return copyWith(playlists: playlists);
  }
}
