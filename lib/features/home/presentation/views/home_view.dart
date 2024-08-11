import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/primary_header_container.dart';
import 'package:toy_club_app/features/home/presentation/views/filters_view.dart';
import 'package:toy_club_app/features/home/presentation/views/widget/card_view_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[];
          },
          body: Column(children: [
            TPrimaryHeaderContainer(
              w: w,
              h: h,
              text: "Home".tr,
              img: AppImagesAssets.welcomeImg,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
                labelColor: Colors.yellow,
                unselectedLabelColor: Color(0x88282827),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.3, color: kPrimaryColor),
                  insets:
                      EdgeInsets.symmetric(horizontal: w * 0.27, vertical: 0),
                ),
                tabs: [
                  Tab(
                      child: Text(
                    "Lego",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(fontFamily: Almarai, fontSize: w * 0.04),
                  )),
                  Tab(
                      child: Text(
                    "puzzle",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(fontFamily: Almarai, fontSize: w * 0.04),
                  )),
                  Tab(
                      child: Image(
                    width: w * 0.08,
                    image: AssetImage(
                        "assets/images/Screenshot_20240521_212335-removebg-preview.png"),
                  )),
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
                    GridViewToyItem(),
                    GridViewToyItem(),
                    FiltersView(),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
//    Stack(alignment: Alignment.bottomLeft, children: [
//      DefaultTabController(
//     length: 3,
//     child: TabBar(
//       // controller: tabcontroller,
//       labelColor: Colors.yellow,
//       indicatorColor: kPrimaryColor,
//       unselectedLabelColor: Color(0x88282827),
//       indicatorWeight: 3,
//       indicator: UnderlineTabIndicator(
//         borderSide: BorderSide(width: 2.3, color: kPrimaryColor),
//         insets:
//             EdgeInsets.symmetric(horizontal: w * 0.27, vertical: 0),
//       ),
//       tabs: [
//         Tab(
//           child: Text(
//             "فلترة",
//             overflow: TextOverflow.clip,
//             maxLines: 1,
//             style: TextStyle(fontFamily: Almarai, fontSize: w * 0.04),
//           ),
//         ),
//         Tab(
//           child: Text(
//             "Lego",
//             overflow: TextOverflow.clip,
//             maxLines: 1,
//             style: TextStyle(fontFamily: Almarai, fontSize: w * 0.04),
//           ),
//         ),
//         Tab(
//           child: Text(
//             "Buzzl",
//             overflow: TextOverflow.clip,
//             maxLines: 1,
//             style: TextStyle(fontFamily: Almarai, fontSize: w * 0.04),
//           ),
//         ),
//       ],
//     ),
//
//   ),
//   // Positioned(
//   //   child: Divider(
//   //     color: Colors.yellow,
//   //     height: 0,
//   //     thickness: 1,
//   //   ),
//   // ),
//   // SizedBox(height: 0.03,),
//   // Expanded(
//   //   child: TabBarView(
//   //     // controller: tabcontroller,
//   //     children: [
//   //       // GridViewToyItem(),
//   //       // GridViewToyItem(),
//   //       // GridViewToyItem()
//   //       Text("data1"),
//   //       Text("data2"),
//   //       Text("data3"),
//   //       // ReadBook(),
//   //       // ReturnBook(),
//   //       // BorrowBook(),
//   //     ],
//   //   ),
//   // ),
// ]),
// SizedBox(height: 0.03,),
//   Expanded(
//   child: TabBarView(
//     controller: tabcontroller,
//     children: [
//       // GridViewToyItem(),
//       // GridViewToyItem(),
//       // GridViewToyItem()
//       Text("data1"),
//       Text("data2"),
//       Text("data3"),
//       // ReadBook(),
//       // ReturnBook(),
//       // BorrowBook(),
//     ],
//   ),
// ),

// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: SizedBox(
//     height: h * 0.07,
//     child: Row(
//       // mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         MaterialButton(
//           onPressed: () {
//             Get.to(() => FiltersView());
//           },
//           child: Container(
//
//             margin: EdgeInsets.only(
//               top: h * 0.006,
//               bottom: h * 0.01,
//               left: w * 0.01,
//               right: w * 0.01,
//             ),
//             padding: EdgeInsets.only(
//               top: h * 0.006,
//               bottom: h * 0.007,
//               left: w * 0.02,
//               right: w * 0.02,
//             ),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/adjust.png'),
//                   fit: BoxFit.cover),
//               // backgroundBlendMode: AssetImage(Image.asset("assets/images/adjust.png"),),
//               border: Border.all(
//                 color: Colors.grey,
//                 width: 1,
//               ),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(17),
//             ),
//             child:
//                 Image.asset("assets/images/adjust.png",
//                   // Icon(Icons.setting_, color: Color(0x88282827)),
//             ),
//
//             // MaterialButton(
//             //     onPressed: () {},
//             //     shape: RoundedRectangleBorder(
//             //         borderRadius: BorderRadius.circular(20)),
//             //     color: Colors.white,
//             //     textColor: Color(0x88282827),
//             //     child: Center(child: Icon(Iconsax.filter))),
//           ),
//         ),
//         ListView.builder(
//             shrinkWrap: true,
//             itemCount: ToyType.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (_, index) {
//               return MaterialButton(
//                 onPressed: () {
//                   print("object");
//                 },
//               shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Container(
//                     margin: EdgeInsets.only(
//                       top: h * 0.006,
//                       bottom: h * 0.01,
//                       left: w * 0.01,
//                       right: w * 0.01,
//                     ),
//                     padding: EdgeInsets.only(
//                       top: h * 0.01,
//                       bottom: h * 0.004,
//                       left: w * 0.05,
//                       right: w * 0.05,
//                     ),
//                     decoration: BoxDecoration(
//                       // boxShadow: ,
//                       color: Colors.white,
//                       border: Border.all(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(17),
//                     ),
//                     child: Text(
//                       "${ToyType[index]}",
//                       style: TextStyle(
//                         color: Color(0x88282827),
//                         fontSize: w * 0.04,
//                       ),
//                     )
//                     // MaterialButton(
//                     //   onPressed: () {},
//                     //   shape: RoundedRectangleBorder(
//                     //       borderRadius: BorderRadius.circular(20)),
//                     //   // padding: const EdgeInsets.symmetric(vertical: 13),
//                     //   color: Colors.white,
//                     //   textColor: Color(0x88282827),
//                     //   child: Center(
//                     //     child: Text("${ToyType[index]}"),
//                     //   ),
//                     // ),
//                     ),
//               );
//             }),
//
//       ],
//     ),
//   ),
// ),
// Text("data"),
// SizedBox(height: h*0.02,),
//     Text("data"),
// GridView.builder(
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2
//     ),
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     itemCount: 10,
//     itemBuilder: (BuildContext context, index) {
//       return InkWell(
//         onTap: (){
//           print("object card");
//         },
//         child: Card(
//               margin:EdgeInsets.only(
//                 // top: h * 0.0000001,
//                 bottom: h * 0.03,
//                 left: w * 0.04,
//                 right: w * 0.04,
//               ) ,
//       shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24)),
//         ),
//       );
//     })
