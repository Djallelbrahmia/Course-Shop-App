import 'package:shop_app/common/entities/entities.dart';

abstract class CourseEvents {
  const CourseEvents();
}

class TriggerCourse extends CourseEvents {
  final CourseItem courseItem;
  const TriggerCourse(this.courseItem) : super();
}
