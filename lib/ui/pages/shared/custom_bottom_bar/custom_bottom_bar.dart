import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_gradient.dart';
import 'package:music_player/store/application/app_state.dart';

import 'custom_bottom_bar_vm.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CustomBottomBarVM>(
      converter: CustomBottomBarVM.fromStore,
      builder: (BuildContext context, CustomBottomBarVM vm) {
        return Container(
          height: 50.0,
          decoration: BoxDecoration(gradient: AppGradient.bottomBarGradient),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => vm.goToHomePage(),
                child: Icon(
                  Icons.home_outlined,
                  color: AppColors.white,
                ),
              ),
              InkWell(
                onTap: () => vm.goToSearchPage(),
                child: Icon(
                  Icons.search,
                  color: AppColors.white,
                ),
              ),
              Icon(
                Icons.my_library_books_sharp,
                color: AppColors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
