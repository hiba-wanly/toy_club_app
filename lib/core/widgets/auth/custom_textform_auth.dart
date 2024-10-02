import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatefulWidget {
  final String hintText;
  final String labeltext;
  final IconData? iconData;
  final TextEditingController mycontroller;
  TextInputType textInputType;
  bool pass;
  bool ispassword ;
   CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
        required this.textInputType,
        required this.pass,
        required this.ispassword,
      });

  @override
  State<CustomTextFormAuth> createState() => _CustomTextFormAuthState();
}

class _CustomTextFormAuthState extends State<CustomTextFormAuth> {
  double h =1;
  double w=1 ;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: h*0.05),
      child: TextFormField(
        controller: widget.mycontroller,
        style: TextStyle(
          fontSize: w*0.05,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'الحقل مطلوب';
          }
          if(widget.mycontroller=="emailController"){
            if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
              return 'enter valid email address';
            }
          }
          if(widget.mycontroller=="usernameController"){
            if(value!.length <4){
              return 'user name must be at least 4 characters long';
            }
          }
          return null;
        },
        keyboardType: widget.textInputType,
        obscureText: widget.pass ? widget.ispassword : false,
        decoration: InputDecoration(
          hintText:widget.hintText,
          hintStyle:  TextStyle(fontSize:  w*0.035,),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:  EdgeInsets
              .symmetric(vertical: h*0.03, horizontal: w*0.03),
          label: Container(
              margin:  EdgeInsets.symmetric(horizontal:  w*0.04),
              child:  Text(
               widget.labeltext,
                style: TextStyle(fontSize:  w*0.05),
              )),
          prefixIcon:  Icon(widget.iconData),
          border: OutlineInputBorder(
            borderSide:const BorderSide( color:Color(0xffbdb9b9)),
            borderRadius: BorderRadius.circular(30),
          ),
            suffixIcon: widget.pass
                ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.ispassword = !widget.ispassword;
                  });
                },
                icon: Icon(
                  widget.ispassword ? Icons.visibility_off : Icons.visibility,
                  size: MediaQuery.of(context).size.height * 0.02,
                ))
                : null
        ),
      ),
    );
  }
}
