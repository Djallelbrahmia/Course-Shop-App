import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/profile/bloc/profile_bloc.dart';
import 'package:shop_app/Presentation/views/profile/bloc/profile_event.dart';
import 'package:shop_app/Presentation/views/profile/bloc/profile_state.dart';
import 'package:shop_app/Presentation/views/profile/widgets/profile_widgets.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';
import 'package:shop_app/global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void didChangeDependencies() {
    var userProfile = Global.storageService.getUserProfile();
    context.read<ProfileBlocs>().add(TriggerProfileName(userProfile));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBlocs, ProfileStates>(
        builder: (context, state) => Scaffold(
              backgroundColor: Colors.white,
              appBar: builProfileAppBar(),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      profilButtonAndEditButton(),
                      SizedBox(
                        height: 30.h,
                      ),
                   buildProfileName(state),
                      buildRowView(context),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: buildListView(context),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
