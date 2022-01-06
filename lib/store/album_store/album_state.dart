import 'dart:collection';

import 'package:music_player/models/dto/album_dto.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/shared/reducer.dart';

import 'album_actions/save_albums_action.dart';
import 'album_actions/save_tracklist_action.dart';

class AlbumState {
  final List<AlbumDto> albums;
  final List<TrackModel> trackList;

  const AlbumState({
    required this.albums,
    required this.trackList,
  });

  factory AlbumState.initial() {
    return AlbumState(
      albums: <AlbumDto>[],
      trackList: <TrackModel>[],
    );
  }

  AlbumState copyWith({
    List<AlbumDto>? albums,
    List<TrackModel>? trackList,
  }) {
    return AlbumState(
      trackList: trackList ?? this.trackList,
      albums: albums ?? this.albums,
    );
  }

  AlbumState reducer(dynamic action) {
    return Reducer<AlbumState>(
        actions: HashMap.from({
      SaveAlbumsAction: (dynamic action) => _saveAlbums(action),
      SaveTracklistAction: (dynamic action) => _saveTrackList(action),
    })).updateState(action, this);
  }

  AlbumState _saveAlbums(SaveAlbumsAction action) {
    return copyWith(albums: action.albums);
  }

  AlbumState _saveTrackList(SaveTracklistAction action) {
    return copyWith(trackList: action.trackList);
  }
}
