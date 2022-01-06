// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:music_player/res/app_styles/app_colors.dart';
// import 'package:music_player/res/app_styles/app_text_styles.dart';
// import 'package:music_player/store/application/app_state.dart';
// import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
// import 'package:music_player/ui/pages/main_page/main_page_vm.dart';
// import 'package:music_player/ui/pages/main_page/widgets/custom_app_bar.dart';
// import 'package:music_player/ui/pages/main_page/widgets/custom_tab.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
//   late TabController _tabController;
//   late TabController _newTabController;
//   Color tabColor = AppColors.green;
//   List<String> name = ['Playlists', 'Albums', 'Downloaded', 'Singers'];
//   int selectedTab = 0;
//   int lengthOfTabs = 5;
//   double movePadding = 0.0;
//   bool selected = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
//     _newTabController = TabController(length: 5, vsync: this);
//     _tabController.addListener(() {
//       setState(() {
//         selected = false;
//         movePadding = (_tabController.index - 1) * 95.0;
//       });
//       _tabController.index = 1;
//     });
//     _newTabController.addListener(() {
//       setState(() {
//         selected = true;
//         movePadding = 0.0;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     _newTabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, MainPageVM>(
//         onInitialBuild: (MainPageVM vm) => vm.getChart(),
//         converter: MainPageVM.fromStore,
//         builder: (BuildContext context, MainPageVM vm) {
//           return MainLayout(
//             customAppBar: NestedScrollView(
//               headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//                 return <Widget>[
//                   SliverAppBar(
//                     backgroundColor: AppColors.black,
//                     floating: true,
//                     snap: true,
//                     pinned: true,
//                     bottom: PreferredSize(
//                       preferredSize: Size(0, kToolbarHeight),
//                       child: Theme(
//                         data: ThemeData(
//                           highlightColor: AppColors.transparent,
//                           splashColor: AppColors.transparent,
//                         ),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: TabBar(
//                             onTap: (index) {
//                               setState(() {
//                                 if (lengthOfTabs == 2) {
//                                   if (index == 1) {
//                                     return;
//                                   } else {
//                                     lengthOfTabs = 5;
//                                   }
//                                 } else {
//                                   selectedTab = index;
//                                   lengthOfTabs = 2;
//                                 }
//                               });
//                             },
//                             isScrollable: true,
//                             indicatorSize: TabBarIndicatorSize.label,
//                             controller: lengthOfTabs == 2 ? _tabController : _newTabController,
//                             labelColor: AppColors.white,
//                             unselectedLabelColor: AppColors.white,
//                             labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             indicatorColor: AppColors.transparent,
//                             indicatorPadding: EdgeInsets.only(top: 9.0, bottom: lengthOfTabs == 2 ? 10.0 : 10.0),
//                             labelStyle: AppTextStyles.s12fw400White,
//                             indicator: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             tabs: lengthOfTabs != 2
//                                 ? List.generate(
//                                     name.length + 1,
//                                     (int index) {
//                                       return index == 0
//                                           ? SizedBox()
//                                           : Tab(
//                                               child: CustomTab(
//                                                 label: name[index - 1],
//                                               ),
//                                             );
//                                     },
//                                   )
//                                 : [
//                                     Tab(
//                                       child: Container(
//                                         height: 30.0,
//                                         alignment: Alignment.center,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(20.0),
//                                           border: Border.all(color: AppColors.greyLight),
//                                         ),
//                                         child: Icon(
//                                           Icons.close,
//                                           color: AppColors.white,
//                                         ),
//                                       ),
//                                     ),
//                                     AnimatedPadding(
//                                       duration: Duration(seconds: 3),
//                                       curve: Curves.elasticIn,
//                                       padding: EdgeInsets.only(left: movePadding),
//                                       child: CustomTab(
//                                         label: name[selectedTab - 1],
//                                         borderColor: AppColors.green,
//                                         tabColor: AppColors.green,
//                                       ),
//                                     ),
//                                   ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ];
//               },
//               body: TabBarView(
//                 controller: lengthOfTabs == 2 ? _tabController : _newTabController,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: lengthOfTabs == 2
//                     ? [
//                         SizedBox(),
//                         SizedBox(),
//                       ]
//                     : [
//                         ListView.builder(
//                             itemCount: vm.chart.length,
//                             itemBuilder: (BuildContext ctx, int index) {
//                               return Container(
//                                 height: 70.0,
//                                 margin: const EdgeInsets.all(20.0),
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 15.0),
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                             vm.chart[index].title,
//                                             style: AppTextStyles.s14fw500White,
//                                           ),
//                                           Text(
//                                             vm.chart[index].artist,
//                                             style: AppTextStyles.s12fw400GreyLight,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                         ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext ctx, int index) {
//                               return SizedBox();
//                             }),
//                         SizedBox(),
//                         SizedBox(),
//                         SizedBox(),
//                       ],
//               ),
//             ),
//           );
//         });
//   }
// }
