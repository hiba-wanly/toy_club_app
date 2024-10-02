import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/localization/change_local.dart';
import 'package:toy_club_app/features/profile/presentation/widgets/custom_buttom_lang.dart';

class LanguageView extends GetView<LocaleController> {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   "Settings".tr,
        //   style: Theme.of(context)
        //       .textTheme
        //       .headlineSmall!
        //       .copyWith(color: Colors.grey),
        // ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "choose Language".tr,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButtomLang(
              text: "عربي",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.language);
              },
            ),
            CustomButtomLang(
              text: "انكليزي",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.language);
              },
            )
          ],
        ),
      ),
    );
  }
}
