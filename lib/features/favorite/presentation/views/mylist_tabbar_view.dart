import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/utils/navigation_menu.dart';
import 'package:toy_club_app/core/widgets/loading_page.dart';
import 'package:toy_club_app/features/favorite/data/models/favorite_model.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/delete_favorite_cubit.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/delete_favorite_state.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:toy_club_app/features/home/presentation/views/details_view.dart';
import 'package:get/get.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  double h = 1;
  double w = 1;

  int? selectedIdx;

  late List<Favorite> favorite =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FavoriteCubit>(context).fetchFavoriteData();
  }

  var select ;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<FavoriteCubit,FavoriteState>(
        listener: (context, state){
      if (state is FavoriteFailure) {
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
      if (state is FavoriteSuccess) {
        this.favorite = state.favorite;
        return  ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  // final bool isSelected = index == selectedIdx;
                  return InkWell(
                    onTap: () {
                      // Get.to(DetailsView(toy : favorite[index].toy));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        // top: h * 0.0000001,
                        bottom: h * 0.03,
                        left: w * 0.04,
                        right: w * 0.04,
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              AppImagesAssets.welcomeImg,
                              fit: BoxFit.cover,
                              height: h * 0.09,
                              width: w * 0.18,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          SizedBox(width: w * 0.05,),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(favorite[index].toy.brand, style: TextStyle(
                                  fontSize: w * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0x88282827),)),
                                Text(favorite[index].toy.set_number, style: TextStyle(
                                  fontSize: w * 0.04, color: Color(0x88282827),)),
                                // Text('التقييم ', style: TextStyle(
                                //   fontSize: w * 0.03, color: Color(0x88282827),)),
                              ],
                            ),
                          ),
                          SizedBox(width: w * 0.15,),
                          Expanded(
                            flex: 1,
                 child:   BlocConsumer<FavoriteDCubit, FavoriteDState>(
                        listener: (context, state){
                          if (state is FavoriteDSuccess){
                            // setState({
                            this.favorite = state.favorite;
                            select = null;
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => NavigationMenu(),
                            //   ),
                            //   ModalRoute.withName('/homeView'), // Replace this with your root screen's route name (usually '/')
                            // );
                            // });
                            Flushbar(
                              duration: const Duration(seconds: 3),
                              backgroundColor: Colors.white,
                              messageColor: Colors.black,
                              messageSize: h * 0.02,
                              message:  " delete from favorite ",
                            ).show(context);
                          }
                          if (state is FavoriteDFailure) {
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
                          if (state is FavoriteDLoading && select == index) {
                            return
                              // Expanded(
                              //   flex: 1,
                              //   child:
                          GestureDetector(
                                  onTap: () {
                                    // BlocProvider.of<FavoriteCubit>(context).deleteFavoriteToy(favorite[index].toy.id);
                                  },
                                  child: CircularProgressIndicator(color: Color(
                                      0xff6b70b0),),
                                // ),
                              );


                          }else {
                            return
                              // Expanded(
                              // flex: 1,
                              // child:
                              GestureDetector(
                                onTap: () {
                                  setState((){
                                    select = index;
                                  });
                                  BlocProvider.of<FavoriteDCubit>(context).deleteFavoriteToy(favorite[index].id);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: w * 0.06,
                                ),
                              // ),
                            );
                          }

                        }
                    ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(
                      color: Color(0xffeeeded),
                      height: h * 0.1,
                      thickness: 2,
                    ),
                itemCount: favorite.length);
      }
      else {
        return LoadingPage();
      }
    }),


    );
  }
}
