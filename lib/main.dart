import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shop_app/common/routes/routes.dart';
import 'dart:io' show Platform;

import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppPages.allBlocProviders,
      child: ScreenUtilInit(
        minTextAdapt: true,
        rebuildFactor: (__, _) => true,
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            iconTheme: IconThemeData(color: AppColors.primaryText),
            useMaterial3: true,
          ),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // routes: {
          //   "/myHomePage": (context) => const ApplicationPage(),
          //   "/signIn": (context) => const SignInView(),
          //   "/register": (context) => RegisterView(),
          // },
        ),
      ),
    );
  }
}
