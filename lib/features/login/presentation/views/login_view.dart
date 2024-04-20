import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/auth/custom_textform_auth.dart';
import 'package:toy_club_app/features/home/presentation/views/home_view.dart';
import 'package:toy_club_app/features/login/presentation/views/widgets/custom_button_auth.dart';
import 'package:toy_club_app/features/login/presentation/views/widgets/logo_auth.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric( horizontal: 30),
          child: ListView(
            children:  [
            const LogoAuth(),
           const  CustomTextFormAuth(
                hintText: 'أدخل بريدك الالكتروني',
                labeltext: 'البريد الالكتروني',
                iconData: Icons.email_outlined,
                // mycontroller: null,
              ),

            const  CustomTextFormAuth(
                hintText: "أدخل كلمة المرور",
                labeltext: "كلمة المرور",
                iconData: Icons.lock_outline,
                // mycontroller: null,
              ),
              CustomButtonAuth(text: 'تسجيل دخول',onPressed: (){Get.to(HomeView());},),
            ],
          ),
        ),
      ),
    );
  }
}
