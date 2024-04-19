import 'package:shop_app/common/entities/entities.dart';

class CourseDetailsStates {
  final CourseItem? courseItem;
  final List<LessonItem> lessonItems;
  const CourseDetailsStates(
      {this.courseItem, this.lessonItems = const <LessonItem>[]});
  CourseDetailsStates copyWith(
      {CourseItem? courseItem, List<LessonItem>? lessonItems}) {
    return CourseDetailsStates(
        courseItem: courseItem ?? this.courseItem,
        lessonItems: lessonItems ?? this.lessonItems);
  }
}
