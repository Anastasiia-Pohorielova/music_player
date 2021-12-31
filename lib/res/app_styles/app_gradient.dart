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

  static LinearGradient get albumGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.4, 0.75],
      colors: [
        AppColors.greenFaded,
        AppColors.greenFaded,
        AppColors.black,
      ],
    );
  }

  static LinearGradient get playerGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.brownLight,
        AppColors.black,
      ],
    );
  }

  static LinearGradient get backgroundGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.transparent,
        AppColors.black,
      ],
    );
  }
}
