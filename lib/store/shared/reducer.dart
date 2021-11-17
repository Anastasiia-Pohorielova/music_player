import 'dart:collection';

import 'package:music_player/res/const.dart';

class Reducer<T> {
  final String tag = '[Reducer<$T>]';

  HashMap<dynamic, T Function(dynamic)?> actions;

  Reducer({
    required this.actions,
  }) {
    actions.forEach((key, value) {
      if (value == null) throw ('All Functions must be initialize');
    });
  }

  T updateState(dynamic action, T state) {
    if (actions.containsKey(action.runtimeType)) {
      logger.d('$tag => <updateState> => founded action: $action');

      return actions[action.runtimeType]!(action);
    }

    return state;
  }
}
