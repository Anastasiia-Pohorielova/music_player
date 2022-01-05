import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String title;

  const CustomButton({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 40.0),
        height: 45.0,
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: AppColors.green,
        ),
        child: Text(
          title,
          style: AppTextStyles.s14fw500White.copyWith(fontSize: 20.0),
        ),
      ),
    );
  }
}
