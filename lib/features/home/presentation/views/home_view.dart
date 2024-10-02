import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/core/widgets/loading_page.dart';
import 'package:toy_club_app/core/widgets/primary_header_container.dart';
import 'package:toy_club_app/features/home/data/models/toy_type.dart';
import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:toy_club_app/features/home/presentation/views/details_view.dart';
import 'package:toy_club_app/features/home/presentation/views/filters_view.dart';
import 'package:toy_club_app/features/home/presentation/views/widget/card_view_widget.dart';
import 'package:toy_club_app/features/srevices/repository.dart';

class HomeView extends StatefulWidget {
  Repository? repository;
  HomeView({super.key, this.repository});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  // late TabController tabController;



  late List<ToyType> toyType = [];
  List<Tab> tabs = [];

  int currentToy = 0;
  int currentType = 0;


  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).fetchHomeData();
    // updateTabController();
    // tabController = TabController(length: toyType.length, vsync: this);
  }
  // @override
  // void dispose() {
  //   tabController.dispose();
  //   super.dispose();
  // }


  // void updateTabController() {
  //   // Update the TabController if the data changes
  //   // tabController.dispose(); // Dispose the old controller
  //   tabController = TabController(length: toyType.length, vsync: this);
  // }
  //
  // void updateData(List<ToyType> newToyType) {
  //   setState(() {
  //     toyType = newToyType;
  //     tabController.dispose(); // Dispose the old controller
  //     updateTabController(); // Reinitialize with the new length
  //   });
  // }

  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    var textDirection = Directionality.of(context);
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[];
          },
          body: Column(children: [
            TPrimaryHeaderContainer(
              w: w,
              h: h,
              text: "Home".tr,
              img: AppImagesAssets.welcomeImg,
            ),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeFailure) {
                  Flushbar(
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.white,
                    messageColor: Colors.black,
                    messageSize: h * 0.02,
                    message: state.errMessage,
                  ).show(context);
                }
              },
              builder: (context, state) {
                if (state is HomeSuccess) {
                  toyType = state.toystype;
                  // tabs = BlocProvider.of<HomeCubit>(context).tabs;
                  if (toyType.isNotEmpty) {
                    return Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.08,
                            width: double.infinity,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: toyType.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentType = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(h * 0.005),
                                    width: w * 0.3,
                                    height: h * 0.09,
                                    decoration: BoxDecoration(
                                      color: currentType == index
                                          ? Colors.white70
                                          : Colors.white54,
                                      borderRadius: BorderRadius.circular(
                                        currentType == index ? 25 : 16,
                                      ),
                                      border: currentType == index
                                          ? Border.all(color: Color(0x24A4B4EC), width: 2)
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(toyType[index].name),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: h * 0.001),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: (w / (h / 1.7)),
                              ),
                              itemCount: toyType[currentType].toy.length,
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(DetailsView(toy : toyType[currentType].toy[index]));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 5,
                                    margin: EdgeInsets.symmetric(
                                      vertical: h * 0.006,
                                      horizontal: w * 0.008,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/img.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: textDirection == TextDirection.rtl ? w * 0.03 : null,
                                          left: textDirection == TextDirection.rtl ? null : w * 0.03,
                                          top: h * 0.015,
                                          child: Text(
                                            toyType[currentType].toy[index].brand,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: Almarai,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: textDirection == TextDirection.rtl ? w * 0.03 : null,
                                          left: textDirection == TextDirection.rtl ? null : w * 0.03,
                                          bottom: 20,
                                          child: Opacity(
                                            opacity: 0.9,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: textDirection == TextDirection.rtl ? w * 0.01 : w * 0.008,
                                                vertical: h * 0.005,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white24,
                                                borderRadius: BorderRadius.circular(18),
                                              ),
                                              child: Text(
                                                toyType[currentType].toy[index].required_points.toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: Almarai,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Center(child: LoadingPage());
                }
              },
            ),
          ],
          ),
      ),
    );
  }
}