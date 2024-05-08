import 'package:shop_app/common/entities/course.dart';

class SearchStates {
  final List<CourseItem> courseItems;
  const SearchStates({this.courseItems = const <CourseItem>[]});
  SearchStates copyWith({List<CourseItem>? courseItems}) {
    return SearchStates(courseItems: courseItems ?? this.courseItems);
  }
}
