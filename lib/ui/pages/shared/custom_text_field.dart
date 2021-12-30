import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;

  const CustomTextField({
    required this.focusNode,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.greyDark,
      ),
      child: TextFormField(
        focusNode: focusNode,
        controller: textEditingController,
        cursorColor: AppColors.white,
        style: AppTextStyles.s14fw500White,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusColor: AppColors.white,
        ),
      ),
    );
  }
}
