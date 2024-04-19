import 'package:shop_app/common/entities/entities.dart';

abstract class CourseDetailEvents {
  const CourseDetailEvents();
}

class TriggerCourseDetail extends CourseDetailEvents {
  final CourseItem courseItem;
  const TriggerCourseDetail(this.courseItem) : super();
}

class TriggerLessonList extends CourseDetailEvents {
  final List<LessonItem> lessons;
  const TriggerLessonList(this.lessons) : super();
}
