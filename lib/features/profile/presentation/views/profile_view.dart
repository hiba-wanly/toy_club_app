import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/primary_header_container.dart';
import 'package:toy_club_app/features/settings/presentation/views/settings_view.dart';
import 'package:toy_club_app/features/welcome/presentation/views/widgets/custom_button_welcome.dart';
import 'package:get/get.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          TPrimaryHeaderContainer(
            w: w,
            h: h,
            text:"profile".tr ,
            img: AppImagesAssets.detailAppBar,
          ),

          Container(
            margin: EdgeInsets.only(
                left: 0.04   * w, right: 0.04 * w, top: 0.015 * h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        AppImagesAssets.welcomeImg,
                        fit: BoxFit.cover,
                        height: h * 0.09,
                        width: w * 0.18,
                      ),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('nour',
                            style: TextStyle(
                              fontSize: w * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Color(0x88282827),
                            )),
                        Text('nour wanli',
                            style: TextStyle(
                              fontSize: w * 0.049,
                              color: Color(0x88282827),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: w * 0.35,
                    ),
                    Icon(
                      Icons.edit_outlined,
                      size: w * 0.08,
                      color: Color(0x88939292),
                    )
                  ],
                ),
                Divider(
                  color: Color(0xffeeeded),
                  thickness: 2,
                  indent: w * 0.05,
                  endIndent: w * 0.05,
                ),
                SizedBox(height: h*0.02,),
                Text(

                  "Orders".tr ,
                  style: TextStyle(
                      fontSize: 0.05 * w,
                      fontWeight: FontWeight.bold,
                      color: Color(0x88282827),
                      fontFamily: Almarai),
                ),
                SizedBox(height: h*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // margin:  EdgeInsets.only(
                      //     left: w*0.02,right: w*0.02),
                      padding:  EdgeInsets.only(left: w*0.015,right: w*0.015),
                      decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.book_online_outlined,
                            size: w * 0.08,
                            color: Color(0x88939292),
                          ),
                          Text(
                            "Subsequent reservations".tr ,
                            style: TextStyle(
                                fontSize: 0.04 * w,
                                fontWeight: FontWeight.w500,
                                fontFamily: Almarai,
                                color: Colors.black54,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // margin:  EdgeInsets.only(
                      //     left: w*0.02,right: w*0.02),
                      padding:  EdgeInsets.only(left: w*0.015,right: w*0.015),
                      decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon(
                              Icons.request_quote_outlined,
                            size: w * 0.08,
                            color: Color(0x88939292),
                          ),
                          Text(
                            "Current orders".tr ,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 0.04 * w,
                                fontWeight: FontWeight.w500,
                                fontFamily: Almarai),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // margin:  EdgeInsets.only(
                      //     left: w*0.02,right: w*0.02),
                      padding:  EdgeInsets.only(left: w*0.015,right: w*0.015),

                      decoration: BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                      child: Column(
                        children: [
                          Icon(
                              Icons.done,
                            size: w * 0.08,
                            color: Color(0x88939292),
                          ),
                          Text(
                            "Finished orders".tr ,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 0.04 * w,
                                fontWeight: FontWeight.w500,
                                fontFamily: Almarai),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                // SizedBox(height: h*0.03,),
                SizedBox(height: h*0.02,),
                Text(
                  "Delivery location".tr  ,
                  style: TextStyle(
                      fontSize: 0.05 * w,
                      fontWeight: FontWeight.bold,
                      color: Color(0x88282827),
                      fontFamily: Almarai),
                ),
                SizedBox(height: h*0.01,),
                CustomButtonWelcome(
                    prefixIcon: Icons.location_on_outlined,
                    text: "Location".tr,
                    onPressed: () {
                      // Get.to(const LoginView());
                    }),
                SizedBox(height: h*0.02,),
                Text(
                  "Others".tr,
                  style: TextStyle(
                      fontSize: 0.05 * w,
                      fontWeight: FontWeight.bold,
                      color: Color(0x88282827),
                      fontFamily: Almarai),
                ),
                SizedBox(height: h*0.01,),
                CustomButtonWelcome(
                    prefixIcon: Icons.logout,
                    text:"Logout".tr ,
                    onPressed: () {
                      // Get.to(const LoginView());
                    }),

                SizedBox(height: h*0.02,),
                CustomButtonWelcome(
                    prefixIcon: Icons.settings_outlined,
                    text:"Settings".tr,
                    onPressed: () {
                      Get.to(const SettingsView());
                    }),
                SizedBox(height: h*0.02,),
              ],
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
