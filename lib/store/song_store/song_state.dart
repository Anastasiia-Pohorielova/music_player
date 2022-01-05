import 'dart:collection';

import 'package:music_player/models/dto/chart_dto.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/store/shared/reducer.dart';
import 'package:music_player/store/song_store/song_actions/save_albums_action.dart';
import 'package:music_player/store/song_store/song_actions/save_chart_action.dart';
import 'package:music_player/store/song_store/song_actions/save_tracklist_action.dart';

class SongState {
  final List<AlbumDto> chartPlaylist;
  final List<AlbumDto> albums;
  final List<TrackDto> trackList;

  const SongState({
    required this.chartPlaylist,
    required this.albums,
    required this.trackList,
  });

  factory SongState.initial() {
    return SongState(
      chartPlaylist: <AlbumDto>[],
      albums: <AlbumDto>[],
      trackList: <TrackDto>[],
    );
  }

  SongState copyWith({
    List<AlbumDto>? chartPlaylist,
    List<AlbumDto>? albums,
    List<TrackDto>? trackList,
  }) {
    return SongState(
      chartPlaylist: chartPlaylist ?? this.chartPlaylist,
      trackList: trackList ?? this.trackList,
      albums: albums ?? this.albums,
    );
  }

  SongState reducer(dynamic action) {
    return Reducer<SongState>(
        actions: HashMap.from({
      SaveChartAction: (dynamic action) => _saveChart(action),
      SaveAlbumsAction: (dynamic action) => _saveAlbums(action),
      SaveTracklistAction: (dynamic action) => _saveTrackList(action),
    })).updateState(action, this);
  }

  SongState _saveChart(SaveChartAction action) {
    return copyWith(chartPlaylist: action.chartList);
  }

  SongState _saveAlbums(SaveAlbumsAction action) {
    return copyWith(albums: action.albums);
  }

  SongState _saveTrackList(SaveTracklistAction action) {
    return copyWith(trackList: action.trackList);
  }
}
