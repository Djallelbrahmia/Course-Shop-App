import 'package:shop_app/common/entities/entities.dart';

class CourseDetailsStates {
  final CourseItem? courseItem;
  const CourseDetailsStates({this.courseItem});
  CourseDetailsStates copyWith(CourseItem? courseItem) {
    return CourseDetailsStates(courseItem: courseItem ?? this.courseItem);
  }
}
