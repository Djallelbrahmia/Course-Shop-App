import 'package:shop_app/common/entities/course.dart';

abstract class MyCoursesEvents {
  const MyCoursesEvents();
}

class TriggerLoadingMyCoursesEvent extends MyCoursesEvents {
  const TriggerLoadingMyCoursesEvent();
}

class TriggerInitialMyCoursesEvents extends MyCoursesEvents {
  const TriggerInitialMyCoursesEvents();
}

class TriggerDownloadedMyCoursesEvent extends MyCoursesEvents {
  const TriggerDownloadedMyCoursesEvent();
}

class TriggerLoadedMyCoursesEvent extends MyCoursesEvents {
  final List<CourseItem> courseItem;
  const TriggerLoadedMyCoursesEvent(this.courseItem);
}
