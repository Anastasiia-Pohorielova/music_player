import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> textShadow() {
    return [
      BoxShadow(
        color: AppColors.black.withOpacity(0.3),
        blurRadius: 4.0,
        offset: Offset(0.0, 3.0),
      ),
    ];
  }

  static List<BoxShadow> searcherShadow() {
    return [
      BoxShadow(
        color: AppColors.black.withOpacity(0.8),
        blurRadius: 5.0,
        offset: Offset(0.0, 2.0),
      ),
    ];
  }

  static List<BoxShadow> searchCardShadow() {
    return [
      BoxShadow(
        color: AppColors.black.withOpacity(0.25),
        blurRadius: 4.0,
        offset: Offset(0.0, 0.0),
      ),
    ];
  }

  static List<BoxShadow> favoritesMessageShadow() {
    return [
      BoxShadow(
        color: AppColors.black.withOpacity(0.25),
        offset: Offset(0.0, 3.0),
        blurRadius: 10.0,
      )
    ];
  }

  static List<BoxShadow> cardShadow() {
    return [
      BoxShadow(
        color: AppColors.black.withOpacity(0.25),
        offset: Offset(0.0, 3.0),
        blurRadius: 10.0,
      )
    ];
  }

  static List<BoxShadow> cardHoverPressShadow() {
    return [
      BoxShadow(
        color: AppColors.black.withOpacity(0.35),
        offset: Offset(0.0, 2.0),
        blurRadius: 20.0,
      )
    ];
  }

  static List<BoxShadow> ingredientCardShadow() {
    return [
      BoxShadow(
        color: AppColors.black.withOpacity(0.25),
        offset: Offset(0.0, 2.0),
        blurRadius: 10.0,
      )
    ];
  }

}
