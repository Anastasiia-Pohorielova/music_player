import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_gradient.dart';
import 'package:music_player/ui/pages/shared/custom_bottom_bar/custom_bottom_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget customAppBar;
  final Widget? body;
  final bool isBottomBar;
  final bool isPadding;

  const MainLayout({
    this.body,
    this.isBottomBar = true,
    this.isPadding = true,
    this.customAppBar = const SizedBox(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Container(
        decoration: BoxDecoration(gradient: isPadding ? AppGradient.albumGradient : null),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            customAppBar,
            if(body != null) Padding(
              padding: isPadding
                  ? const EdgeInsets.only(
                      top: 100.0,
                      left: 10.0,
                      right: 10.0,
                    )
                  : EdgeInsets.zero,
              child: Scaffold(
                backgroundColor: AppColors.transparent,
                body: body,
                resizeToAvoidBottomInset: false,
              ),
            ),
            if(isBottomBar) CustomBottomBar(),
          ],
        ),
      ),
    );
  }
}
