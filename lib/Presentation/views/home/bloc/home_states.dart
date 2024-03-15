import 'package:shop_app/common/entities/entities.dart';

class HomepageStates {
  int index;
  final List<CourseItem> courseItems;
  HomepageStates({this.index = 0, this.courseItems = const <CourseItem>[]});
  HomepageStates copyWith({int? index, List<CourseItem>? courseItems}) {
    return HomepageStates(
        index: index ?? this.index,
        courseItems: courseItems ?? this.courseItems);
  }
}
