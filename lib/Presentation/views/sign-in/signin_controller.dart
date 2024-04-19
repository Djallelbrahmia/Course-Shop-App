import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/Presentation/views/home/home_controller.dart';
import 'package:shop_app/Presentation/views/sign-in/bloc/signin_bloc.dart';
import 'package:shop_app/common/apis/user_api.dart';
import 'package:shop_app/common/entities/user.dart';
import 'package:shop_app/common/values/constants.dart';
import 'package:shop_app/common/widgets/toast.dart';
import 'package:shop_app/global.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  void handleSignIn(String type) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
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
          String? displayName = user.displayName;
          String? email = user.email;
          String? id = user.uid;
          String? photoUrl = "${AppConstants.SERVER_URL}/uploads/default.png";
          print(photoUrl);
          await credential.user?.updatePhotoURL(photoUrl);
          LoginRequestEntity loginRequestEntity = LoginRequestEntity(
              avatar: photoUrl,
              open_id: id,
              name: displayName,
              email: email,
              type: 1);
          asyncPostAllData(loginRequestEntity);
        }
      }
      if (type == "google") {
        final user = await _googleSignIn.signIn();
        if (user == null) {
          toastInfo(msg: "Wrong Credential");
          return;
        } else {
          String? displayName = user.displayName;
          String? email = user.email;
          String? id = user.id;
          String? photoUrl =
              user.photoUrl ?? "${AppConstants.SERVER_URL}/uploads/default.png";
          LoginRequestEntity loginRequestEntity = LoginRequestEntity(
              avatar: photoUrl,
              open_id: id,
              name: displayName,
              email: email,
              type: 1);
          asyncPostAllData(loginRequestEntity);
        }
      }
    } catch (e) {
      toastInfo(msg: "Something went wrong");
    }
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(param: loginRequestEntity);

    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstants.USER_PROFILE_INFO, jsonEncode(result.data!));
        Global.storageService
            .setString(AppConstants.USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        if (context.mounted) {
          await HomeController(context: context).init();
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/myHomePage', (route) => false);
        }
      } catch (e) {
        print(e);
        toastInfo(msg: "Something went wrong");
        EasyLoading.dismiss();
      }
    } else {
      toastInfo(msg: "Something went wrong");

      EasyLoading.dismiss();
    }
  }
}
