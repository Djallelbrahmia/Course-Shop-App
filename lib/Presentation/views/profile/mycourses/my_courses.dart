import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/my_courses_state.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/mycourses_bloc.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/my_courses_controller.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  late MyCoursesController _myCoursesController;
  @override
  void didChangeDependencies() {
    _myCoursesController = MyCoursesController(context: context);
    _myCoursesController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCourseBlocs, MyCoursesStates>(
        builder: (context, state) {
      if (state is DownloadedMyCoursesStates) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
              child: Column(
            children: [],
          )),
        );
      } else if (state is LoadedMyCourseStates) {
        return Container();
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
