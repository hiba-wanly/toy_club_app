import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/utils/navigation_menu.dart';
import 'package:toy_club_app/core/widgets/auth/custom_textform_auth.dart';
import 'package:toy_club_app/core/widgets/loading_buttom.dart';
import 'package:toy_club_app/features/home/presentation/views/home_view.dart';
import 'package:toy_club_app/features/login/presentation/views/widgets/custom_button_auth.dart';
import 'package:toy_club_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:toy_club_app/features/profile/presentation/manager/profile_cubit/profile_state.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';


class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView>{
  double h = 1;
  double w = 1;

  // var formkey = GlobalKey<FormState>();
  bool ispassword = true;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController telegramIdController = TextEditingController();
  late SignUp signUp;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Information".tr,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.grey),
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body:
      Builder(
          builder: (context) {
            if (BlocProvider
                .of<ProfileCubit>(context)
                .isLoggedIn) {
              return Container(
                padding:
                EdgeInsets.symmetric(horizontal: w * 0.06, vertical: h * 0.02),
                child: Center(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: h * 0.01,
                      ),
                      CustomTextFormAuth(
                        hintText: BlocProvider
                            .of<ProfileCubit>(context)
                            .firstName,
                        labeltext: "first name".tr,
                        iconData: null,
                        mycontroller: firstnameController,
                        textInputType: TextInputType.text,
                        pass: false,
                        ispassword: ispassword,
                      ),

                      CustomTextFormAuth(
                        hintText: BlocProvider
                            .of<ProfileCubit>(context)
                            .lastName,
                        labeltext:"last name".tr,
                        iconData: null,
                        mycontroller: lastnameController,
                        textInputType: TextInputType.text,
                        pass: false,
                        ispassword: ispassword,
                      ),
                      CustomTextFormAuth(
                        hintText: BlocProvider
                            .of<ProfileCubit>(context)
                            .email,
                        labeltext:"email".tr,
                        iconData: Icons.email_outlined,
                        mycontroller: emailController,
                        textInputType: TextInputType.emailAddress,
                        pass: false,
                        ispassword: ispassword,
                      ),
                      // CustomTextFormAuth(
                      //   hintText:"enter the user name".tr ,
                      //   labeltext: "user name".tr,
                      //   iconData: Icons.lock_outline,
                      //   mycontroller: usernameController,
                      //   textInputType: TextInputType.visiblePassword,
                      //   pass: false,
                      //   ispassword: ispassword,
                      // ),


                      CustomTextFormAuth(
                        hintText:BlocProvider
                            .of<ProfileCubit>(context)
                            .address,
                        labeltext: "address".tr,
                        iconData: Icons.email_outlined,
                        mycontroller: addressController,
                        textInputType: TextInputType.visiblePassword,
                        pass: false,
                        ispassword: ispassword,
                      ),
                      CustomTextFormAuth(
                        hintText:BlocProvider
                            .of<ProfileCubit>(context)
                            .telephone,
                        labeltext: "phone number".tr,
                        iconData: Icons.phone_enabled_rounded,
                        mycontroller: phoneNumberController,
                        textInputType: TextInputType.visiblePassword,
                        pass: false,
                        ispassword: ispassword,
                      ),
                      CustomTextFormAuth(
                        hintText: BlocProvider
                            .of<ProfileCubit>(context)
                            .telegramId,
                        labeltext:"telegram id".tr,
                        iconData: Icons.email_outlined,
                        mycontroller: telegramIdController,
                        textInputType: TextInputType.visiblePassword,
                        pass: false,
                        ispassword: ispassword,
                      ),
                      BlocConsumer<ProfileCubit, ProfileState>(
                          listener: (context, state) {
                            if (state is ProfileSuccess) {
                              // widget.repository!.login = state.signup;
                              // Get.to(HomeView(repository:widget.repository!));
                              Get.to(NavigationMenu());
                            }
                            if (state is ProfileFailure) {
                              debugPrint("kkkLoginFailure");
                              Flushbar(
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.white,
                                messageColor: Colors.black,
                                messageSize: h * 0.02,
                                message:  state.errMessage,
                              ).show(context);
                              // Navigator.pop(context);
                            }
                          }, builder: (context, state) {
                        if (state is ProfileLoading) {
                          return

                            LoadingButtom();


                        } else {
                          return CustomButtonAuth(
                              text:"Update Information".tr ,
                              onPressed: () {
                                BlocProvider.of<ProfileCubit>(context)
                                    .fetchProfile(
                                    // signUp = SignUp(
                                    //   email: emailController.text,
                                    //   first_name: firstnameController.text,
                                    //   last_name: lastnameController.text,
                                    //   address: addressController.text,
                                    //   telephone: phoneNumberController.text,
                                    //   telegram_id: telegramIdController.text,
                                    // )
                                      {
                                    'first_name': firstnameController.text,
                                        // firstnameController != null ? firstnameController.text : BlocProvider
                                    //     .of<ProfileCubit>(context)
                                    //     .firstName,
                                    'last_name':lastnameController.text,
                                    // lastnameController != null ? lastnameController.text : BlocProvider
                                    //     .of<ProfileCubit>(context)
                                    //     .lastName,
                                    // 'email': emailController != null ? emailController.text : BlocProvider
                                    //     .of<ProfileCubit>(context)
                                    //     .email,
                                        'address': addressController.text,
                                        // addressController != null ? addressController.text : BlocProvider
                                        //     .of<ProfileCubit>(context)
                                        //     .address,
                                        'telephone': phoneNumberController.text,
                                        // phoneNumberController != null ? phoneNumberController.text : BlocProvider
                                        //     .of<ProfileCubit>(context)
                                        //     .telephone,
                                        'telegram_id': telegramIdController.text,
                                        // telegramIdController != null ? telegramIdController.text : BlocProvider
                                        //     .of<ProfileCubit>(context)
                                        //     .telegramId,
                                  }
                                );
                              }
                          );
                        }
                      }),

                      // CustomButtonAuth(text: "Registration".tr,onPressed: (){Get.to(NavigationMenu());},),

                      SizedBox(
                        height: h * 0.02,
                      ),
                    ],
                  ),
                ),
              );
            }
            else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('try to logout and login again',
                      style: TextStyle(
                        fontSize: w * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Color(0x88282827),
                      )),

                ],
              );
            }
          }
      ),

    );
  }
}
