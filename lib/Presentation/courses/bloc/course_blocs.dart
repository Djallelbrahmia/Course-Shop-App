import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/courses/bloc/course_events.dart';
import 'package:shop_app/Presentation/courses/bloc/course_states.dart';

class CourseBloc extends Bloc<CourseEvents, CourseStates> {
  CourseBloc() : super(const CourseStates()) {
    on<TriggerCourse>(_triggerCourseDetailsHandler);
  }
  _triggerCourseDetailsHandler(
      TriggerCourse event, Emitter<CourseStates> emit) {
    emit(state.copyWith(event.courseItem));
  }
}
