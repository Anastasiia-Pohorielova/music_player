import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradient {
  static LinearGradient get bottomBarGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.black,
        AppColors.black.withOpacity(0.8),
      ],
    );
  }

  
}
