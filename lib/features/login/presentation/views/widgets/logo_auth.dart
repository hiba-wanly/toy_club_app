import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 40,left: 40,right: 40),
      child: ClipRRect(
          borderRadius:
          const  BorderRadius.all(Radius.circular(145)), // Image radius
          child: Image.asset(
            AppImagesAssets.logo,
            height: 250,
            width: 170,
            fit: BoxFit.cover,
          )),
    );
  }
}
