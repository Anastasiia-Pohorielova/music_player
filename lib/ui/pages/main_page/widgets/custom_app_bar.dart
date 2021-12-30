import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';

class CustomAppBar extends StatefulWidget {
  final Widget action;

  const CustomAppBar({
    required this.action,
    Key? key,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        backgroundColor: AppColors.black,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: widget.action
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
