import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/application/application_page.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_bloc.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_bloc.dart';
import 'package:shop_app/Presentation/views/register/register_view.dart';
import 'package:shop_app/Presentation/views/sign-in/bloc/signin_bloc.dart';
import 'package:shop_app/Presentation/views/sign-in/sign_in.dart';
import 'package:shop_app/Presentation/views/welcome/bloc/welcome_bloc.dart';
import 'package:shop_app/Presentation/views/welcome/welcome.dart';
import 'package:shop_app/common/routes/names.dart';
import 'package:shop_app/global.dart';

class AppPages {
  static List<PageEntity> routes = [
    PageEntity(
        route: AppRoutes.INITIAL,
        page: Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc())),
    PageEntity(
        route: AppRoutes.SIGN_IN,
        page: SignInView(),
        bloc: BlocProvider(create: (_) => SignInBloc())),
    PageEntity(
        route: AppRoutes.REGISTER,
        page: RegisterView(),
        bloc: BlocProvider(create: (_) => RegisterBloc())),
    PageEntity(
      route: AppRoutes.APPLICATION,
      page: ApplicationPage(),
      bloc: Null,
    ),
  ];
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => AppBlocs())
      ];
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes.where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceIsFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          return MaterialPageRoute(
              builder: (_) => SignInView(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => SignInView(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, required this.bloc});
}
