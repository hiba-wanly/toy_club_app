import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/features/profile/presentation/views/language_view.dart';
import 'package:toy_club_app/features/welcome/presentation/views/widgets/custom_button_welcome.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Settings".tr,
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
        padding: EdgeInsets.only(top:h*0.04),
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
