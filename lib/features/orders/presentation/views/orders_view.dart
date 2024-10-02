import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/loading_page.dart';
import 'package:toy_club_app/core/widgets/primary_header_container.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';
import 'package:toy_club_app/features/orders/presentation/manager/ordre_cubit/order_cubit.dart';
import 'package:toy_club_app/features/orders/presentation/manager/ordre_cubit/order_state.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  double h = 1;
  double w = 1;
  int? selectedIdx;

  late List<OrderS> orders =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<OrderCubit>(context).fetchOrderData();
  }

  int count = 0;


  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      Column(
        children: [
        TPrimaryHeaderContainer(
        w: w,
        h: h,
        text: "Orders".tr + "  " ,//+ count.toString(),
        img: AppImagesAssets.detailAppBar,
      ),
      BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state){
          if (state is OrderFailure) {
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
          if (state is OrderSuccess) {
            // setState(() {
            //   this.count = orders.length;
            // });
            this.orders = state.orderS;
            // setState({
            //   this.count = orders.length;
            // });
            return Flexible(
                    child: ListView.separated(
                      itemCount: orders.length,
                        itemBuilder: (BuildContext context, int index) {
                          final bool isSelected = index == selectedIdx;
                          return InkWell(
                            onLongPress: (){
                              setState(() {
                                selectedIdx=isSelected?null :index;
                                // items.removeAt(index);
                              });
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
                                      height:h*0.09,
                                      width:w*0.18,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  SizedBox(width: w*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(orders[index].toy_id.toString(), style: TextStyle(fontSize: w*0.05, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                                      Text('الفئة + رقم القطعة', style: TextStyle(fontSize: w*0.04,color: Color(0x88282827),)),
                                      Text('التقييم ', style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                                    ],
                                  ),
                                  SizedBox(width: w*0.15,),
                                  // Container(
                                  //   decoration: isSelected? BoxDecoration(
                                  //     border: Border.all(color: Colors.red,width:w*0.03),
                                  //     borderRadius: BorderRadius.circular(8)
                                  //   ):BoxDecoration(),
                                  // )

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
                        )



            );
          }  else {
            return  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
            [
              LoadingPage()
            ] );
          }
        },
      ),





    ],
      ),
    );
  }
}
