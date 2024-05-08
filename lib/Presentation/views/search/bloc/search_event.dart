import 'package:shop_app/common/entities/course.dart';

abstract class SearchEvents {}

class TriggerSearchEvents extends SearchEvents {
  final List<CourseItem> courseItems;
  TriggerSearchEvents(this.courseItems);
}
