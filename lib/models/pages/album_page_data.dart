import 'package:music_player/models/dto/chart_dto.dart';

import 'package:music_player/models/pages/interfaces/i_page_data.dart';

class AlbumPageData implements IPageData {
  final AlbumDto album;
  final int index;

  const AlbumPageData({
    required this.index,
    required this.album,
  });
}

class PlayerPageData implements IPageData {
  final String trackId;
  final String cover;
  final String albumTitle;
  final int id;

  const PlayerPageData({
    required this.cover,
    required this.albumTitle,
    required this.id,
    required this.trackId,
  });
}
