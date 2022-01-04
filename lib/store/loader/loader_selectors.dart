
import 'package:music_player/services/dialog_service/interfaces/i_loader.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/shared/loader_dialog.dart';
import 'package:redux/redux.dart';

import 'loader_actions.dart';
import 'loader_state.dart';

class LoaderSelectors {
  static List<ILoader>? getLoaders(Store<AppState> store) {
    return store.state.loaderState.loaders;
  }

  static bool getShimmer(Store<AppState> store) {
    return store.state.loaderState.isShimmer;
  }

  static bool getIsRefreshActive(Store<AppState> store) {
    return store.state.loaderState.isRefreshLoaderActive;
  }

  static bool getValueForLoadingKey(Store<AppState> store, LoaderKey loaderKey) {
    final int index = store.state.loaderState.loaders!.indexWhere((loader) => loader.loaderKey == loaderKey);

    return index != -1;
  }

  static void Function(bool) changeShimmerState(Store<AppState> store) {
    return (bool isLoading) => store.dispatch(ShimmerLoadingAction(isLoading: isLoading));
  }

  static void Function() getShowSharedLoaderFunction(Store<AppState> store) {
    return () => store.dispatch(
          StartLoadingAction(
            loader: LoaderDialog(
              state: true,
              loaderKey: LoaderKey.initializationLoading,
            ),
          ),
        );
  }

  static void Function() getCloseSharedLoaderFunction(Store<AppState> store) {
    return () => store.dispatch(StopLoadingAction(loaderKey: LoaderKey.initializationLoading));
  }
}
