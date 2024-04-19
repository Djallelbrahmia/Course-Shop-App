import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/common_widgets.dart';
import 'package:shop_app/Presentation/views/sign-in/bloc/signin_bloc.dart';
import 'package:shop_app/Presentation/views/sign-in/bloc/signin_events.dart';
import 'package:shop_app/Presentation/views/sign-in/bloc/signin_states.dart';
import 'package:shop_app/Presentation/views/sign-in/signin_controller.dart';
import 'package:shop_app/Presentation/views/sign-in/widgets/app_bar.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fui;

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Login"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child:
                          reusbaleText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusbaleText("E-mail"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email adress", "email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusbaleText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        })
                      ],
                    ),
                  ),
                  _forgetPassword(context),
                  buildLogInButton("Login", "login", () {
                    SignInController(context: context).handleSignIn("email");
                  }),
                  buildLogInButton("Sign up", "Register", () {
                    Navigator.of(context).pushNamed("/register");
                  })
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}

Widget _forgetPassword(BuildContext context) {
  return Container(
    width: 260.w,
    height: 44.h,
    padding: EdgeInsets.only(left: 25.w),
    child: GestureDetector(
      onTap: () {
        fui.showForgotPasswordScreen(context: context);
      },
      child: Text(
        "Forget Password",
        style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.primaryText,
            decorationColor: AppColors.primaryText,
            decoration: TextDecoration.underline),
      ),
    ),
  );
}
