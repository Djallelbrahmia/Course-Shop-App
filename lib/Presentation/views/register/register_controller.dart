import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_bloc.dart';
import 'package:shop_app/common/widgets/toast.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});
  void handleEmailRegister() async {
    var state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo(msg: "All Field are required");
      return;
    }
    if (password != rePassword) {
      toastInfo(msg: "Password don't match");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(userName);
        toastInfo(msg: "an email has been sent to your registred email !");
        Navigator.of(context).pop();
      }
    } catch (e) {
      toastInfo(
          msg:
              "Some thing went wrong mybe an issue with provided informations , check email and password");
    }
  }
}
