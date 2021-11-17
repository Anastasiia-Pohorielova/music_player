import 'package:flutter/material.dart';
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
    );
  }
}
