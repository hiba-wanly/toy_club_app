import 'package:flutter/material.dart';

class CustomButtomLang extends StatelessWidget {
 final String text;
 final void Function()? onPressed;
  const CustomButtomLang({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color:Color(0xff989898) ,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(text,style: TextStyle(
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
