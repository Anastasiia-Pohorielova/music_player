import 'package:flutter/material.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/interfaces/i_playlist_dto.dart';
import 'package:music_player/models/pages/album_page_data.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/layouts/widgets/player_widget.dart';
import 'package:music_player/ui/pages/album_page/alibum_app_bar.dart';

class PlaylistPageLayout extends StatefulWidget {
  final String cover;
  final String artist;
  final String playlistTitle;
  final List<TrackModel> trackList;
  final Function(IPageData) goToTrackPage;
  final bool isPlaying;
  final void Function() startPlaying;
  final void Function() stopPlaying;

  const PlaylistPageLayout({
    required this.cover,
    required this.artist,
    required this.playlistTitle,
    required this.trackList,
    required this.goToTrackPage,
    required this.isPlaying,
    required this.startPlaying,
    required this.stopPlaying,
    Key? key,
  }) : super(key: key);

  @override
  _PlaylistPageLayoutState createState() => _PlaylistPageLayoutState();
}

class _PlaylistPageLayoutState extends State<PlaylistPageLayout> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      tracklist: widget.isPlaying ? widget.trackList : [],
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: AlbumAppBar(
              isPlaying: widget.isPlaying,
              artist: widget.artist,
              albumTitle: widget.playlistTitle,
              onTap: () {
                setState(() {
                  if (widget.isPlaying == false) {
                    widget.startPlaying();
                    print(widget.isPlaying);
                  } else {
                   widget.stopPlaying();
                   print(widget.isPlaying);
                  }
                });
              },
              imageUrl: widget.cover,
              expandedHeight: 300.0,
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => ListTile(
                title: InkWell(
                  onTap: () => widget.goToTrackPage(
                    PlayerPageData(
                      id: index,
                      trackId: widget.trackList[index].trackDto.id.toString(),
                      cover: widget.cover,
                      albumTitle: widget.playlistTitle,
                      artistName: widget.artist,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.trackList[index].trackDto.title,
                            style: AppTextStyles.s14fw500White,
                          ),
                          Text(
                            widget.artist,
                            style: AppTextStyles.s14fw500White,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.more_vert,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              childCount: widget.trackList.length,
            ),
          )
        ],
      ),
    );
  }
}
