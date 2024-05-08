import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/bloc/buy_courses_bloc.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/bloc/buy_courses_events.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/my_courses_events.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/mycourses_bloc.dart';
import 'package:shop_app/common/apis/course_api.dart';

class BuyCoursesController {
  late BuildContext context;
  BuyCoursesController({required this.context});
  void init() {
    asyncLoadBuyCourseData();
  }

  asyncLoadBuyCourseData() async {
    context.read<MyCourseBlocs>().add(const TriggerLoadingMyCoursesEvent());
    var result = await CourseAPI.coursesBought();
    if (result.code == 200) {
      if (context.mounted) {
        context
            .read<BuyCourseBlocs>()
            .add(const TriggerDownloadedBuyCoursesEvents());
        Future.delayed(Duration(milliseconds: 100), () {
          context
              .read<BuyCourseBlocs>()
              .add(TriggerLoadedBuyCoursesEvents(result.data!));
        });
      }
    }
  }
}
