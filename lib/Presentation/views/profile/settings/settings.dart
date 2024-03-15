import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_bloc.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_events.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_bloc.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_events.dart';
import 'package:shop_app/Presentation/views/profile/settings/bloc/settings_bloc.dart';
import 'package:shop_app/Presentation/views/profile/settings/bloc/settings_states.dart';
import 'package:shop_app/Presentation/views/profile/settings/widgets/settings_widgets.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/values/constants.dart';
import 'package:shop_app/global.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  void removeUserData() {
    context.read<HomePageBlocs>().add(const HomePageDots(index: 0));
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.USER_PROFILE_INFO);

    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [settingsButton(context, removeUserData)],
              ),
            );
          },
        ),
      ),
    );
  }
}
