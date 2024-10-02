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
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_state.dart';
import 'package:toy_club_app/features/srevices/repository.dart';

class SignUpView extends StatefulWidget {
  Repository? repository;
  SignUpView({super.key, this.repository});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  double h = 1;
  double w = 1;

  bool ispassword = true;
  var formkey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
          "Registration".tr,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.grey),
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Form(
        key: formkey,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.06, vertical: h * 0.02),
          child: Center(
            child: ListView(
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                CustomTextFormAuth(
                  hintText: "",
                  labeltext: "first name".tr,
                  iconData: null,
                  mycontroller: firstnameController,
                  textInputType: TextInputType.text,
                  pass: false,
                  ispassword: ispassword,
                ),

                CustomTextFormAuth(
                  hintText: "",
                  labeltext:"last name".tr,
                  iconData: null,
                  mycontroller: lastnameController,
                  textInputType: TextInputType.text,
                  pass: false,
                  ispassword: ispassword,
                ),
                CustomTextFormAuth(
                  hintText: "create your email".tr,
                  labeltext:"email".tr,
                  iconData: Icons.email_outlined,
                  mycontroller: emailController,
                  textInputType: TextInputType.emailAddress,
                  pass: false,
                  ispassword: ispassword,
                ),
                CustomTextFormAuth(
                  hintText:"enter the user name".tr ,
                  labeltext: "user name".tr,
                  iconData: Icons.lock_outline,
                  mycontroller: usernameController,
                  textInputType: TextInputType.visiblePassword,
                  pass: false,
                  ispassword: ispassword,
                ),

                CustomTextFormAuth(
                  hintText:"enter password".tr,
                  labeltext: "password".tr,
                  iconData: Icons.lock_outline,
                  mycontroller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  pass: true,
                  ispassword: ispassword,
                ),
                CustomTextFormAuth(
                  hintText:"enter your address".tr,
                  labeltext: "address".tr,
                  iconData: Icons.email_outlined,
                  mycontroller: addressController,
                  textInputType: TextInputType.visiblePassword,
                  pass: false,
                  ispassword: ispassword,
                ),
                CustomTextFormAuth(
                  hintText:"enter your phone number".tr,
                  labeltext: "phone number".tr,
                  iconData: Icons.phone_enabled_rounded,
                  mycontroller: phoneNumberController,
                  textInputType: TextInputType.visiblePassword,
                  pass: false,
                  ispassword: ispassword,
                ),
                CustomTextFormAuth(
                  hintText: "enter your telegram id".tr,
                  labeltext:"telegram id".tr,
                  iconData: Icons.email_outlined,
                  mycontroller: telegramIdController,
                  textInputType: TextInputType.visiblePassword,
                  pass: false,
                  ispassword: ispassword,
                ),
                BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                  if (state is SignupSuccess) {
                    // widget.repository!.login = state.signup;
                    // Get.to(HomeView(repository:widget.repository!));
                    Get.to(NavigationMenu());
                  }
                  if (state is SignupFailure) {
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
                  if (state is SignupLoading) {
                    return

                      LoadingButtom();


                  } else {
                    return CustomButtonAuth(
                      text:"create account".tr ,
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<SignupCubit>(context)
                              .fetchSignupData(
                            signUp = SignUp(
                                email: emailController.text,
                                password: passwordController.text,
                                user_name: usernameController.text,
                                first_name: firstnameController.text,
                                last_name: lastnameController.text,
                                type: usernameController.text,
                                address: addressController.text,
                                telephone: phoneNumberController.text,
                                telegram_id: telegramIdController.text,
                                points: usernameController.text,
                                reservation_allowed: usernameController.text
                            )
                          //     {
                          //   'name': usernameController.text,
                          //   'email': emailController.text,
                          //   'password': passwordController.text
                          // }
                          );
                        }
                      },
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
        ),
      ),
    );
  }
}
