import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';

class DialogBuilders {
  static Future<void> unclosedDialogBuilder({
    required BuildContext context,
    required Widget widget,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.black.withOpacity(0.7),
      builder: (BuildContext ctx) => widget,
    );
  }

  static Future<void> fullScreenDialogBuilder({
    required BuildContext context,
    required Widget widget,
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext ctx) => widget,
    );
  }

  static Future<void> defaultDialogBuilder({
    required BuildContext context,
    required Widget widget,
  }) async {
    return await showDialog(
      context: context,
      barrierColor: AppColors.black.withOpacity(0.7),
      builder: (BuildContext ctx) => widget,
    );
  }

  static Future<void> darkDialogBuilder({
    required BuildContext context,
    required Widget widget,
  }) async {
    return await showDialog(
      context: context,
      barrierColor: AppColors.black.withOpacity(0.3),
      builder: (BuildContext ctx) => widget,
    );
  }

  static Future<void> modalBottomSheetBuilder({
    required BuildContext context,
    required Widget widget,
  }) {
    return showModalBottomSheet<dynamic>(
      backgroundColor: AppColors.transparent,
      context: context,
      elevation: 0.0,
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext ctx) => widget,
    );
  }
}
