import 'package:music_player/store/application/app_state.dart';
import 'package:redux/redux.dart';

class IViewModel {
  static IViewModel fromStore(Store<AppState> store) {
    return IViewModel();
  }
}
