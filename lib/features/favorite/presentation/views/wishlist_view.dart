import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/primary_header_container.dart';
import 'package:toy_club_app/features/favorite/presentation/views/friendslist_tabbar_view.dart';
import 'package:toy_club_app/features/favorite/presentation/views/mylist_tabbar_view.dart';
class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> with TickerProviderStateMixin{
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
    resizeToAvoidBottomInset: true,
    extendBodyBehindAppBar: true,
    body:NestedScrollView(
        headerSliverBuilder:
    (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
      ];
    },
    body: Column(
      children: [
        TPrimaryHeaderContainer(
          w: w,
          h: h,
          text: "favorite".tr,
          img: AppImagesAssets.detailAppBar,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TabBar(
            controller: tabController,
            labelColor: Color(0xff545353),
            unselectedLabelColor: Color(0xB6B9B9B9),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.3, color: kPrimaryColor),
              insets:
              EdgeInsets.symmetric(horizontal: w * 0.27, vertical: 0),
            ),
            tabs: [
              Tab(
                  child: Text(
                    "my list".tr ,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(fontFamily: Almarai, fontSize: w * 0.05),
                  )),
              // Tab(
              //     child: Text(
              //       "friend's list".tr,
              //       overflow: TextOverflow.clip,
              //       maxLines: 1,
              //       style: TextStyle(fontFamily: Almarai, fontSize: w * 0.05),
              //     )),

            ],
          ),
        ),
        Divider(
          color: Colors.yellow,
          height: 0,
          thickness: 1,
        ),
        Flexible(
          child: Container(
            height: h,
            child: TabBarView(
              controller: tabController,
              children: [
                MyListView(),
                // FriendsListView()

              ],
            ),
          ),
        ),
      ],
    ),)
    );
  }
}
