import 'package:shop_app/common/entities/entities.dart';

abstract class MyCoursesStates {
  const MyCoursesStates();
}

class LoadingMyCoursesStates extends MyCoursesStates {
  const LoadingMyCoursesStates();
}

class DownloadedMyCoursesStates extends MyCoursesStates {
  const DownloadedMyCoursesStates();
}

class InitialMyCoursesStates extends MyCoursesStates {
  const InitialMyCoursesStates();
}

class LoadedMyCourseStates extends MyCoursesStates {
  final List<CourseItem> courseItem;
  const LoadedMyCourseStates(this.courseItem);
}
