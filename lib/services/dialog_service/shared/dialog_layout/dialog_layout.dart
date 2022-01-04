import 'package:flutter/material.dart';

import 'package:music_player/services/dialog_service/dialog_service.dart';

class DialogLayout extends StatelessWidget {
  final Widget child;
  final Color? color;
  final canCloseDialog;

  const DialogLayout({
    required this.child,
    this.canCloseDialog = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (canCloseDialog ?? true)
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: DialogService.instance.close,
              ),
            child,
          ],
        ),
      ),
    );
  }
}
