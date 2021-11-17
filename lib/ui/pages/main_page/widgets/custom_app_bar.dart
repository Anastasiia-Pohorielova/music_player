import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: AppBar(
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(color: Colors.red),
          automaticallyImplyLeading: true,
          elevation: 0,
          title: Text("My Title"),
          centerTitle: true,
        ),
      ),
    );
  }
}
