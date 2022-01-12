import 'package:flutter/material.dart';
import 'package:music_player/config/app_router.gr.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/album_page/alibum_app_bar.dart';
import 'package:auto_route/auto_route.dart';

class PlaylistPageLayout extends StatefulWidget {
  final String cover;
  final String artist;
  final String playlistTitle;
  final List<TrackModel> trackList;
  final bool isPlaying;
  final void Function() openPlayer;
  final void Function() startPlaying;
  final void Function() stopPlaying;

  const PlaylistPageLayout({
    required this.cover,
    required this.artist,
    required this.playlistTitle,
    required this.trackList,
    required this.isPlaying,
    required this.startPlaying,
    required this.stopPlaying,
    required this.openPlayer,
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
                    widget.openPlayer();
                  } else {
                   widget.stopPlaying();
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
                  onTap: () => context.router.push(PlayerRoute(
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
