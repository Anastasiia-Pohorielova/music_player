import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';

class CustomTab extends StatelessWidget {
  final Color borderColor;
  final String label;
  final Color tabColor;

  const CustomTab({
    required this.label,
    this.tabColor = AppColors.transparent,
    this.borderColor = AppColors.greyLight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30.0,
      width: 95.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: borderColor),
        color: tabColor,
      ),
      child: Text(label),
    );
  }
}
