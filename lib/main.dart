import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/localization/translation.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/core/utils/language_service.dart';
import 'package:toy_club_app/core/utils/simple_bloc_observer.dart';
import 'package:toy_club_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:toy_club_app/features/home/data/repos/home_repo_impl.dart';
import 'package:toy_club_app/features/home/domain/use_cases/fetch_home_use_case.dart';
import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:toy_club_app/features/login/data/data_source/login_remote_data_source.dart';
import 'package:toy_club_app/features/login/data/repos/login_repo_impl.dart';
import 'package:toy_club_app/features/login/domain/use_cases/fetch_login_use_case.dart';
import 'package:toy_club_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:toy_club_app/features/signup/data/data_source/signup_remote_data_source.dart';
import 'package:toy_club_app/features/signup/data/repos/signup_repo_impl.dart';
import 'package:toy_club_app/features/signup/domain/use_cases/fetch_signup_use_case.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:toy_club_app/features/welcome/presentation/views/welcome_view.dart';
import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/localization/change_local.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  runApp(toyClub());
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  Bloc.observer = SimpleBlocObserver();
}

final getIt = GetIt.instance;

class toyClub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.put(LocaleController());
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return LoginCubit(
              FetchLoginUseCase(
                LoginRepoImpl(
                  loginRemoteDataSource: LoginRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                ),
              ),
            );
          }),
          BlocProvider(create: (context) {
            return SignupCubit(
              FetchSignupUseCase(
                SignupRepoImpl(
                  signupRemoteDataSource: SignupRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                ),
              ),
            );
          }),
          // BlocProvider(create: (context) {
          //   return HomeCubit(
          //     FetchHomeUseCase(
          //       HomeRepoImpl(
          //         homeRemoteDataSource: HomeRemoteDataSourceImpl(
          //           getIt.get<ApiService>(),
          //         ),
          //       ),
          //     ),
          //   );
          // }),
        ],
        child: GetMaterialApp(
          translations: MyTranslation(),
            locale: controller.language,
            theme: ThemeData(
              scaffoldBackgroundColor: kPrimaryColor,
              fontFamily: "Almarai",
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Lego Store',
            home: const Scaffold(body: WelcomeView())));
  }
}
