import 'package:music_player/store/loader/loader_actions.dart';
import 'package:music_player/store/loader/loader_state.dart';
import 'package:redux/redux.dart';

final loaderReducer = combineReducers<LoaderState>([
  TypedReducer<LoaderState, StartLoadingAction>(_startLoading),
  TypedReducer<LoaderState, StopLoadingAction>(_stopLoading),
  TypedReducer<LoaderState, ShimmerLoadingAction>(_changeShimmerState),
]);

LoaderState _startLoading(LoaderState state, StartLoadingAction action) {
  final int index = state.loaders!.indexWhere((e) => e.loaderKey == action.loader.loaderKey);

  if (index == -1) {
    return state.copyWith(
      loaders: state.loaders!..add(action.loader),
    );
  }

  return state;
}

LoaderState _stopLoading(LoaderState state, StopLoadingAction action) {
  return state.copyWith(
    loaders: state.loaders!..removeWhere((loader) => loader.loaderKey == action.loaderKey),
  );
}

LoaderState _changeShimmerState(LoaderState state, ShimmerLoadingAction action) {
  return state.copyWith(isShimmer: action.isLoading);
}

