import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_shadows.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/services/dialog_service/dialog_service.dart';
import 'package:music_player/store/loader/loader_state.dart';
import 'package:music_player/ui/shared/loader_dialog.dart';

class AlbumAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String imageUrl;
  final Function() onTap;
  final String albumTitle;
  final String artist;
  final bool isPlaying;

  const AlbumAppBar({
    required this.imageUrl,
    required this.expandedHeight,
    required this.albumTitle,
    required this.onTap,
    required this.artist,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          color: AppColors.greenFaded,
          child: Opacity(
            opacity: shrinkOffset > 210 ? 1.0 : 0.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, bottom: 10.0),
              child: Text(albumTitle, style: AppTextStyles.s24fw700White),
            ),
          ),
        ),
        Opacity(
          opacity: shrinkOffset > 200.0 ? 0.0 : (1 - shrinkOffset / expandedHeight),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              if (shrinkOffset < 200.0)
                Container(
                  height: 200.0 - shrinkOffset,
                  width: 200.0 - shrinkOffset,
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.ingredientCardShadow(),
                  ),
                ),
              if (shrinkOffset < 200.0)
                Container(
                  height: 200.0 - shrinkOffset,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 0.6 * (1 + (shrinkOffset * 2) / expandedHeight),
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      albumTitle,
                      style: AppTextStyles.s24fw700White,
                    ),
                    Text(
                      artist,
                      style: AppTextStyles.s14fw500White,
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
              ),
            ],
          ),
        ),
        Positioned(
          top: shrinkOffset < 220.0 ? 230.0 - shrinkOffset : 20.0,
          left: MediaQuery.of(context).size.width - 75.0,
          child: InkWell(
            onTap: onTap,
            splashColor: AppColors.white,
            child: Icon(
             isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
              size: 50.0,
              color: AppColors.green,
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 20.0,
          child: InkWell(
            onTap: Navigator.of(context).pop,
            child: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
