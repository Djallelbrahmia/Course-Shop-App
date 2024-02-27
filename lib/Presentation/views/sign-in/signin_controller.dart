import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/sign-in/bloc/signin_bloc.dart';
import 'package:shop_app/common/values/constants.dart';
import 'package:shop_app/common/widgets/toast.dart';
import 'package:shop_app/global.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          toastInfo(msg: "You need to fill email adress");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (credential.user == null) {
          toastInfo(msg: "Wrong Credential");
          return;
        } else if (!credential.user!.emailVerified) {
          toastInfo(msg: "Verify email first");
          return;
        }
        var user = credential.user;
        if (user == null) {
          toastInfo(msg: "Wrong Credential");
          return;
        } else {
          Global.storageService
              .setString(AppConstants.USER_TOKEN_KEY, "123456789");
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/myHomePage', (route) => false);
        }
      }
    } catch (e) {
      toastInfo(msg: "Something went wrong");
    }
  }
}
