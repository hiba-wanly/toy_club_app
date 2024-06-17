import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/utils/navigation_menu.dart';
import 'package:toy_club_app/core/widgets/auth/custom_textform_auth.dart';
import 'package:toy_club_app/features/home/presentation/views/home_view.dart';
import 'package:toy_club_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:toy_club_app/features/login/presentation/manager/login_cubit/login_state.dart';
import 'package:toy_club_app/features/login/presentation/views/widgets/custom_button_auth.dart';
import 'package:toy_club_app/features/login/presentation/views/widgets/logo_auth.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  double h =1;
  double w=1 ;

  bool ispassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "تسجيل دخول",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey),
          ),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          padding:  EdgeInsets
              .only(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),

          // symmetric( horizontal: 30),

          child: ListView(
            children:  [
            const LogoAuth(),
             CustomTextFormAuth(
                hintText: "أدخل اسم المستخدم او البريد الالكتروني",
                labeltext: 'اسم المستخدم',
                iconData: Icons.email_outlined,
                mycontroller: emailController,
                 textInputType: TextInputType.emailAddress,
                 pass: false,
                 ispassword: ispassword,
              ),

              CustomTextFormAuth(
                hintText: "أدخل كلمة المرور",
                labeltext: "كلمة المرور",
                iconData: Icons.lock_outline,
                mycontroller: passwordcontroller,
                textInputType: TextInputType.visiblePassword,
                pass: true,
                ispassword: ispassword,
              ),

              // BlocConsumer<LoginCubit, LoginState>(
              //     listener: (context, state) {
              //       if (state is LoginSuccess) {
              //         Get.to(HomeView());
              //       }
              //       if(state is LoginFailure){
              //         debugPrint("kkkLoginFailure");
              //         Flushbar(
              //           duration: const Duration(seconds: 3),
              //           backgroundColor: Colors.white,
              //           messageColor: Colors.black,
              //           messageSize: h * 0.02,
              //           message: "لا يمكن اتمام العملية الأن",
              //         ).show(context);
              //         // Navigator.pop(context);
              //       }
              //     }, builder: (context, state) {
              //   if (state is LoginLoading) {
              //     return   Container(
              //       width: double.infinity,
              //       height: h * 0.06,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //
              //         color: const Color(0x24A4B4EC),
              //
              //       ),
              //       child: const Align(
              //           alignment: Alignment.center,
              //           child: CircularProgressIndicator(color: Color(
              //               0xff6b70b0),)),
              //     );
              //   }
              //   else {
              //     return CustomButtonAuth(
              //       text: 'تسجيل دخول',
              //       onPressed: () {
              //         if (formkey.currentState!.validate()) {
              //           BlocProvider.of<LoginCubit>(context).fetchLoginData(
              //               {
              //                 'email':emailController.text,
              //                 'password':passwordcontroller.text
              //               });
              //         }
              //       },
              //
              //     );
              //   }
              // }
              // ),

              CustomButtonAuth(text: 'تسجيل دخول',onPressed: (){Get.to(NavigationMenu());},),


            ],
          ),
        ),
      ),
    );
  }
}
