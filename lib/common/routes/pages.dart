import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/bloc/course_d_blocs.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/course_details.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/payWebView/bloc/payview_bloc.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/payWebView/pay_webview.dart';
import 'package:shop_app/Presentation/views/courses/lesson/bloc/lesson_bloc.dart';
import 'package:shop_app/Presentation/views/courses/lesson/lesson_detail.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/bloc/buy_courses_bloc.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/buy_courses.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/mycourses_bloc.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/my_courses.dart';
import 'package:shop_app/Presentation/views/application/application_page.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_bloc.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_bloc.dart';
import 'package:shop_app/Presentation/views/home/home_page.dart';
import 'package:shop_app/Presentation/views/profile/bloc/profile_bloc.dart';
import 'package:shop_app/Presentation/views/profile/payment_details/cubit/payment_details_cubit.dart';
import 'package:shop_app/Presentation/views/profile/payment_details/payment_details.dart';
import 'package:shop_app/Presentation/views/profile/settings/bloc/settings_bloc.dart';
import 'package:shop_app/Presentation/views/profile/settings/settings.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_bloc.dart';
import 'package:shop_app/Presentation/views/register/register_view.dart';
import 'package:shop_app/Presentation/views/search/bloc/search_bloc.dart';
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
    PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBlocs())),
    PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingsView(),
        bloc: BlocProvider(create: (_) => SettingsBlocs())),
    PageEntity(
        route: AppRoutes.COURSE_DETAILS,
        page: const CourseDetails(),
        bloc: BlocProvider(create: (_) => CourseDetailsBloc())),
    PageEntity(
        route: AppRoutes.PAY_WEB_VIEW,
        page: const PayWebView(),
        bloc: BlocProvider(create: (_) => PayWebViewBloc())),
    PageEntity(
        route: AppRoutes.LESSONS_DETAILS,
        page: const LessonDetail(),
        bloc: BlocProvider(create: (_) => LessonBlocs())),
    PageEntity(
        route: AppRoutes.MY_COURSES,
        page: const MyCourses(),
        bloc: BlocProvider(create: (_) => MyCourseBlocs())),
    PageEntity(
        route: AppRoutes.BUY_COURSES,
        page: const BuyCourses(),
        bloc: BlocProvider(create: (_) => BuyCourseBlocs())),
    PageEntity(
        route: AppRoutes.PAYMENT_DETAILS,
        page: const PaymentDetails(),
        bloc: BlocProvider(create: (_) => PaymentDetailsCubits())),
  ];
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => AppBlocs()),
        BlocProvider(create: (context) => HomePageBlocs()),
        BlocProvider(create: (context) => SettingsBlocs()),
        BlocProvider(create: (context) => PayWebViewBloc()),
        BlocProvider(create: (_) => LessonBlocs()),
        BlocProvider(create: (context) => CourseDetailsBloc()),
        BlocProvider(create: (context) => ProfileBlocs()),
        BlocProvider(create: (context) => MyCourseBlocs()),
        BlocProvider(create: (context) => PaymentDetailsCubits()),
        BlocProvider(create: (context) => BuyCourseBlocs()),
        BlocProvider(create: (context) => SearchBloc())
      ];

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes.where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceIsFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getUserIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignInView(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignInView(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, required this.bloc});
}
