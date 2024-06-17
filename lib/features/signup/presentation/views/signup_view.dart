import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/auth/custom_textform_auth.dart';
import 'package:toy_club_app/features/home/presentation/views/home_view.dart';
import 'package:toy_club_app/features/login/presentation/views/widgets/custom_button_auth.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_state.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

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

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "إنشاء حساب",
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
                    labeltext: "الاسم الأول",
                    iconData: null,
                    mycontroller: firstnameController,
                    textInputType: TextInputType.text,
                    pass: false,
                    ispassword: ispassword,
                  ),

                  CustomTextFormAuth(
                    hintText: "",
                    labeltext: "الاسم الأخير",
                    iconData: null,
                    mycontroller: lastnameController,
                    textInputType: TextInputType.text,
                    pass: false,
                    ispassword: ispassword,
                  ),
                  CustomTextFormAuth(
                    hintText: 'أنشئ بريدك الالكتروني',
                    labeltext: 'البريد الالكتروني',
                    iconData: Icons.email_outlined,
                    mycontroller: emailController,
                    textInputType: TextInputType.visiblePassword,
                    pass: false,
                    ispassword: ispassword,
                  ),
                  CustomTextFormAuth(
                    hintText: "أدخل اسم المستخدم",
                    labeltext: "اسم المستخدم",
                    iconData: Icons.lock_outline,
                    mycontroller: usernameController,
                    textInputType: TextInputType.visiblePassword,
                    pass: false,
                    ispassword: ispassword,
                  ),

                  CustomTextFormAuth(
                    hintText: "أدخل كلمة المرور",
                    labeltext: "كلمة المرور",
                    iconData: Icons.lock_outline,
                    mycontroller: passwordController,
                    textInputType: TextInputType.visiblePassword,
                    pass: true,
                    ispassword: ispassword,
                  ),
                  CustomTextFormAuth(
                    hintText: "أدخل عنوانك",
                    labeltext: "العنوان",
                    iconData: Icons.email_outlined,
                    mycontroller: addressController,
                    textInputType: TextInputType.visiblePassword,
                    pass: false,
                    ispassword: ispassword,
                  ),
                  CustomTextFormAuth(
                    hintText: "أدخل رقم هاتفك",
                    labeltext: "رقم الهاتف",
                    iconData: Icons.phone_enabled_rounded,
                    mycontroller: phoneNumberController,
                    textInputType: TextInputType.visiblePassword,
                    pass: false,
                    ispassword: ispassword,
                  ),
                  CustomTextFormAuth(
                    hintText: "أدخل معرف التلغرام الخاص بك",
                    labeltext: "معرف التلغرام",
                    iconData: Icons.email_outlined,
                    mycontroller: telegramIdController,
                    textInputType: TextInputType.visiblePassword,
                    pass: false,
                    ispassword: ispassword,
                  ),
                  BlocConsumer<SignupCubit, SignupState>(
                      listener: (context, state) {
                    if (state is SignupSuccess) {
                      Get.to(HomeView());
                    }
                    if (state is SignupFailure) {
                      debugPrint("kkkLoginFailure");
                      Flushbar(
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.white,
                        messageColor: Colors.black,
                        messageSize: h * 0.02,
                        message: "لا يمكن اتمام العملية الأن",
                      ).show(context);
                      // Navigator.pop(context);
                    }
                  }, builder: (context, state) {
                    if (state is SignupLoading) {
                      return

                        Container(
                        width: double.infinity,
                        height: h * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),

                              color: const Color(0x24A4B4EC),

                            ),
                        child: const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(color: Color(
                                0xff6b70b0),)),
                      );


                    } else {
                      return CustomButtonAuth(
                        text: "إنشاء حساب",
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<SignupCubit>(context)
                                .fetchSignupData({
                              'name': usernameController.text,
                              'email': emailController.text,
                              'password': passwordController.text
                            });
                          }
                        },
                      );
                    }
                  }),

                  // CustomButtonAuth(text:  "إنشاء حساب",onPressed: (){Get.to(HomeView());},),

                  SizedBox(
                    height: h * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
