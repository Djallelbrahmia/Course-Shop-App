import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/my_courses_events.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/mycourses_bloc.dart';
import 'package:shop_app/common/apis/course_api.dart';

class MyCoursesController {
  late BuildContext context;
  MyCoursesController({required this.context});
  void init() {
    asyncLoadCourseData();
  }

  asyncLoadCourseData() async {
    context.read<MyCourseBlocs>().add(const TriggerLoadingMyCoursesEvent());
    var result = await CourseAPI.courseList();
    if (result.code == 200) {
      if (context.mounted) {
        context
            .read<MyCourseBlocs>()
            .add(const TriggerLoadedMyCoursesEvent([]));
        Future.delayed(Duration(seconds: 3), () {
          context
              .read<MyCourseBlocs>()
              .add(const TriggerDownloadedMyCoursesEvent());
        });
      }
    }
  }
}
