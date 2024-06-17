import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/features/signup/presentation/views/signup_view.dart';

class CustomButtonWelcome extends StatefulWidget {
  final IconData prefixIcon;
  final String text;
  final VoidCallback? onPressed;
  const CustomButtonWelcome(
      {super.key,
      required this.prefixIcon,
      required this.text,
      this.onPressed});

  @override
  State<CustomButtonWelcome> createState() => _CustomButtonWelcomeState();
}

class _CustomButtonWelcomeState extends State<CustomButtonWelcome> {
  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Container(
      margin:  EdgeInsets.only(
          // top: h*0.02,
          // bottom: h*0.02,
          left: w*0.04,right: w*0.04),
      // all(h*0.01),
      padding:  EdgeInsets.only(top: h*0.02,bottom: h*0.02,left: w*0.05,right: w*0.05),
      // all(h*0.02),
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(widget.prefixIcon,color: Color(0x88282827),), // Prefix icon
           SizedBox(width: w*0.02),
          Expanded(
            child: Text(
              widget.text,
              style:  TextStyle(fontSize: w*0.045, fontWeight: FontWeight.w400),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.arrow_forward_ios), onPressed: widget.onPressed),
        ],
      ),
    );
  }
}
