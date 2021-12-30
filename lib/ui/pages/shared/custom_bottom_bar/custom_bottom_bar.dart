import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_gradient.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        gradient: AppGradient.bottomBarGradient
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home_outlined, color: AppColors.white,),
          Icon(Icons.search, color: AppColors.white,),
          Icon(Icons.my_library_books_sharp, color: AppColors.white,),
        ],
      ),
    );
  }
}
