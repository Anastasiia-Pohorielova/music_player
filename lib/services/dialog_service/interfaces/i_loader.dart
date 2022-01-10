import 'package:flutter/material.dart';
import 'package:music_player/services/dialog_service/interfaces/i_dialog.dart';
import 'package:music_player/store/loader/loader_state.dart';

class ILoader extends IDialog {
  final bool state;
  final String? title;
  final LoaderKey loaderKey;

  ILoader({
    required this.state,
    required this.loaderKey,
    this.title,
  });

  Widget get widget {
    return Container();
  }

  @override
  Future<void> show(DisplayFunction displayFunction) async {}
}
