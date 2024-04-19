import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/courses/course_detail/bloc/course_d_events.dart';
import 'package:shop_app/Presentation/courses/course_detail/bloc/course_d_states.dart';

class CourseDetailsBloc extends Bloc<CourseDetailEvents, CourseDetailsStates> {
  CourseDetailsBloc() : super(const CourseDetailsStates()) {
    on<TriggerCourseDetail>(_triggerCourseDetailsHandler);
    on<TriggerLessonList>(_triggerLessonListHandler);
  }
  _triggerCourseDetailsHandler(
      TriggerCourseDetail event, Emitter<CourseDetailsStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }

  _triggerLessonListHandler(
      TriggerLessonList event, Emitter<CourseDetailsStates> emit) {
    emit(state.copyWith(lessonItems: event.lessons));
  }
}
