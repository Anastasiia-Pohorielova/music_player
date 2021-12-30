import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_shadows.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';

class AlbumAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String imageUrl;
  final Function() pop;
  const AlbumAppBar({
    required this.pop,
    required this.imageUrl,
    required this.expandedHeight,
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
            opacity: shrinkOffset > 280 ? 1.0 : 0.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, bottom: 10.0),
              child: Text('Album', style: AppTextStyles.s24fw700White),
            ),
          ),
        ),
        Opacity(
          opacity: shrinkOffset > 250.0 ? 0.0 : (1 - shrinkOffset / expandedHeight),
          child: Stack(
            alignment: Alignment.center,
            children: [
              shrinkOffset < 200.0 ? Container(
                height: 200.0 - shrinkOffset,
                width: 200.0 - shrinkOffset,
                decoration: BoxDecoration(
                  boxShadow: AppShadows.ingredientCardShadow(),
                ),
              ) : const SizedBox(),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 0.6 * (1 + (shrinkOffset * 2) / expandedHeight),
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: shrinkOffset > 200.0 && shrinkOffset < 298.0 ? 335.0 - shrinkOffset : 25.0,
            left: shrinkOffset > 200 ? MediaQuery.of(context).size.width - 84.0 : -100.0,
            child: Icon(
              Icons.play_circle_fill,
              size: 50.0,
              color: AppColors.green,
            ),),
        Positioned(
          left: 10.0,
          top: 20.0,
          child: InkWell(
            onTap: pop,
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
