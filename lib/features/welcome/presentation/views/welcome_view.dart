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

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
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
                  'أهلا بك في نادي الألعاب',
                  style: TextStyle(
                    fontSize: w * 0.08,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: h * 0.07),
                CustomButtonWelcome(
                    prefixIcon: Icons.account_circle_outlined,
                    text: "تسجيل الدخول باستخدام حسابك",
                    onPressed: () {
                      Get.to(const LoginView());
                    }),
                SizedBox(height: h * 0.02),
                CustomButtonWelcome(
                  prefixIcon: Icons.person_add,
                  text: "انشاء حساب جديد",
                  onPressed: () {
                    Get.to(const SignUpView());
                  },
                ),
              ],
            ),
          ),
        )

        // Stack(
        //   children: <Widget>[
        //     Positioned(
        //       top: 0,
        //       child: ClipRRect(
        //         // borderRadius: const BorderRadius.only(
        //         //     bottomRight: Radius.circular(400)), // Image radius
        //         child: Image.asset(
        //           AppImagesAssets.welcomeImg,
        //           fit: BoxFit.cover,
        //           width: w,
        //           height: h * 0.49,
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //       top: h * 0.4,
        //       child: Container(
        //         width:w,
        //         height: h * 0.49,
        //         decoration: const BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.only(
        //                 topLeft: Radius.circular(40),
        //                 topRight: Radius.circular(40))),
        //         padding:
        //              EdgeInsets.symmetric(
        //                 horizontal: w*0.09, vertical: h*0.04),
        //                 // horizontal: 12, vertical: 8),
        //         child: SingleChildScrollView(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //            Text   ( 'أهلا بك في نادي الألعاب',
        //                    style:  TextStyle(
        //                       fontSize: w*0.08,
        //                       fontWeight: FontWeight.w500,
        //                     ),),
        //               SizedBox(height:h*0.07),
        //
        //               // AnimatedTextKit(
        //               //   animatedTexts: [
        //               //     TypewriterAnimatedText(
        //               //       'أهلا بك في نادي الألعاب',
        //               //       textStyle:  TextStyle(
        //               //         fontSize: w*0.4,
        //               //         fontWeight: FontWeight.w500,
        //               //       ),
        //               //       speed: const Duration(
        //               //           milliseconds: 200), // Adjust the typing speed
        //               //     ),
        //               //   ],
        //               //   totalRepeatCount:
        //               //       4, // Number of times the animation should repeat
        //               //   pause: const Duration(
        //               //       milliseconds: 1000), // Pause between animations
        //               //   displayFullTextOnTap:
        //               //       true, // Tapping the animation completes it
        //               //   stopPauseOnTap: true, // Pause stops when tapped
        //               // ),
        //               CustomButtonWelcome(
        //                   prefixIcon: Icons.account_circle_outlined,
        //                   text: "تسجيل الدخول باستخدام حسابك",
        //                   onPressed: () {
        //                     Get.to(const LoginView());
        //                   }),
        //               SizedBox(height:h*0.02),
        //               CustomButtonWelcome(
        //                 prefixIcon: Icons.person_add,
        //                 text: "انشاء حساب جديد",
        //                 onPressed: () {
        //                   Get.to(const SignUpView());
        //                 },
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // )

        // Column(
        //   children: [
        //     Container(
        //       child: ClipRRect(
        //         borderRadius: const BorderRadius.only(
        //             bottomRight: Radius.circular(60)), // Image radius
        //         child: Image.asset(
        //          AppImagesAssets.welcomeImg,
        //           fit: BoxFit.cover,
        //           width: MediaQuery.of(context).size.width,
        //           height: MediaQuery.of(context).size.height * 0.49,
        //         ),
        //       ),
        //     ),
        //     Container(
        //       decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
        //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //       child: Column(
        //         children: [
        //           AnimatedTextKit(
        //             animatedTexts: [
        //               TypewriterAnimatedText(
        //                 'أهلا بك في نادي الألعاب',
        //                 textStyle: const TextStyle(
        //                   fontSize: 40,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //                 speed: const Duration(
        //                     milliseconds: 200), // Adjust the typing speed
        //               ),
        //             ],
        //             totalRepeatCount:
        //                 4, // Number of times the animation should repeat
        //             pause: const Duration(
        //                 milliseconds: 1000), // Pause between animations
        //             displayFullTextOnTap:
        //                 true, // Tapping the animation completes it
        //             stopPauseOnTap: true, // Pause stops when tapped
        //           ),
        //           CustomButtonWelcome(
        //               prefixIcon: Icons.account_circle_outlined,
        //               text: "تسجيل الدخول باستخدام حسابك",
        //               onPressed: () {
        //                 Get.to(const LoginView());
        //               }),
        //           CustomButtonWelcome(
        //             prefixIcon: Icons.person_add,
        //             text: "انشاء حساب جديد",
        //             onPressed: () {
        //               Get.to(const RegisterationView());
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
