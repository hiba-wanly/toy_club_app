import 'package:flutter/material.dart';

class BoxController extends StatelessWidget {
  TextEditingController controller;
  double h;
  double w;
  TextInputType textInputType;

  BoxController({Key? key, required this.controller, required this.h, required this.w, required this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: w,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        // autocorrect: false,
        controller: controller,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
          fontSize: h * 0.018,
          fontWeight: FontWeight.w500,
          // letterSpacing: 0.1,
        ),
        keyboardType: textInputType,
        onFieldSubmitted: (val) {
          debugPrint(val);
        },
        validator: (value) {
          if(value!.isEmpty){
            return "الحقل مطلوب";
          }
          return null;
        },
        cursorHeight: 0,
        cursorWidth: 0,
        maxLines: 1,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          // hoverColor: greybox,
          contentPadding:EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
