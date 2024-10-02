import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/localization/translation.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/core/utils/language_service.dart';
import 'package:toy_club_app/core/utils/navigation_menu.dart';
import 'package:toy_club_app/core/utils/simple_bloc_observer.dart';
import 'package:toy_club_app/features/favorite/data/data_source/favorite_remote_data_source.dart';
import 'package:toy_club_app/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:toy_club_app/features/favorite/domain/use_cases/fetch_favorite_use_case.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/delete_favorite_cubit.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:toy_club_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:toy_club_app/features/home/data/repos/home_repo_impl.dart';
import 'package:toy_club_app/features/home/domain/use_cases/fetch_home_use_case.dart';
import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:toy_club_app/features/login/data/data_source/login_remote_data_source.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';
import 'package:toy_club_app/features/login/data/repos/login_repo_impl.dart';
import 'package:toy_club_app/features/login/domain/use_cases/fetch_login_use_case.dart';
import 'package:toy_club_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:toy_club_app/features/orders/data/data_source/order_remote_data_source.dart';
import 'package:toy_club_app/features/orders/data/repos/order_repo_impl.dart';
import 'package:toy_club_app/features/orders/domain/use_cases/fetch_order_use_case.dart';
import 'package:toy_club_app/features/orders/presentation/manager/ordre_cubit/order_cubit.dart';
import 'package:toy_club_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:toy_club_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:toy_club_app/features/profile/domain/use_cases/fetch_profile_use_case.dart';
import 'package:toy_club_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:toy_club_app/features/signup/data/data_source/login_local_data_source.dart';
import 'package:toy_club_app/features/signup/data/data_source/signup_remote_data_source.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';
import 'package:toy_club_app/features/signup/data/repos/signup_repo_impl.dart';
import 'package:toy_club_app/features/signup/domain/use_cases/fetch_signup_use_case.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:toy_club_app/features/srevices/repository.dart';
import 'package:toy_club_app/features/welcome/presentation/views/welcome_view.dart';
import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:toy_club_app/splash_screen.dart';
import 'core/localization/change_local.dart';

void main()async {
  await Hive.initFlutter();
  Hive.registerAdapter(SignUpAdapter());

  await Hive.openBox(kLoginBox); //#<SignUp>

  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  // runApp(toyClub());
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  Bloc.observer = SimpleBlocObserver();

  bool isLoggedIn =
  ((await SharedPreferences.getInstance()).getString("access_token") !=
      null);
  String? id = (await SharedPreferences.getInstance()).getString("id");
  String? userName = (await SharedPreferences.getInstance()).getString("userName");
  String? firstName = (await SharedPreferences.getInstance()).getString("firstName");
  String? lastName = (await SharedPreferences.getInstance()).getString("lastName");
  String? type = (await SharedPreferences.getInstance()).getString("type");
  String? email = (await SharedPreferences.getInstance()).getString("email");
  String? address = (await SharedPreferences.getInstance()).getString("address");
  String? telephone = (await SharedPreferences.getInstance()).getString("telephone");
  String? telegramId = (await SharedPreferences.getInstance()).getString("telegramId");
  print(firstName);

  runApp(toyClub(
      isLoggedIn:isLoggedIn,
    id :id,
      userName:userName,
      firstName:firstName,
      lastName:lastName,
      type:type,
      email:email,
      address:address,
      telephone:telephone,
      telegramId:telegramId
  ));

}

final getIt = GetIt.instance;

class toyClub extends StatelessWidget {

  toyClub({
    this.isLoggedIn,
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.type,
    this.email,
    this.address,
    this.telephone,
    this.telegramId
  });

  final isLoggedIn;
  final id;
  final userName;
  final firstName;
  final lastName;
final type;
final email;
final address;
final telephone;
final telegramId;


  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
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
                FetchLoginSUseCase(
                  LoginRepoImpl(
                    loginRemoteDataSource: LoginRemoteDataSourceImpl(
                      getIt.get<ApiService>(),
                    ),
                  ),
                ),
                isLoggedIn:isLoggedIn,
                id :id ?? "",
                userName:userName ?? "",
                firstName:firstName ?? "",
                lastName:lastName ?? "",
                type:type ?? "",
                email:email ?? "",
                address:address ?? "",
                telephone:telephone ?? "",
                telegramId:telegramId ?? ""
            );
          }),
          BlocProvider(create: (context) {
            return SignupCubit(
              FetchSignupUseCase(
                SignupRepoImpl(
                  signupRemoteDataSource: SignupRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                  loginLocalDataSource: LoginLocalDataSourceImpl(),
                ),
              ),
                isLoggedIn:isLoggedIn,
                id :id ?? "",
                userName:userName ?? "",
                firstName:firstName ?? "",
                lastName:lastName ?? "",
                type:type ?? "",
                email:email ?? "",
                address:address ?? "",
                telephone:telephone ?? "",
                telegramId:telegramId ?? ""
            );
          }),
          BlocProvider(create: (context) {
            return OrderCubit(
              FetchOrderUseCase(
                OrderRepoImpl(
                  orderRemoteDataSource: OrderRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                ),
              ),
            );
          }),
          BlocProvider(create: (context) {
            return FavoriteCubit(
              FetchFavoriteUseCase(
                FavoriteRepoImpl(
                  favoriteRemoteDataSource: FavoriteRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                ),
              ),
            );
          }),
          BlocProvider(create: (context) {
            return ProfileCubit(
              FetchProfileUseCase(
                ProfileRepoImpl(
                  profileRemoteDataSource: ProfileRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                ),
              ),
              FetchProfileSUseCase(
                ProfileRepoImpl(
                  profileRemoteDataSource: ProfileRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                ),
              ),
                isLoggedIn:isLoggedIn,
                id :id ?? "",
                userName:userName ?? "",
                firstName:firstName ?? "",
                lastName:lastName ?? "",
                type:type ?? "",
                email:email ?? "",
                address:address ?? "",
                telephone:telephone ?? "",
                telegramId:telegramId ?? ""
            );
          }),
          BlocProvider(create: (context) {
            return HomeCubit(
              FetchHomeUseCase(
                HomeRepoImpl(
                  homeRemoteDataSource: HomeRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                ),
              ),
            );
          }),
          BlocProvider(create: (context) {
            return FavoriteDCubit(
              FetchFavoriteUseCase(
                FavoriteRepoImpl(
                  favoriteRemoteDataSource: FavoriteRemoteDataSourceImpl(
                    getIt.get<ApiService>(),
                  ),
                ),
              ),
            );
          }),
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
            home:
            WelcomeView(repository: repository,)));
            // isLoggedIn ? NavigationMenu() : WelcomeView(repository: repository,)));
  }
}
