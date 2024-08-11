import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/t_curved_edget_widget.dart';
import 'package:toy_club_app/features/login/presentation/views/login_view.dart';
import 'package:toy_club_app/features/signup/presentation/views/signup_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:toy_club_app/features/welcome/presentation/views/widgets/custom_button_welcome.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  double h = 1;
  double w = 1;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TCurvedEdgetWidget(
              w: w,
              h: h,
              child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    // height: 400,
                    // width: double.infinity,
                    child: ClipRRect(
                      child: Image.asset(
                        AppImagesAssets.welcomeImg,
                        fit: BoxFit.cover,
                        width: w,
                        height: h * 0.4,
                      ),
                    ),
                  )),
            ),
            Text(
              "Welcome to Lego Store".tr,
              style: TextStyle(
                fontSize: w * 0.08,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: h * 0.07),
            CustomButtonWelcome(
                prefixIcon: Icons.account_circle_outlined,
                text: "login into account".tr,
                onPressed: () {
                  Get.to(const LoginView());
                }),
            SizedBox(height: h * 0.02),
            CustomButtonWelcome(
              prefixIcon: Icons.person_add,
              text: "Registration".tr,
              onPressed: () {
                Get.to(const SignUpView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
