import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_bloc.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_states.dart';
import 'package:shop_app/Presentation/views/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: buildNavBar(context, state),
          )),
        );
      },
    );
  }
}
