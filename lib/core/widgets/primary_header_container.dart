import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/t_curved_edget_widget.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.w,
    required this.h, required this.text, required this.img,
    // required this.child,
  });

  final double w;
  final double h;
  final String text;
  final String img;
  // final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgetWidget(
      w: w,
      h: h,
      child: Container(
          color: kPrimaryColor,
          padding: const EdgeInsets.only(bottom: 0),
          child: Stack(
              children: [


            Positioned(
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                    width: w,
                    height: h * 0.11,
                  ),
                ),
              ),
            ),
                Positioned(top:h*0.04,
                  right: w*0.025,
                  child: Text(text,style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.w600),),), // child
          ])),
    );
  }
}
