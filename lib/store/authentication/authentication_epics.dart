import 'package:music_player/config/app_router.dart';
import 'package:music_player/repositories/authentication_repository/authentication_repository.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/authentication/authentication_actions.dart';
import 'package:music_player/store/loader/loader_actions.dart';
import 'package:music_player/store/loader/loader_state.dart';
import 'package:music_player/ui/shared/loader_dialog.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:auto_route/auto_route.dart';

class AuthenticationEpics {
  static final indexEpic = combineEpics<AppState>([
    getUserLogin,
    registerUserWithEmail,
  ]);

  static Stream<dynamic> getUserLogin(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<LoginWithEmailAction>().switchMap((action) async* {
      yield* Stream.value(
        StartLoadingAction(
          loader: LoaderDialog(
            state: true,
            loaderKey: LoaderKey.initializationLoading,
          ),
        ),
      );
      final String? token = await AuthenticationRepository.instance.loginWithEmail(action);
      print(token);
      if (token!.isEmpty) {
        return;
      }
      yield SaveUserAction(
        token: token,
      );
      yield* Stream.value(StopLoadingAction(loaderKey: LoaderKey.global));
      yield router.navigatorKey.currentContext!.replaceRoute(HomeRoute());
    });
  }

  static Stream<dynamic> registerUserWithEmail(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<RegisterWithEmailAction>().switchMap((action) async* {
      final String? token = await AuthenticationRepository.instance.registerWithEmail(action);
      if (token!.isEmpty) {
        return;
      }
      yield SaveUserAction(
        token: token,
      );
      yield router.navigatorKey.currentContext!.replaceRoute(HomeRoute());
    });
  }
}
