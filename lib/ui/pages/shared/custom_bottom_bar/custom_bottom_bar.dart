import 'package:flutter/material.dart';
import 'package:music_player/config/app_router.gr.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_gradient.dart';
import 'package:auto_route/auto_route.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Container(
          height: 50.0,
          decoration: BoxDecoration(gradient: AppGradient.bottomBarGradient),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => context.router.push(HomeRoute()),
                child: Icon(
                  Icons.home_outlined,
                  color: AppColors.white,
                ),
              ),
              InkWell(
                onTap: () =>  context.router.push(SearchRoute()),
                child: Icon(
                  Icons.search,
                  color: AppColors.white,
                ),
              ),
              Icon(
                Icons.my_library_books_sharp,
                color: AppColors.white,
              ),
            ],
          ),
        );
  }
}
