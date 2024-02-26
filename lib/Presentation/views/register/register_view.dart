import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/common_widgets.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_bloc.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_event.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_state.dart';
import 'package:shop_app/Presentation/views/register/register_controller.dart';

import 'package:shop_app/Presentation/views/sign-in/widgets/app_bar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusbaleText(
                          "Enter your details below & free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusbaleText("User name"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField("Enter your user name", "text", "user",
                            (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UsernameEvent(value));
                        }),
                        reusbaleText("E-mail"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email adress", "email", "user",
                            (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value));
                        }),
                        reusbaleText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(PasswordEvent(value));
                        }),
                        reusbaleText("Confirm password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Confirm your password", "password", "lock",
                            (value) {
                          context
                              .read<RegisterBloc>()
                              .add(RePasswordEvent(value));
                        }),
                        reusbaleText("Enter your details and Sign up for free"),
                      ],
                    ),
                  ),
                  buildLogInButton("Register", "login", () {
                    RegisterController(context: context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
