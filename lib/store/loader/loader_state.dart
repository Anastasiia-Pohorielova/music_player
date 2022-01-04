import 'package:flutter/cupertino.dart';
import 'package:music_player/services/dialog_service/interfaces/i_loader.dart';

enum LoaderKey {
  global,
  initializationLoading,
}

class LoaderState {
  List<ILoader>? loaders;
  bool isShimmer;
  bool isRefreshLoaderActive;

  LoaderState({
    required this.loaders,
    required this.isShimmer,
    required this.isRefreshLoaderActive,
  });

  factory LoaderState.initial() {
    return LoaderState(
      loaders: <ILoader>[],
      isShimmer: false,
      isRefreshLoaderActive: false,
    );
  }

  LoaderState copyWith({
    List<ILoader>? loaders,
    bool? isShimmer,
    bool? isSearchLoader,
    bool? isRefreshLoaderActive,
  }) {
    return LoaderState(
      loaders: loaders ?? this.loaders,
      isShimmer: isShimmer ?? this.isShimmer,
      isRefreshLoaderActive: isRefreshLoaderActive ?? this.isRefreshLoaderActive,
    );
  }
}
