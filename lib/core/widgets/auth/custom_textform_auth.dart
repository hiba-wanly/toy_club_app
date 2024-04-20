import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labeltext;
  final IconData? iconData;
  // final TextEditingController mycontroller;
  const CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.labeltext,
      required this.iconData,
      // required this.mycontroller
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        // controller: mycontroller,
        style:const TextStyle(
          fontSize: 22,
        ),
        decoration: InputDecoration(
          hintText:hintText,
          hintStyle: const TextStyle(fontSize: 14,),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child:  Text(
               labeltext,
                style:const TextStyle(fontSize: 18),
              )),
          prefixIcon:  Icon(iconData),
          border: OutlineInputBorder(
            borderSide:const BorderSide( color:Color(0xffbdb9b9)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
