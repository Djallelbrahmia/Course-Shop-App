import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_bloc.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_events.dart';
import 'package:shop_app/common/apis/course_api.dart';
import 'package:shop_app/common/entities/user.dart';
import 'package:shop_app/global.dart';

class HomeController {
  late BuildContext context;
  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }
  UserItem? get userProfile => Global.storageService.getUserProfile();
  Future<void> init() async {
    if (Global.storageService.getUserKey().isNotEmpty) {
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        context
            .read<HomePageBlocs>()
            .add(HomePageCourseItem(courseItems: result.data ?? []));
      } else {
        print(result.code);
      }
    }
  }
}
