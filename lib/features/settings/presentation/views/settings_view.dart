import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/features/profile/presentation/views/language_view.dart';
import 'package:toy_club_app/features/welcome/presentation/views/widgets/custom_button_welcome.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: CustomButtonWelcome(
           prefixIcon: Icons.logout,
           text:  "language".tr,
           onPressed: () {
             Get.to(const LanguageView());
           }),
      ),
    );
  }
}
