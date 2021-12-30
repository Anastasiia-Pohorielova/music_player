import 'package:flutter/material.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int pageIndex = 0;
  double valueCarousel = 0.0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        valueCarousel = scrollController.offset;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      customAppBar: const SizedBox(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300.0,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (ctx, index) {
                return VisibilityDetector(
                  key: Key(index.toString()),
                  onVisibilityChanged: (VisibilityInfo info) {
                    setState(() {
                      if (info.visibleFraction == 1.0) {
                        pageIndex = index;
                        valueCarousel = 0.0;
                        print(pageIndex);
                        print(valueCarousel);
                      }
                    });
                  },
                  child: Container(
                    height: 300.0,
                    width: 300.0,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    color: AppColors.greyDark,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
          ),
          SizedBox(
            height: 12.0,
            child: Stack(
              children: [
                Positioned(
                  left: pageIndex != 4 ? 12.0 * pageIndex + valueCarousel/50.0 : 17.0 * 5,
                  child: Container(
                    width: valueCarousel > 0.0 ? 0.0 + valueCarousel/50.0 : 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), color: AppColors.green),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), color: AppColors.green),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
