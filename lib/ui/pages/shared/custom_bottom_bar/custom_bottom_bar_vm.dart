import 'package:music_player/models/dto/album_dto.dart';
import 'package:music_player/models/pages/interfaces/i_page_data.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/store/shared/route_navigator/route_selectors.dart';
import 'package:redux/redux.dart';

class CustomBottomBarVM {
  final void Function() goToSearchPage;
  final void Function() goToHomePage;

  CustomBottomBarVM({
    required this.goToSearchPage,
    required this.goToHomePage,
  });

  static CustomBottomBarVM fromStore(Store<AppState> store) {
    return CustomBottomBarVM(
   goToSearchPage: RouteSelectors.goToSearchPage(store),
   goToHomePage: RouteSelectors.goToHomePage(store),
    );
  }
}
