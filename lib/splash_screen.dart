import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toy_club_app/core/utils/navigation_menu.dart';
import 'package:toy_club_app/features/home/presentation/views/home_view.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_state.dart';
import 'package:toy_club_app/features/srevices/repository.dart';
import 'package:toy_club_app/features/welcome/presentation/views/welcome_view.dart';


class SplashScreen extends StatefulWidget {
  Repository repository;
  SplashScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SignupCubit>(context).fetchLogin();
  }

  @override
  Widget build(BuildContext context) {
    return

        BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state){
             if (state is SignupFailure) {
             Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => WelcomeView(repository: widget.repository,)
                ),
            );
            }

          },
      builder: (context, state) {
    if (state is SignupSuccessLocal) {
      // debugPrint(state.login.id.toString());
      String data = state.signup!;
      Map<String, dynamic> da = jsonDecode(data);
      SignUp data2 = SignUp.fromJson(da);


      widget.repository.login = data2;
      debugPrint(widget.repository.login.toString());
      return NavigationMenu();
    }  else {
    return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
    }
            },

    );
  }
}
