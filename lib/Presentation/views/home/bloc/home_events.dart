import 'package:shop_app/common/entities/course.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  const HomePageDots({required this.index}) : super();
}

class HomePageCourseItem extends HomePageEvents {
  final List<CourseItem> courseItems;
  const HomePageCourseItem({required this.courseItems});
}
