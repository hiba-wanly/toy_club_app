import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/features/login/presentation/views/login_view.dart';
import 'package:toy_club_app/features/signup/presentation/views/signup_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:toy_club_app/features/welcome/presentation/views/widgets/custom_button_welcome.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: ClipRRect(
                // borderRadius: const BorderRadius.only(
                //     bottomRight: Radius.circular(400)), // Image radius
                child: Image.asset(
                  AppImagesAssets.welcomeImg,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.49,
                ),
              ),
            ),
            Positioned(
              top:MediaQuery.of(context).size.height *0.43 ,
              child:
              Container( width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.49,

                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)
                      )
                ),
                padding:const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'أهلا بك في نادي الألعاب',
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                          speed: const Duration(
                              milliseconds: 200), // Adjust the typing speed
                        ),
                      ],
                      totalRepeatCount:
                          4, // Number of times the animation should repeat
                      pause: const Duration(
                          milliseconds: 1000), // Pause between animations
                      displayFullTextOnTap:
                          true, // Tapping the animation completes it
                      stopPauseOnTap: true, // Pause stops when tapped
                    ),
                    CustomButtonWelcome(
                        prefixIcon: Icons.account_circle_outlined,
                        text: "تسجيل الدخول باستخدام حسابك",
                        onPressed: () {
                          Get.to(const LoginView());
                        }),
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
          ],
        )

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
