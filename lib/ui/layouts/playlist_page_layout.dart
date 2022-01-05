import 'package:flutter/material.dart';
import 'package:music_player/models/dto/tracklist_dto/track_dto.dart';
import 'package:music_player/models/pages/album_page_data.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/models/track_model.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/album_page/alibum_app_bar.dart';

class PlaylistPageLayout extends StatelessWidget {
  final String cover;
  final String artist;
  final String playlistTitle;
  final List<dynamic> trackList;
  final Function(IPageData) goToTrackPage;

  const PlaylistPageLayout({
    required this.cover,
    required this.artist,
    required this.playlistTitle,
    required this.trackList,
    required this.goToTrackPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: AlbumAppBar(
              imageUrl: cover,
              expandedHeight: 300.0,
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => ListTile(
                title: index != 0
                    ? InkWell(
                        onTap: () => goToTrackPage(
                          PlayerPageData(
                            id: index,
                            trackId: trackList.first.runtimeType == TrackDto ? trackList[index-1].trackId.toString() : trackList[index-1].trackDto.trackId.toString(),
                            cover: cover,
                            albumTitle: playlistTitle,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trackList.first.runtimeType == TrackDto ? trackList[index-1].title : trackList[index-1].trackDto.title,
                                  style: AppTextStyles.s14fw500White,
                                ),
                                Text(
                                  artist,
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
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  playlistTitle,
                                  style: AppTextStyles.s24fw700White,
                                ),
                                Text(
                                  artist,
                                  style: AppTextStyles.s14fw500White,
                                ),
                                Text(
                                  playlistTitle,
                                  style: AppTextStyles.s12fw400GreyLight,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20.0),
                                      child: Icon(
                                        Icons.favorite,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20.0),
                                      child: Icon(
                                        Icons.arrow_circle_down_outlined,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20.0),
                                      child: Icon(
                                        Icons.more_vert,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width - 100.0,
                              child: Icon(
                                Icons.play_circle_filled,
                                size: 50.0,
                                color: AppColors.green,
                              ),
                            )
                          ],
                        ),
                      ),
              ),
              childCount: trackList.length+1,
            ),
          )
        ],
      ),
    );
  }
}
