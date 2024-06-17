import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/primary_header_container.dart';
import 'package:toy_club_app/features/welcome/presentation/views/widgets/custom_button_welcome.dart';

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
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
              TPrimaryHeaderContainer(
                w: w,
                h: h,
                text: "الملف الشخصي",
                img: AppImagesAssets.detailAppBar,
              ),

              Container(
                margin: EdgeInsets.only(
                    left: 0.04 * w, right: 0.04 * w, top: 0.015 * h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                    Text(
                      "العمر",
                      style: TextStyle(
                          fontSize: 0.05 * w,
                          fontWeight: FontWeight.w500,
                          fontFamily: Almarai),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.access_time_outlined
                              ),
                              Text(
                                "المنتظرة",
                                style: TextStyle(
                                    fontSize: 0.04 * w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Almarai),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Icon(
                                  Icons.tab_sharp
                              ),
                              Text(
                                "المرسلة",
                                style: TextStyle(
                                    fontSize: 0.04 * w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Almarai),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Icon(
                                  Icons.access_time_outlined
                              ),
                              Text(
                                "المستلمة",
                                style: TextStyle(
                                    fontSize: 0.04 * w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Almarai),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    CustomButtonWelcome(
                        prefixIcon: Icons.logout,
                        text: "تسجيل خروج ",
                        onPressed: () {
                          // Get.to(const LoginView());
                        }),
                  ],
                ),
              ),
              // ),
            ],
          ),
        ));
  }
}
