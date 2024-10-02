import 'package:flutter/material.dart';

class LoadingButtom extends StatefulWidget {
  const LoadingButtom({Key? key}) : super(key: key);

  @override
  State<LoadingButtom> createState() => _LoadingButtomState();
}

class _LoadingButtomState extends State<LoadingButtom> {
  double h =1;
  double w=1 ;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return  Container(
      width: double.infinity,
      height: h * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        color: const Color(0x24A4B4EC),

      ),
      child: const Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(color: Color(
              0xff6b70b0),)),
    );
  }
}
