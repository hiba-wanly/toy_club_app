import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';

class LogoAuth extends StatefulWidget {
  const LogoAuth({super.key});

  @override
  State<LogoAuth> createState() => _LogoAuthState();
}

class _LogoAuthState extends State<LogoAuth> {
  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return  Container(
      padding:  EdgeInsets
          .only(
          bottom: MediaQuery.of(context).size.height * 0.04,
          left: MediaQuery.of(context).size.width * 0.15,
          right: MediaQuery.of(context).size.width * 0.15),

      // .only(bottom: 40,left: 40,right: 40),
      child: ClipRRect(
          borderRadius:
          const  BorderRadius.all(Radius.circular(145)), // Image radius
          child: Image.asset(
            AppImagesAssets.logo,
            height: h*0.269,
            // 250,
            // width:w*0.5,
            // 170,
            fit: BoxFit.cover,
          )),
    );
  }
}
