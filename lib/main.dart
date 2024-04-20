import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/features/welcome/presentation/views/welcome_view.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(toyClub());
}

class toyClub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          fontFamily: "Almarai",
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Lego Store',
        home:const Scaffold(
          body: WelcomeView()
        ));
  }
}
