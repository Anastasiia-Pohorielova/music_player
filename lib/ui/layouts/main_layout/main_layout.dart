import 'package:flutter/material.dart';
import 'package:music_player/dictionary/flutter_dictionary.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/const.dart';
import 'package:music_player/ui/pages/shared/custom_bottom_bar/custom_bottom_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget customAppBar;
  final Widget body;

  const MainLayout({
    required this.customAppBar,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.black,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [

              Scaffold(
                backgroundColor: AppColors.black,
                body: body,
              ),
              customAppBar,
              CustomBottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
