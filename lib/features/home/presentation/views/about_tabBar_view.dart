import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/box_controller.dart';
import 'package:toy_club_app/core/widgets/primary_header_container.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:toy_club_app/features/orders/presentation/manager/ordre_cubit/order_cubit.dart';
import 'package:toy_club_app/features/orders/presentation/manager/ordre_cubit/order_state.dart';

import '../../data/models/toys_model.dart';

class AboutTabBar extends StatefulWidget {
  Toys toy;
   AboutTabBar({super.key ,required this.toy});

  @override
  State<AboutTabBar> createState() => _AboutTabBarState();
}

class _AboutTabBarState extends State<AboutTabBar> {
  double h = 1;
  double w = 1;
  final int availability=0;
  late final PageController pageController;
  int pageNumber =0;
   Timer? carasoulTimer;
  Timer getTimer(){
    return Timer.periodic(const Duration(seconds: 3),
            (timer) {
                if(pageNumber==5){
                  pageNumber=0;
                }
                pageController.animateToPage(pageNumber,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInCirc);
                pageNumber++;
            });
  }

  @override
  void initState() {
    pageController=PageController(
      initialPage: 0,
      viewportFraction: 0.85
    );
    carasoulTimer=getTimer();
    super.initState();
  }
  var formkey = GlobalKey<FormState>();

  TextEditingController numofDayController = TextEditingController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          SizedBox(
            height: h*0.31,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index){
                pageNumber=index;
                setState(() {

                });
              },
              itemBuilder: (_,index){
              return AnimatedBuilder(
                  animation: pageController,
                  builder: (context,child){
                    return child!;
                  },
              child: GestureDetector(
                onTap: (){

                },
                onPanDown: (d){
                  carasoulTimer?.cancel();
                  carasoulTimer=null;
                },
                onPanCancel: (){
                  carasoulTimer=getTimer();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: h*0.03,
                    bottom:  h*0.03,
                    left:  w*0.05,
                    // right:  w*0.02,
                  ),
                  height: h*0.03,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color:  Colors.grey,
                  ),
                ),
              ),
              );
            },
            itemCount: 5,),
          ),
          // SizedBox(height: h*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(5, (index) => Container(
              margin: EdgeInsets.all(2),
              child: Icon(Icons.circle,size: w*0.02,
              color: pageNumber==index? Colors.indigoAccent : Colors.grey.shade300,),
            ))
          ),
          SizedBox(height: h*0.02,),
          Text(widget.toy.brand,style: TextStyle(
              fontSize: 0.05 * w,
              fontWeight: FontWeight.w500,
              fontFamily: Almarai,
              color: Color(0x88282827),
          ),),
          SizedBox(height: h*0.01,),
          Text(
            widget.toy.sub_brand ?? "",
            style: TextStyle(
            fontSize: 0.04 * w,
            fontWeight: FontWeight.w500,
            fontFamily: Almarai,
            color: Color(0x88282827),
          ),),
          SizedBox(height: h*0.02,),
          Row(
            children: [
              Expanded(
                child: Text(widget.toy.required_points.toString()+" نقطة ",style: TextStyle(
                  fontSize: 0.035 * w,
                  fontWeight: FontWeight.w500,
                  fontFamily: Almarai,
                  color: Colors.black,
                ),),
              ),
              Expanded(
                child :      BlocConsumer<FavoriteCubit, FavoriteState>(
                    listener: (context, state){
                      if (state is FavoriteSuccess){
                        Flushbar(
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          messageColor: Colors.black,
                          messageSize: h * 0.02,
                          message:  " add to favorite ",
                        ).show(context);
                      }
                      if (state is FavoriteFailure) {
                        debugPrint("kkkLoginFailure");
                        Flushbar(
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          messageColor: Colors.black,
                          messageSize: h * 0.02,
                          message:  state.errMessage,
                        ).show(context);
                        // Navigator.pop(context);
                      }
                    },
                    builder: (context, state){
                      if (state is FavoriteLoading) {
                        return

                          GestureDetector(
                            onTap: () {
                            },
                            child: CircularProgressIndicator(color: Color(
                                0xff6b70b0),),
                            // ),
                          );


                      }else {
                        return
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<FavoriteCubit>(context)
                                  .addFavoriteToy({
                                "toy_id": widget.toy.id
                              });},
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: w * 0.06,
                            ),
                            // ),
                          );

                      }

                    }
                )
              )
            ],
          ),
          SizedBox(height: h*0.02,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // This will space out the sections evenly across the main axis
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('no rate', style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                      Text("rate", style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.toy.number_of_pieces.toString(), style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                      Text("number of pieces".tr, style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.toy.age.toString(), style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                      Text("age".tr, style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.toy.set_number.toString(), style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                      Text("item".tr, style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: h*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // This will space out the sections evenly across the main axis
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(widget.toy.theme, style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                      Text("theme", style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.toy.price.toString(), style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                      Text("price".tr, style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.toy.number_of_boxes.toString(), style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                      Text("number_of_boxes", style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.toy.weight_of_boxes.toString(), style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                      Text("weight_of_boxes", style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height:  h*0.02,),
          Expanded(
            child: SingleChildScrollView(
              padding:  EdgeInsets.only(left: 0.05 * w, right: 0.05 * w),
              child: Text(
                widget.toy.description,
              style: TextStyle(
                fontFamily: Almarai,
                fontSize: w*0.04,
                color: Color(0x88282827),
              ),),

            ),

          ),


        ],
      ),
      bottomNavigationBar:  Container(

        margin:
        EdgeInsets.only(bottom: w*0.04,left: 0.04 * w, right: 0.04 * w, top: 0.015 * h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // BlocConsumer<FavoriteCubit, FavoriteState>(
            //     listener: (context, state){
            //       if (state is FavoriteSuccess){
            //         Flushbar(
            //           duration: const Duration(seconds: 3),
            //           backgroundColor: Colors.white,
            //           messageColor: Colors.black,
            //           messageSize: h * 0.02,
            //           message:  " add to favorite ",
            //         ).show(context);
            //       }
            //       if (state is FavoriteFailure) {
            //         debugPrint("kkkLoginFailure");
            //         Flushbar(
            //           duration: const Duration(seconds: 3),
            //           backgroundColor: Colors.white,
            //           messageColor: Colors.black,
            //           messageSize: h * 0.02,
            //           message:  state.errMessage,
            //         ).show(context);
            //         // Navigator.pop(context);
            //       }
            //     },
            //     builder: (context, state){
            //       if (state is FavoriteLoading) {
            //         return   MaterialButton(
            //           onPressed: () {},
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20)),
            //           color: availability==0? Color(0xfff8f8f8) : Colors.yellow,
            //           // Colors.yellow,.
            //           textColor: Colors.black,
            //           child: CircularProgressIndicator(color: Color(
            //               0xff6b70b0),),
            //         );
            //
            //       }else {
            //         return
            //           MaterialButton(
            //             onPressed: () {},
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(20)),
            //             color: availability==0? Color(0xfff8f8f8) : Colors.yellow,
            //             // Colors.yellow,.
            //             textColor: Colors.black,
            //             child: Text(
            //               "the game is available ,book now! ".tr,
            //               style: TextStyle(
            //                   fontSize: 0.035 * w,
            //                   fontWeight: FontWeight.w500,
            //                   fontFamily: Almarai),
            //             ),
            //           );
            //
            //       }
            //
            //     }
            // ),

            BlocConsumer<OrderCubit, OrderState>(
                listener: (context, state){
                  if (state is OrderSuccess){
                    Flushbar(
                      duration: const Duration(seconds: 3),
                      backgroundColor: Colors.white,
                      messageColor: Colors.black,
                      messageSize: h * 0.02,
                      message:  " added to order ",
                    ).show(context);
                  }
                  if (state is OrderFailure) {
                    debugPrint("kkkLoginFailure");
                    Flushbar(
                      duration: const Duration(seconds: 3),
                      backgroundColor: Colors.white,
                      messageColor: Colors.black,
                      messageSize: h * 0.02,
                      message:  state.errMessage,
                    ).show(context);
                    // Navigator.pop(context);
                  }
                },
                builder: (context, state){
                  if (state is OrderLoading) {
                    return   MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: availability==0? Color(0xfff8f8f8) : Colors.yellow,
                      // Colors.yellow,.
                      textColor: Colors.black,
                      child: CircularProgressIndicator(color: Color(
                          0xff6b70b0),),
                    );

                  }else {
                    return
                      MaterialButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2),
                            dialogType:
                            DialogType.noHeader,
                            showCloseIcon: true,
                            body: Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  Text("number_of_days", style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                                  BoxController(
                                    controller:
                                    numofDayController,
                                    // label : "",
                                    textInputType:
                                    TextInputType
                                        .text,
                                    h: h,
                                    w: w,
                                  ),
                                ],
                              ),
                            ),
                            btnCancelOnPress: () {},

                            btnOkOnPress: () {
                              debugPrint("update0001");
                              if (formkey.currentState!
                                  .validate() //&&
                              ) {
                                BlocProvider.of<OrderCubit>(context)
                                    .addOrder({
                                  "toy_id": widget.toy.id ,
                                  "number_of_days": numofDayController.text
                                });
                              }
                            },
                          ).show();

                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: availability==0? Color(0xfff8f8f8) : Colors.yellow,
                        textColor: Colors.black,
                        child: Text(
                          "Add to order",
                          style: TextStyle(
                              fontSize: 0.035 * w,
                              fontWeight: FontWeight.w500,
                              fontFamily: Almarai),
                        ),
                      );

                  }

                }
            ),


          ],
        ),
      ),
    );
  }
}
