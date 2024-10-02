// // // import 'package:another_flushbar/flushbar.dart';
// // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // import 'package:easy_localization/easy_localization.dart';
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'package:poscashier/cashier/Modifiers/Model/ModifiersModel.dart';
// // // import 'package:poscashier/cashier/Services/Model/ServicesModel.dart';
// // // import 'package:poscashier/component/appbar.dart';
// // // import 'package:poscashier/createorder/Model/ProductModel.dart';
// // // import 'package:poscashier/createorder/Model/ServicesModel.dart';
// // // import 'package:poscashier/createorder/Model/modifiers_order.dart';
// // // import 'package:poscashier/createorder/Model/new_customer.dart';
// // // import 'package:poscashier/createorder/Model/services_order.dart';
// // // import 'package:poscashier/createorder/cubit/category_cubit.dart';
// // // import 'package:poscashier/createorder/cubit/catgory_state.dart';
// // // import 'package:poscashier/createorder/cubit/createordercubit/create_order_cubit.dart';
// // // import 'package:poscashier/createorder/cubit/createordercubit/create_order_state.dart';
// // // import 'package:poscashier/createorder/presentation/customer_screen.dart';
// // // import 'package:poscashier/createorder/presentation/first_screen.dart';
// // // import 'package:poscashier/createorder/presentation/menuitem.dart';
// // // import 'package:poscashier/unit/utils.dart';
// // // import 'package:gradient_borders/gradient_borders.dart';
// // //
// // //
// // // class createBill extends StatefulWidget {
// // //   const createBill({super.key});
// // //
// // //   @override
// // //   State<createBill> createState() => _createBillState();
// // // }
// // //
// // // class _createBillState extends State<createBill> with TickerProviderStateMixin {
// // //   List<CategoriesOrder> CategoriesItems = [];
// // //   List<String> Categoriestap = [];
// // //   List<Tab> tabs = [];
// // //   List<ServicesModel> services = [];
// // //   var countserv = 0;
// // //   var catitem = 0;
// // //
// // //   List<ServicesModelOrder> servicesAddOrder = [];
// // //
// // //   List<ServicesOrder> serviceinorder = [];
// // //   List<ModifiersOrder> modifiersorder = [];
// // //   List<Modifiers> modifiersAddOrder =[];
// // //   List<Modifiers> modifiers = [];
// // //
// // //   TextEditingController quantityController = TextEditingController();
// // //   TextEditingController emailController = TextEditingController();
// // //   TextEditingController phoneController = TextEditingController();
// // //   TextEditingController quantitymodController = TextEditingController();
// // //   TextEditingController nameNewCustomerController = TextEditingController();
// // //   TextEditingController emailNewCustomerController = TextEditingController();
// // //   TextEditingController phoneNewCustomerController = TextEditingController();
// // //
// // //
// // //   TextEditingController currencyController = TextEditingController();
// // //   TextEditingController optionController = TextEditingController();
// // //
// // //   late int _currentCount;
// // //   late int _currentPosition;
// // //
// // //   late int quan = 0;
// // //
// // //   int current = 0;
// // //   int currentservice = 0;
// // //
// // //   GlobalKey _draggableBottomsheetKey = GlobalKey<_createBillState>();
// // //   double initialBottomSheetSize = 0.1;
// // //   List<MenuItem>? listMenuItem;
// // //   PageController pageController = PageController(initialPage: 0);
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //
// // //     BlocProvider.of<GetCategoryCubit>(context).getAllCategory();
// // //     // BlocProvider.of<CreateOrderCubit>(context).synchronization();
// // //   }
// // //
// // //   final kGradientBoxDecoration = BoxDecoration(
// // //     gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
// // //     border: Border.all(
// // //       color: Colors.black,
// // //     ),
// // //     borderRadius: BorderRadius.circular(32),
// // //   );
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     double h = MediaQuery.of(context).size.height;
// // //     double w = MediaQuery.of(context).size.width;
// // //     return BlocConsumer<GetCategoryCubit, GetCategoryStates>(
// // //         listener: (context, state) {
// // //           if (state is GetCategoryLoadedState) {
// // //             this.catitem = state.cat.length;
// // //           }
// // //           // if(state is CreateOrderLoadedState){
// // //           //   // this.serviceinorder.clear();
// // //           //   Navigator.push(
// // //           //     context,
// // //           //     MaterialPageRoute(
// // //           //       builder: (context) => FirstScreen(),
// // //           //     ),
// // //           //   );
// // //           //   Flushbar(
// // //           //     duration: const Duration(seconds: 3),
// // //           //     backgroundColor: Colors.white,
// // //           //     // backgroundGradient: LinearGradient(
// // //           //     //   colors: [
// // //           //     //     blue300,blue400
// // //           //     //   ],
// // //           //     // ),
// // //           //     messageColor: Colors.black,
// // //           //     messageSize: 18,
// // //           //     message: state.message,
// // //           //   ).show(context);
// // //           // }
// // //         }, builder: (context, state) {
// // //       if (state is GetCategoryLoadedErrorState) {
// // //         return Stack(
// // //           children: [
// // //             appBarWave("", h, w),
// // //
// // //             Container(
// // //               // color: Colors.white,
// // //               margin: EdgeInsets.only(
// // //                 top: h / 8,
// // //               ),
// // //               width: w,
// // //               height: h / 2,
// // //               decoration:const BoxDecoration(
// // //                 // color: new Color(0xffF5591F),
// // //                 image: DecorationImage(
// // //                   fit: BoxFit.cover,
// // //                   image: AssetImage('images/1684527321300.gif'),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         );
// // //       }
// // //       if (state is GetCategoryLoadedState) {
// // //         this.CategoriesItems = state.cat;
// // //         this.tabs = BlocProvider.of<GetCategoryCubit>(context).tabs;
// // //
// // //         if(this.CategoriesItems.isNotEmpty){
// // //           return Scaffold(
// // //             backgroundColor: colorGray,
// // //             body: Stack(
// // //                 children:[
// // //                   Container(
// // //                     decoration: const BoxDecoration(
// // //                       image: DecorationImage(
// // //                         image: AssetImage('images/create-order-2-.jpg'),
// // //                         fit: BoxFit.cover,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   SingleChildScrollView(
// // //                     child:
// // //                     Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: <Widget>[
// // //                         Container(
// // //                           margin: EdgeInsets.all(h * 0.005),
// // //                           width: double.infinity,
// // //                           // height: 100,
// // //                           child: Column(
// // //                             children: [
// // //
// // //
// // //                               SizedBox(height: h * 0.003,),
// // //                               Column(
// // //                                 crossAxisAlignment: CrossAxisAlignment.stretch,
// // //                                 children: [
// // //                                   SingleChildScrollView(
// // //                                     child: GridView.builder(
// // //                                       shrinkWrap: true,
// // //                                       scrollDirection: Axis.vertical,
// // //                                       itemCount: CategoriesItems[current].services.length, gridDelegate:
// // //                                     const SliverGridDelegateWithFixedCrossAxisCount(
// // //                                       crossAxisCount: 2,
// // //                                       childAspectRatio: 0.75,
// // //                                       // crossAxisSpacing: 5,
// // //                                       // mainAxisSpacing: 5,
// // //
// // //                                     ),
// // //                                       itemBuilder: (context, index) {
// // //                                         return GestureDetector(
// // //                                           onTap: () {
// // //                                             setState(() {
// // //                                               currentservice = index;
// // //                                             });
// // //                                             AwesomeDialog(
// // //                                               context: context,
// // //                                               borderSide: const BorderSide(
// // //                                                   color: green300, width: 2),
// // //                                               dialogType: DialogType.NO_HEADER,
// // //                                               showCloseIcon: true,
// // //                                               desc: 'quantity'.tr(),
// // //                                               body: Column(
// // //                                                 children: [
// // //                                                   Text(
// // //                                                     'quantity'.tr(),
// // //                                                   ),
// // //                                                   _box(quantityController,
// // //                                                       TextInputType.number),
// // //                                                 ],
// // //                                               ),
// // //                                               btnCancelOnPress: () {},
// // //                                               btnOkOnPress: () async {
// // //                                                 print("update0001");
// // //                                                 ServicesOrder servin = ServicesOrder(
// // //                                                     service_id: CategoriesItems[current]
// // //                                                         .services[index]
// // //                                                         .id,
// // //                                                     service_name: CategoriesItems[current]
// // //                                                         .services[index]
// // //                                                         .en_service_name,
// // //                                                     price: CategoriesItems[current]
// // //                                                         .services[index]
// // //                                                         .price,
// // //                                                     quantity: int.parse(
// // //                                                         quantityController.text));
// // //                                                 print("LLLLLLLLLLL");
// // //                                                 serviceinorder.add(servin);
// // //                                                 quantityController.clear();
// // //                                                 servicesAddOrder.add(
// // //                                                     CategoriesItems[current]
// // //                                                         .services[index]);
// // //                                                 // quan =0;
// // //                                               },
// // //                                             ).show();
// // //                                             // if(quan != 0) {
// // //                                             // ServicesOrder servin = ServicesOrder(
// // //                                             //     service_id: CategoriesItems[current].services[index].id,
// // //                                             //     service_name: CategoriesItems[current].services[index].en_service_name,
// // //                                             //     price: CategoriesItems[current].services[index].price,
// // //                                             //     quantity: quan
// // //                                             // );
// // //                                             // print("LLLLLLLLLLL");
// // //                                             // serviceinorder.add(servin);
// // //                                             // quantityController.clear();
// // //                                             // servicesAddOrder.add(CategoriesItems[current].services[index]);
// // //                                             // quan =0;
// // //                                             // }
// // //                                           },
// // //                                           onDoubleTap: () {
// // //                                             setState(() {
// // //                                               currentservice = index;
// // //                                             });
// // //                                             showDialog(
// // //                                                 context: context,
// // //                                                 builder: (BuildContext context){
// // //                                                   return AlertDialog(
// // //                                                     content: Container(
// // //                                                       width: double.maxFinite,
// // //                                                       child:ListView.builder(
// // //                                                         padding: const EdgeInsets.only(top: defaultSpacingRad),
// // //                                                         itemCount: CategoriesItems[current].services[currentservice].modifiers!.length,
// // //                                                         // scrollDirection: Axis.vertical,
// // //                                                         shrinkWrap: true,
// // //                                                         physics: const ScrollPhysics(),
// // //                                                         // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //                                                         //   crossAxisCount: itemcount,
// // //                                                         //   childAspectRatio: 3.5,
// // //                                                         //   mainAxisSpacing: 20,
// // //                                                         //   // crossAxisSpacing: 24,
// // //                                                         // ),
// // //                                                         itemBuilder: (BuildContext context, int index) =>
// // //                                                             Column(
// // //                                                               // crossAxisAlignment: CrossAxisAlignment.stretch,
// // //                                                               children: [
// // //                                                                 GestureDetector(
// // //                                                                   onTap: () {
// // //                                                                     AwesomeDialog(
// // //                                                                       context: context,
// // //                                                                       borderSide: const BorderSide(
// // //                                                                           color: green300, width: 2),
// // //                                                                       dialogType: DialogType.NO_HEADER,
// // //                                                                       showCloseIcon: true,
// // //                                                                       desc: 'quantity'.tr(),
// // //                                                                       body: Column(
// // //                                                                         children: [
// // //                                                                           Text(
// // //                                                                             'quantity'.tr(),
// // //                                                                           ),
// // //                                                                           _box(quantitymodController, TextInputType.number),
// // //                                                                         ],
// // //                                                                       ),
// // //                                                                       btnCancelOnPress: () {},
// // //                                                                       btnOkOnPress: () async {
// // //                                                                         print("update0001");
// // //                                                                         ModifiersOrder mod = ModifiersOrder(
// // //                                                                           modifier_id: CategoriesItems[current].services[currentservice].modifiers![index].id,
// // //                                                                           modifier_name: CategoriesItems[current].services[currentservice].modifiers![index].enName,
// // //                                                                           modifier_quantity: int.parse(
// // //                                                                               quantitymodController.text),
// // //                                                                         );
// // //                                                                         print("LLLLLLLLLLL");
// // //                                                                         modifiersorder.add(mod);
// // //                                                                         quantitymodController.clear();
// // //                                                                         modifiersAddOrder.add(
// // //                                                                             CategoriesItems[current].services[currentservice].modifiers![index]);
// // //                                                                       },
// // //                                                                     ).show();
// // //
// // //
// // //                                                                   },
// // //                                                                   child: Container(
// // //                                                                     width: MediaQuery
// // //                                                                         .of(context)
// // //                                                                         .size
// // //                                                                         .width * 0.9,
// // //                                                                     height: MediaQuery
// // //                                                                         .of(context)
// // //                                                                         .size
// // //                                                                         .height * 0.12,
// // //                                                                     decoration: BoxDecoration(
// // //                                                                         color: Colors.white,
// // //                                                                         boxShadow: kElevationToShadow[4]
// // //                                                                     ),
// // //                                                                     child: Row(
// // //                                                                       children: [
// // //                                                                         Expanded(
// // //                                                                           flex: 2,
// // //                                                                           child:
// // //                                                                           FadeInImage(
// // //                                                                             image: NetworkImage(CategoriesItems[current].services[currentservice].modifiers![index].imagePath,),
// // //                                                                             placeholder: const AssetImage(
// // //                                                                                 "images/img/lo.gif"),
// // //                                                                             imageErrorBuilder:
// // //                                                                                 (context, error, stackTrace) {
// // //                                                                               return Image.asset(
// // //                                                                                   'images/1684527321300.gif',
// // //                                                                                   fit: BoxFit.fitWidth);
// // //                                                                             },
// // //                                                                             width: double.infinity,
// // //                                                                             height: MediaQuery
// // //                                                                                 .of(context)
// // //                                                                                 .size
// // //                                                                                 .height * 0.12,
// // //                                                                             fit: BoxFit.fitWidth,
// // //                                                                           ),
// // //                                                                           // Image.network(
// // //                                                                           //   _liststoresItems[index].imagepath,
// // //                                                                           //   width: double.infinity,
// // //                                                                           //   height: MediaQuery
// // //                                                                           //       .of(context)
// // //                                                                           //       .size
// // //                                                                           //       .height * 0.12,
// // //                                                                           //   fit: BoxFit.cover,
// // //                                                                           // ),
// // //                                                                         ),
// // //                                                                         SizedBox(width: MediaQuery
// // //                                                                             .of(context)
// // //                                                                             .size
// // //                                                                             .width * 0.05,),
// // //                                                                         Expanded(
// // //                                                                           flex: 3,
// // //                                                                           child: Container(
// // //                                                                             alignment: Alignment.centerLeft,
// // //                                                                             child: Column(
// // //                                                                               mainAxisAlignment: MainAxisAlignment.center,
// // //                                                                               children: [
// // //                                                                                 if(EasyLocalization.of(context)!.currentLocale == const Locale('ar' , 'AE') )
// // //                                                                                   Text(CategoriesItems[current].services[currentservice].modifiers![index].arName)
// // //                                                                                 else Text(  CategoriesItems[current].services[currentservice].modifiers![index].enName),
// // //                                                                                 SizedBox(height: MediaQuery
// // //                                                                                     .of(context)
// // //                                                                                     .size
// // //                                                                                     .height * 0.015,),
// // //                                                                                 Text(
// // //                                                                                   CategoriesItems[current].services[currentservice].modifiers![index].price.toString(),
// // //                                                                                   textAlign: TextAlign.left,),
// // //                                                                               ],
// // //                                                                             ),
// // //                                                                           ),
// // //                                                                         ),
// // //                                                                       ],
// // //                                                                     ),
// // //                                                                   ),
// // //                                                                 ),
// // //                                                                 const SizedBox(height: defaultSpacingRad,),
// // //                                                               ],
// // //                                                             ),
// // //                                                       ),
// // //                                                     ),
// // //                                                   );
// // //                                                 }
// // //                                             );
// // //                                             print("LDDdddddd");
// // //                                           },
// // //                                           child: Container(
// // //                                             margin:
// // //                                             EdgeInsets.all(h * 0.01 ),
// // //                                             padding:  EdgeInsets.all(h * 0.005),
// // //                                             decoration:  BoxDecoration(
// // //                                               color: Colors.white,
// // //                                               borderRadius:const BorderRadius.all(Radius.circular(defaultSpacing)
// // //                                               ),
// // //                                               boxShadow: [
// // //                                                 BoxShadow(
// // //                                                   color: Colors.grey.withOpacity(0.5),
// // //                                                   spreadRadius: 5,
// // //                                                   blurRadius: 7,
// // //                                                 ),
// // //                                               ],
// // //
// // //                                             ),
// // //                                             child: Column(
// // //                                               mainAxisAlignment: MainAxisAlignment.center,
// // //                                               crossAxisAlignment:
// // //                                               CrossAxisAlignment.center,
// // //                                               children: <Widget>[
// // //                                                 Container(
// // //                                                   width: double.infinity,
// // //                                                   height: h*0.15,
// // //                                                   decoration: BoxDecoration(
// // //                                                     borderRadius:const BorderRadius.all(Radius.circular(defaultSpacing)),
// // //                                                     image: DecorationImage(
// // //                                                         image: NetworkImage(CategoriesItems[current].services[index].imagePath),
// // //                                                         fit: BoxFit.cover
// // //                                                     ),
// // //                                                   ),
// // //                                                   // child: Image(
// // //                                                   //   image: NetworkImage(CategoriesItems[current].services[index].imagePath),
// // //                                                   //   // height: w * 0.9,
// // //                                                   //   fit: BoxFit.cover,
// // //                                                   //   // width: w * 0.05,
// // //                                                   // ),
// // //                                                 ),
// // //
// // //                                                 SizedBox(
// // //                                                   height: h * 0.005,
// // //                                                 ),
// // //
// // //                                                 if(EasyLocalization.of(context)!.currentLocale == const Locale('ar' , 'AE') )
// // //                                                   Text(
// // //                                                       CategoriesItems[current]
// // //                                                           .services[index]
// // //                                                           .ar_service_name,
// // //                                                       style: TextStyle(
// // //                                                           color: Colors.black,
// // //                                                           fontSize: h * 0.015)
// // //                                                   )
// // //                                                 else Text(
// // //                                                     CategoriesItems[current]
// // //                                                         .services[index]
// // //                                                         .en_service_name,
// // //                                                     style: TextStyle(
// // //                                                         color: Colors.black,
// // //                                                         fontSize: h * 0.02)
// // //                                                 ),
// // //                                                 SizedBox(
// // //                                                   height: h * 0.005,
// // //                                                 ),
// // //                                                 Row(
// // //                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                                                   // crossAxisAlignment:
// // //                                                   // CrossAxisAlignment.center,
// // //                                                   children: [
// // //                                                     Column(
// // //                                                       children: [
// // //                                                         Padding(
// // //                                                           padding:  EdgeInsets.only(left: w * 0.009),
// // //                                                           child: Text('price'.tr()),
// // //                                                         ),
// // //                                                         SizedBox(
// // //                                                           height: h * 0.002,
// // //                                                         ),
// // //                                                         Padding(
// // //                                                           padding:  EdgeInsets.only(left: w * 0.009),
// // //                                                           child: Text('stock'.tr()),
// // //                                                         ),
// // //                                                         SizedBox(
// // //                                                           height: h * 0.002,
// // //                                                         ),
// // //                                                         if(CategoriesItems[current]
// // //                                                             .services[index].discount!.isNotEmpty)
// // //                                                           Padding(
// // //                                                             padding:  EdgeInsets.only(left:w * 0.009),
// // //                                                             child: Text('discount'.tr()),
// // //                                                           ),
// // //                                                       ],
// // //                                                     ),
// // //                                                     Column(
// // //                                                       children: [
// // //                                                         Text(
// // //                                                             CategoriesItems[current]
// // //                                                                 .services[index]
// // //                                                                 .price
// // //                                                                 .toString(),
// // //                                                             style: TextStyle(
// // //                                                                 color: Colors.green,
// // //                                                                 fontSize: h * 0.015)),
// // //                                                         SizedBox(
// // //                                                           height: h * 0.002,
// // //                                                         ),
// // //
// // //                                                         Text(
// // //                                                           CategoriesItems[current].services[index].stores![0].instock.toString(),
// // //                                                           style:  TextStyle(
// // //                                                               color: Colors.red,
// // //                                                               fontSize: h * 0.015),
// // //                                                         ),
// // //                                                         SizedBox(
// // //                                                           height: h * 0.002,
// // //                                                         ),
// // //                                                         if(CategoriesItems[current]
// // //                                                             .services[index].discount!.isNotEmpty)
// // //                                                           Text(
// // //                                                             CategoriesItems[current]
// // //                                                                 .services[index].discount![0].disprice.toString(),
// // //                                                             style:  TextStyle(
// // //                                                                 color: Colors.blue,
// // //                                                                 fontSize: h * 0.017),
// // //                                                           ),
// // //                                                       ],
// // //                                                     )
// // //                                                   ],
// // //                                                 ),
// // //
// // //
// // //
// // //                                                 // Row(
// // //                                                 //   children: [
// // //                                                 //     Padding(
// // //                                                 //       padding:  EdgeInsets.only(left: w * 0.009),
// // //                                                 //       child: Text('price'.tr()),
// // //                                                 //     ),
// // //                                                 //     Padding(
// // //                                                 //       padding:const EdgeInsets.symmetric(horizontal: 30),
// // //                                                 //       child: Text(
// // //                                                 //           CategoriesItems[current]
// // //                                                 //               .services[index]
// // //                                                 //               .price
// // //                                                 //               .toString(),
// // //                                                 //           style: TextStyle(
// // //                                                 //               color: Colors.green,
// // //                                                 //               fontSize: h * 0.015)),
// // //                                                 //     ),
// // //                                                 //   ],
// // //                                                 // ),
// // //                                                 //  SizedBox(
// // //                                                 //   height: h * 0.002,
// // //                                                 // ),
// // //                                                 // Row(
// // //                                                 //   children: [
// // //                                                 //     Padding(
// // //                                                 //       padding:  EdgeInsets.only(left: w * 0.009),
// // //                                                 //       child: Text('stock'.tr()),
// // //                                                 //     ),
// // //                                                 //     Padding(
// // //                                                 //       padding:const EdgeInsets.symmetric(
// // //                                                 //           horizontal: 30
// // //                                                 //       ),
// // //                                                 //       child: Text(
// // //                                                 //         CategoriesItems[current].services[index].stores![0].instock.toString(),
// // //                                                 //         style:  TextStyle(
// // //                                                 //             color: Colors.red,
// // //                                                 //             fontSize: h * 0.015),
// // //                                                 //       ),
// // //                                                 //     ),
// // //                                                 //   ],
// // //                                                 // ),
// // //                                                 // // const SizedBox(
// // //                                                 // //   height: 10,
// // //                                                 // // ),
// // //                                                 // if(CategoriesItems[current]
// // //                                                 //     .services[index].discount!.isNotEmpty)
// // //                                                 //   Row(
// // //                                                 //     children: [
// // //                                                 //       Padding(
// // //                                                 //         padding:  EdgeInsets.only(left:w * 0.009),
// // //                                                 //         child: Text('discount'.tr()),
// // //                                                 //       ),
// // //                                                 //       Padding(
// // //                                                 //         padding: const EdgeInsets.symmetric(horizontal: 20) ,
// // //                                                 //         child: Text(
// // //                                                 //           CategoriesItems[current]
// // //                                                 //               .services[index].discount![0].disprice.toString(),
// // //                                                 //           style:  TextStyle(
// // //                                                 //               color: Colors.blue,
// // //                                                 //               fontSize: h * 0.017),
// // //                                                 //         ),
// // //                                                 //       ),
// // //                                                 //     ],
// // //                                                 //   )
// // //                                                 // else Text(""),
// // //
// // //
// // //                                                 ///////
// // //                                                 // Row(
// // //                                                 //   children: [
// // //                                                 //     // Text(
// // //                                                 //     //   CategoriesItems[current]
// // //                                                 //     //       .services[index].discount![0].enname,
// // //                                                 //     //   style: TextStyle(
// // //                                                 //     //       color: Colors.blue,
// // //                                                 //     //       fontSize: 15),
// // //                                                 //     // ),
// // //                                                 //     // SizedBox(width: 2,),
// // //                                                 //     Text(
// // //                                                 //       CategoriesItems[current]
// // //                                                 //           .services[index].discount![0].disprice.toString(),
// // //                                                 //       style: TextStyle(
// // //                                                 //           color: Colors.blue,
// // //                                                 //           fontSize: 15),
// // //                                                 //     ),
// // //                                                 //   ],
// // //                                                 // ),
// // //                                                 // const SizedBox(
// // //                                                 //   height: 4,
// // //                                                 // ),
// // //                                                 // Text("From",
// // //                                                 //     style: TextStyle(
// // //                                                 //         color: Colors.green,
// // //                                                 //         fontSize: 12,
// // //                                                 //         fontWeight: FontWeight.bold)),
// // //                                                 // SizedBox(
// // //                                                 //   height: 4,
// // //                                                 // ),
// // //                                                 // Text(
// // //                                                 //   "Rs. 31.00",
// // //                                                 //   style: TextStyle(
// // //                                                 //       color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
// // //                                                 // ),
// // //                                               ],
// // //                                             ),
// // //                                           ),
// // //                                           // feedback: const SizedBox(
// // //                                           //   height: 100,
// // //                                           //   width: 100,
// // //                                           //   child: Image(
// // //                                           //     image: AssetImage("images/nido.jpg"),
// // //                                           //   ),
// // //                                           // ),
// // //                                         );
// // //                                       },
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                               SizedBox(height: h * 0.005,),
// // //
// // //                             ],
// // //                           ),
// // //                         ),
// // //
// // //                       ],
// // //                     ),
// // //
// // //                   ),
// // //                 ]),
// // //           );
// // //         }
// // //
// // //
// // // //
// // // //
// // // // #####################################################33
// // // //
// // // // import 'dart:convert';
// // // //
// // // // import 'package:another_flushbar/flushbar.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:toy_club_app/constant.dart';
// // // // import 'package:toy_club_app/core/utils/api_service.dart';
// // // // import 'package:toy_club_app/core/widgets/loading_page.dart';
// // // // import 'package:toy_club_app/core/widgets/primary_header_container.dart';
// // // // import 'package:toy_club_app/features/home/data/models/toy_type.dart';
// // // // import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
// // // // import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_state.dart';
// // // // import 'package:toy_club_app/features/home/presentation/views/filters_view.dart';
// // // // import 'package:toy_club_app/features/home/presentation/views/widget/card_view_widget.dart';
// // // // import 'package:toy_club_app/features/srevices/repository.dart';
// // // //
// // // // class HomeView extends StatefulWidget {
// // // //   Repository? repository;
// // // //   HomeView({super.key, this.repository});
// // // //
// // // //   @override
// // // //   State<HomeView> createState() => _HomeViewState();
// // // // }
// // // //
// // // // class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
// // // //
// // // //   late TabController tabController;
// // // //
// // // //
// // // //
// // // //   late List<ToyType> toyType = [];
// // // //   List<Tab> tabs = [];
// // // //
// // // //   // int current = 0;
// // // //   int currentType = 0;
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     BlocProvider.of<HomeCubit>(context).fetchHomeData();
// // // //     updateTabController();
// // // //     // tabController = TabController(length: toyType.length, vsync: this);
// // // //   }
// // // //   @override
// // // //   void dispose() {
// // // //     tabController.dispose();
// // // //     super.dispose();
// // // //   }
// // // //
// // // //
// // // //   void updateTabController() {
// // // //     // Update the TabController if the data changes
// // // //     // tabController.dispose(); // Dispose the old controller
// // // //     tabController = TabController(length: toyType.length, vsync: this);
// // // //   }
// // // //
// // // //   void updateData(List<ToyType> newToyType) {
// // // //     setState(() {
// // // //       toyType = newToyType;
// // // //       tabController.dispose(); // Dispose the old controller
// // // //       updateTabController(); // Reinitialize with the new length
// // // //     });
// // // //   }
// // // //
// // // //   double h = 1;
// // // //   double w = 1;
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     h = MediaQuery.of(context).size.height;
// // // //     w = MediaQuery.of(context).size.width;
// // // //     // TabController tabController = TabController(length: 3, vsync: this);
// // // //     return Scaffold(
// // // //       resizeToAvoidBottomInset: true,
// // // //       extendBodyBehindAppBar: true,
// // // //       body: NestedScrollView(
// // // //           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
// // // //             return <Widget>[];
// // // //           },
// // // //           body: Column(children: [
// // // //             TPrimaryHeaderContainer(
// // // //               w: w,
// // // //               h: h,
// // // //               text: "Home".tr,
// // // //               img: AppImagesAssets.welcomeImg,
// // // //             ),
// // // //             BlocConsumer<HomeCubit, HomeState>(
// // // //               listener: (context, state) {
// // // //                 if (state is HomeFailure) {
// // // //                   Flushbar(
// // // //                     duration: const Duration(seconds: 3),
// // // //                     backgroundColor: Colors.white,
// // // //                     messageColor: Colors.black,
// // // //                     messageSize: h * 0.02,
// // // //                     message: state.errMessage,
// // // //                   ).show(context);
// // // //                 }
// // // //               },
// // // //               builder: (context, state) {
// // // //                 if (state is HomeSuccess) {
// // // //                   toyType = state.toystype;
// // // //                   // tabs = BlocProvider.of<HomeCubit>(context).tabs;
// // // //                   if(toyType.isNotEmpty) {
// // // //                     return Container(
// // // //                       height: h,
// // // //                       child: Column(children: [
// // // //                         Align(
// // // //                           alignment: Alignment.centerRight,
// // // //                           child: TabBar(
// // // //                             controller: tabController,
// // // //                             isScrollable: true,
// // // //                             labelPadding:
// // // //                             EdgeInsets.only(left: w * 0.1, right: w * 0.1),
// // // //                             labelColor: Colors.yellow,
// // // //                             unselectedLabelColor: Color(0x88282827),
// // // //                             indicator: UnderlineTabIndicator(
// // // //                               borderSide:
// // // //                               BorderSide(width: 2.3, color: kPrimaryColor),
// // // //                               insets: EdgeInsets.symmetric(
// // // //                                   horizontal: w * 0.27, vertical: 0),
// // // //                             ),
// // // //                             tabs: List<Widget>.generate(toyType.length, (index){
// // // //                               return Tab(
// // // //                                 child: Text(toyType[index].name),
// // // //                               );
// // // //                               // return Tab(
// // // //                               //     child: Column(
// // // //                               //     children: [
// // // //                               //     GestureDetector(
// // // //                               //     onTap: () {
// // // //                               //   setState(() {
// // // //                               //     currentType = index;
// // // //                               //   });
// // // //                               // },
// // // //                               //     child: AnimatedContainer(
// // // //                               //     duration: const Duration(milliseconds: 300),
// // // //                               // margin: EdgeInsets.all(h * 0.005),
// // // //                               // width: w * 0.3,
// // // //                               // height: h * 0.07,
// // // //                               // decoration: BoxDecoration(
// // // //                               // color: currentType == index ? Colors.white70 : Colors.white54,
// // // //                               // borderRadius: BorderRadius.circular(currentType == index ? 25.0 : 16.0),
// // // //                               // border: currentType == index ? Border.all(color: Colors.green, width: 2) : null,
// // // //                               // ),
// // // //                               //       child: Center(
// // // //                               //         child: Row(
// // // //                               //           mainAxisAlignment: MainAxisAlignment.center,
// // // //                               //           crossAxisAlignment: CrossAxisAlignment.center,
// // // //                               //           children: [
// // // //                               //             Text(
// // // //                               //                 toyType[index].name
// // // //                               //             ),
// // // //                               //           ],
// // // //                               //         ),
// // // //                               //       ),
// // // //                               //     ),
// // // //                               // ),
// // // //                               // // Visibility(
// // // //                               // // visible: currentType == index,
// // // //                               // // child: Container(
// // // //                               // // width: 5,
// // // //                               // // height: 5,
// // // //                               // // decoration: const BoxDecoration(
// // // //                               // // shape: BoxShape.circle,
// // // //                               // // color: Colors.green,
// // // //                               // // ),
// // // //                               // // ),
// // // //                               // // ),
// // // //                               // ],
// // // //                               // ),
// // // //                               // );
// // // //                             }),
// // // //                           ),
// // // //                         ),
// // // //                         // Align(
// // // //                         //   alignment: Alignment.centerRight,
// // // //                         //   child: TabBar(
// // // //                         //     controller: tabController,
// // // //                         //     isScrollable: true,
// // // //                         //     labelPadding:
// // // //                         //     EdgeInsets.only(left: w * 0.1, right: w * 0.1),
// // // //                         //     labelColor: Colors.yellow,
// // // //                         //     unselectedLabelColor: Color(0x88282827),
// // // //                         //     indicator: UnderlineTabIndicator(
// // // //                         //       borderSide:
// // // //                         //       BorderSide(width: 2.3, color: kPrimaryColor),
// // // //                         //       insets: EdgeInsets.symmetric(
// // // //                         //           horizontal: w * 0.27, vertical: 0),
// // // //                         //     ),
// // // //                         //     tabs: [
// // // //                         //       // _tabs.map((title) => Tab(text: title)).toList(),
// // // //                         //
// // // //                         //       Tab(
// // // //                         //           child: Text(
// // // //                         //             "Lego",
// // // //                         //             overflow: TextOverflow.clip,
// // // //                         //             maxLines: 1,
// // // //                         //             style: TextStyle(
// // // //                         //                 fontFamily: Almarai, fontSize: w * 0.04),
// // // //                         //           )),
// // // //                         //       Tab(
// // // //                         //           child: Text(
// // // //                         //             "puzzle",
// // // //                         //             overflow: TextOverflow.clip,
// // // //                         //             maxLines: 1,
// // // //                         //             style: TextStyle(
// // // //                         //                 fontFamily: Almarai, fontSize: w * 0.04),
// // // //                         //           )),
// // // //                         //       Tab(
// // // //                         //           child: Image(
// // // //                         //             width: w * 0.08,
// // // //                         //             image: AssetImage(
// // // //                         //                 "assets/images/Screenshot_20240521_212335-removebg-preview.png"),
// // // //                         //           )),
// // // //                         //     ],
// // // //                         //   ),
// // // //                         // ),
// // // //                         Divider(
// // // //                           color: Colors.yellow,
// // // //                           height: 0,
// // // //                           thickness: 1,
// // // //                         ),
// // // //                         Flexible(
// // // //                           child: Container(
// // // //                             height: h,
// // // //                             child: TabBarView(
// // // //                               controller: tabController,
// // // //                               children:
// // // //                               List<Widget>.generate(toyType.length, (index) {
// // // //                                 // Replace these with your actual content for each tab
// // // //                                 return index == 0 ? GridViewToyItem() : FiltersView();
// // // //                               }),
// // // //                               // [
// // // //                               // GridViewToyItem(),
// // // //                               // // GridViewToyItem(),
// // // //                               // FiltersView(),
// // // //                               // ],
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       ]),
// // // //                     );
// // // //                   }else {
// // // //                     return Container();
// // // //                   }
// // // //                 } else {
// // // //                   return Column(
// // // //                       crossAxisAlignment: CrossAxisAlignment.center,
// // // //                       mainAxisAlignment: MainAxisAlignment.center,
// // // //                       children: [LoadingPage()]);
// // // //                 }
// // // //               },
// // // //             ),
// // // //           ])),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // //
// //
// //
// //
// // ###########
// // import 'dart:convert';
// //
// // import 'package:another_flushbar/flushbar.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:get/get.dart';
// // import 'package:toy_club_app/constant.dart';
// // import 'package:toy_club_app/core/utils/api_service.dart';
// // import 'package:toy_club_app/core/widgets/loading_page.dart';
// // import 'package:toy_club_app/core/widgets/primary_header_container.dart';
// // import 'package:toy_club_app/features/home/data/models/toy_type.dart';
// // import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
// // import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_state.dart';
// // import 'package:toy_club_app/features/home/presentation/views/details_view.dart';
// // import 'package:toy_club_app/features/home/presentation/views/filters_view.dart';
// // import 'package:toy_club_app/features/home/presentation/views/widget/card_view_widget.dart';
// // import 'package:toy_club_app/features/srevices/repository.dart';
// //
// // class HomeView extends StatefulWidget {
// // Repository? repository;
// // HomeView({super.key, this.repository});
// //
// // @override
// // State<HomeView> createState() => _HomeViewState();
// // }
// //
// // class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
// //
// // // late TabController tabController;
// //
// //
// //
// // late List<ToyType> toyType = [];
// // List<Tab> tabs = [];
// //
// // int currentToy = 0;
// // int currentType = 0;
// //
// //
// // @override
// // void initState() {
// // super.initState();
// // BlocProvider.of<HomeCubit>(context).fetchHomeData();
// // // updateTabController();
// // // tabController = TabController(length: toyType.length, vsync: this);
// // }
// // // @override
// // // void dispose() {
// // //   tabController.dispose();
// // //   super.dispose();
// // // }
// //
// //
// // // void updateTabController() {
// // //   // Update the TabController if the data changes
// // //   // tabController.dispose(); // Dispose the old controller
// // //   tabController = TabController(length: toyType.length, vsync: this);
// // // }
// // //
// // // void updateData(List<ToyType> newToyType) {
// // //   setState(() {
// // //     toyType = newToyType;
// // //     tabController.dispose(); // Dispose the old controller
// // //     updateTabController(); // Reinitialize with the new length
// // //   });
// // // }
// //
// // double h = 1;
// // double w = 1;
// // @override
// // Widget build(BuildContext context) {
// // var textDirection = Directionality.of(context);
// // h = MediaQuery.of(context).size.height;
// // w = MediaQuery.of(context).size.width;
// // // TabController tabController = TabController(length: 3, vsync: this);
// // return Scaffold(
// // resizeToAvoidBottomInset: true,
// // extendBodyBehindAppBar: true,
// // body: NestedScrollView(
// // headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
// // return <Widget>[];
// // },
// // body: Column(children: [
// // TPrimaryHeaderContainer(
// // w: w,
// // h: h,
// // text: "Home".tr,
// // img: AppImagesAssets.welcomeImg,
// // ),
// // BlocConsumer<HomeCubit, HomeState>(
// // listener: (context, state) {
// // if (state is HomeFailure) {
// // Flushbar(
// // duration: const Duration(seconds: 3),
// // backgroundColor: Colors.white,
// // messageColor: Colors.black,
// // messageSize: h * 0.02,
// // message: state.errMessage,
// // ).show(context);
// // }
// // },
// // builder: (context, state) {
// // if (state is HomeSuccess) {
// // toyType = state.toystype;
// // // tabs = BlocProvider.of<HomeCubit>(context).tabs;
// // if(toyType.isNotEmpty) {
// // return Column(
// // children : [
// // SizedBox(
// // height: h * 0.09,
// // width: double.infinity,
// // child: ListView.builder(
// // physics: const BouncingScrollPhysics(),
// // itemCount: toyType.length,
// // scrollDirection: Axis.horizontal,
// // itemBuilder: ((ctx, index) {
// // return GestureDetector(
// // onTap: () {
// // setState(() {
// // currentType = index;
// // });
// // },
// // child: Container(
// // margin: EdgeInsets.all(h * 0.005),
// // width: w * 0.3,
// // height: h * 0.09,
// // decoration: BoxDecoration(
// // color: currentType == index
// // ? Colors.white70
// //     : Colors.white54,
// // borderRadius: BorderRadius.circular(
// // currentType == index ? 25 : 16,
// // ),
// // border: currentType == index
// // ? Border.all(color: Colors.green, width: 2)
// //     : null,
// // ),
// // child: Center(
// // child: Text(toyType[index].name),
// // ),
// //
// // )
// // );
// // },
// // ),
// // ),
// //
// //
// // //   Column(
// // //   children: [
// // //     SizedBox(
// // //       height: h * 0.09,
// // //       child: GestureDetector(
// // //         onTap: () {
// // //           setState(() {
// // //             currentType = index;
// // //           });
// // //         },
// // //         child:
// // //         Container(
// // //           margin: EdgeInsets.all(h * 0.005),
// // //           width: w * 0.3,
// // //           height: h * 0.09,
// // //           decoration: BoxDecoration(
// // //             color: currentType == index
// // //                 ? Colors.white70
// // //                 : Colors.white54,
// // //             borderRadius: BorderRadius.circular(
// // //               currentType == index ? 25 : 16,
// // //             ),
// // //             border: currentType == index
// // //                 ? Border.all(color: Colors.green, width: 2)
// // //                 : null,
// // //           ),
// // //           child: Center(
// // //             child: Text(toyType[index].name),
// // //           ),
// // //         ),
// // //         // AnimatedContainer(
// // //         //   duration:const Duration(milliseconds: 300),
// // //         //   margin: EdgeInsets.all(h * 0.005),
// // //         //   width: w * 0.3,
// // //         //   height: h * 0.07,
// // //         //   decoration: BoxDecoration(
// // //         //       color: currentType == index
// // //         //           ? Colors.white70
// // //         //           : Colors.white54,
// // //         //       borderRadius: currentType == index
// // //         //           ? BorderRadius.circular(
// // //         //           25)
// // //         //           : BorderRadius.circular(
// // //         //           16),
// // //         //       border: currentType == index
// // //         //           ? Border.all(
// // //         //           color: Colors.green, width: 2)
// // //         //           : null),
// // //         //   child: Center(
// // //         //
// // //         //     child:
// // //         //     Row(
// // //         //       mainAxisAlignment: MainAxisAlignment.center,
// // //         //       crossAxisAlignment: CrossAxisAlignment.center,
// // //         //       children: [
// // //         //         Text(
// // //         //           toyType[index].name,
// // //         //
// // //         //         )
// // //         //
// // //         //       ],
// // //         //     ),
// // //         //   ),
// // //         // ),
// // //       ),
// // //     ),
// // //     // Visibility(
// // //     //     visible: currentType == index,
// // //     //     child: Container(
// // //     //       width: 5,
// // //     //       height: 5,
// // //     //       decoration:const  BoxDecoration(
// // //     //           shape: BoxShape.circle,
// // //     //           color: Colors.green),
// // //     //     )),
// // //     SizedBox(height: h * 0.003,),
// // // Column(
// // // crossAxisAlignment: CrossAxisAlignment.stretch,
// // // children: [
// // // SingleChildScrollView(
// // //   child:  GridView.builder(
// // //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //           crossAxisCount: 2, childAspectRatio: (w / (h / 1.7))),
// // //       shrinkWrap: true,
// // //       scrollDirection: Axis.vertical,
// // //       physics:  const NeverScrollableScrollPhysics(),
// // //       itemCount: toyType[currentType].toy.length,
// // //       itemBuilder: (BuildContext context, index) {
// // //         return InkWell(
// // //           onTap: () {
// // //             Get.to(DetailsView());
// // //           },
// // //           child: Card(
// // //             clipBehavior: Clip.antiAlias,
// // //             elevation: 5,
// // //             margin: EdgeInsets.only(
// // //               // top: h * 0.0000001,
// // //               bottom: h * 0.03,
// // //               left: w * 0.04,
// // //               right: w * 0.04,
// // //             ),
// // //             shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(24)),
// // //             child: Stack(alignment: Alignment.center, children: [
// // //               Container(
// // //                 decoration: BoxDecoration(
// // //                   image: DecorationImage(
// // //                       image: AssetImage("assets/images/img.png"),
// // //                       fit: BoxFit.cover),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                   right:textDirection==TextDirection.rtl ? w * 0.03 : null,
// // //                   left:textDirection==TextDirection.rtl ?  null:  w * 0.03 ,
// // //                   top: h * 0.015,
// // //                   child: Text(
// // //                     toyType[currentType].toy[index].sub_brand,
// // //                     style:
// // //                     TextStyle(
// // //                         color: Colors.white, fontFamily: Almarai,fontWeight: FontWeight.w600),
// // //                   )),
// // //               Positioned(
// // //                   right:textDirection==TextDirection.rtl ? w * 0.03 : null,
// // //                   left:textDirection==TextDirection.rtl ?  null:  w * 0.03,
// // //                   bottom: 20,
// // //                   // top:100,
// // //                   child: Opacity(
// // //                     opacity: 0.9,
// // //                     child: Container(
// // //                       padding:
// // //                       EdgeInsets.
// // //                       symmetric(
// // //                           horizontal: textDirection==TextDirection.rtl ? w*0.01 : w*0.008 ,
// // //
// // //                           vertical: h*0.005),
// // //                       decoration: BoxDecoration(
// // //                           color: Colors.white24,
// // //                           borderRadius:BorderRadius.circular(18)
// // //                       ),
// // //                       child: Text(
// // //                         toyType[currentType].toy[index].required_points,
// // //                         style:
// // //                         TextStyle(color: Colors.white, fontFamily: Almarai,fontWeight: FontWeight.bold),
// // //                       ),
// // //                     ),
// // //                   )),
// // //             ]),
// // //           ),
// // //         );
// // //       }),
// // // ),
// // // ],
// // // ),
// // //     // Column(
// // //     //   crossAxisAlignment: CrossAxisAlignment.stretch,
// // //     //   children: [
// // //     // Expanded(
// // //           // child:
// // //           // Container(
// // //               // width: double.infinity, // Set a width for the GridView
// // //               // height: h * 0.3,
// // //               // child: GridViewToyItem(toy: toyType[currentType].toy)),
// // //         // ),
// // //     //   ],
// // //     // ),
// // //   ],
// // // );
// // // })),
// // ),
// // ]
// // );
// // }else {
// // return Container();
// // }
// // } else {
// // return Column(
// // crossAxisAlignment: CrossAxisAlignment.center,
// // mainAxisAlignment: MainAxisAlignment.center,
// // children: [LoadingPage()]);
// // }
// // },
// // ),
// // ])),
// // );
// // }
// // }
// //
//
//
//
// ###########
// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:toy_club_app/constant.dart';
// import 'package:toy_club_app/core/widgets/loading_page.dart';
// import 'package:toy_club_app/features/favorite/data/models/favorite_model.dart';
// import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
// import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
// import 'package:toy_club_app/features/home/presentation/views/details_view.dart';
// import 'package:get/get.dart';
//
// class MyListView extends StatefulWidget {
// const MyListView({super.key});
//
// @override
// State<MyListView> createState() => _MyListViewState();
// }
//
// class _MyListViewState extends State<MyListView> {
// double h = 1;
// double w = 1;
//
// int? selectedIdx;
//
// late List<Favorite> favorite =[];
// @override
// void initState() {
// // TODO: implement initState
// super.initState();
// BlocProvider.of<FavoriteCubit>(context).fetchFavoriteData();
// }
//
// var select ;
//
// @override
// Widget build(BuildContext context) {
// h = MediaQuery.of(context).size.height;
// w = MediaQuery.of(context).size.width;
// return Scaffold(
// body: BlocConsumer<FavoriteCubit,FavoriteState>(
// listener: (context, state){
// if (state is FavoriteFailure) {
// Flushbar(
// duration: const Duration(seconds: 3),
// backgroundColor: Colors.white,
// messageColor: Colors.black,
// messageSize: h * 0.02,
// message: state.errMessage,
// ).show(context);
// }
// },
// builder: (context, state) {
// if (state is FavoriteSuccess) {
// this.favorite = state.favorite;
// return  ListView.separated(
// itemBuilder: (BuildContext context, int index) {
// // final bool isSelected = index == selectedIdx;
// return InkWell(
// onTap: () {
// // Get.to(DetailsView(toy : favorite[index].toy));
// },
// child: Container(
// margin: EdgeInsets.only(
// // top: h * 0.0000001,
// bottom: h * 0.03,
// left: w * 0.04,
// right: w * 0.04,
// ),
//
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// ClipRRect(
// child: Image.asset(
// AppImagesAssets.welcomeImg,
// fit: BoxFit.cover,
// height: h * 0.09,
// width: w * 0.18,
// ),
// borderRadius: BorderRadius.circular(20),
// ),
// SizedBox(width: w * 0.05,),
// Expanded(
// flex: 2,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(favorite[index].toy.brand, style: TextStyle(
// fontSize: w * 0.05,
// fontWeight: FontWeight.bold,
// color: Color(0x88282827),)),
// Text(favorite[index].toy.set_number, style: TextStyle(
// fontSize: w * 0.04, color: Color(0x88282827),)),
// // Text('التقييم ', style: TextStyle(
// //   fontSize: w * 0.03, color: Color(0x88282827),)),
// ],
// ),
// ),
// SizedBox(width: w * 0.15,),
// BlocConsumer<FavoriteCubit, FavoriteState>(
// listener: (context, state){
// if (state is FavoriteDSuccess){
// // setState({
// this.favorite = state.favorite;
// select = null;
// // Navigator.pushAndRemoveUntil(
// //   context,
// //   MaterialPageRoute(
// //     builder: (context) => StartScreen(
// //       repository: widget.repository,
// //     ),
// //   ),
// //   ModalRoute.withName('/homeView'), // Replace this with your root screen's route name (usually '/')
// // );
// // });
// Flushbar(
// duration: const Duration(seconds: 3),
// backgroundColor: Colors.white,
// messageColor: Colors.black,
// messageSize: h * 0.02,
// message:  " delete from favorite ",
// ).show(context);
// }
// if (state is FavoriteDFailure) {
// debugPrint("kkkLoginFailure");
// Flushbar(
// duration: const Duration(seconds: 3),
// backgroundColor: Colors.white,
// messageColor: Colors.black,
// messageSize: h * 0.02,
// message:  state.errMessage,
// ).show(context);
// // Navigator.pop(context);
// }
// },
// builder: (context, state){
// if (state is FavoriteDLoading && select == index) {
// return
// Expanded(
// flex: 1,
// child: GestureDetector(
// onTap: () {
// // BlocProvider.of<FavoriteCubit>(context).deleteFavoriteToy(favorite[index].toy.id);
// },
// child: CircularProgressIndicator(color: Color(
// 0xff6b70b0),),
// ),
// );
//
//
// }else {
// return  Expanded(
// flex: 1,
// child: GestureDetector(
// onTap: () {
// setState((){
// select = index;
// });
// BlocProvider.of<FavoriteCubit>(context).deleteFavoriteToy(favorite[index].id);
// },
// child: Icon(
// Icons.delete,
// color: Colors.red,
// size: w * 0.06,
// ),
// ),
// );
// }
//
// }
// ),
//
// ],
// ),
// ),
// );
// },
// separatorBuilder: (BuildContext context, int index) =>
// Divider(
// color: Color(0xffeeeded),
// height: h * 0.1,
// thickness: 2,
// ),
// itemCount: favorite.length);
// }
// else {
// return LoadingPage();
// }
// }),
//
//
// );
// }
// }
