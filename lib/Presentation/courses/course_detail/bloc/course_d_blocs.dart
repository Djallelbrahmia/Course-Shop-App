import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/courses/course_detail/bloc/course_d_events.dart';
import 'package:shop_app/Presentation/courses/course_detail/bloc/course_d_states.dart';

class CourseDetailsBloc extends Bloc<CourseDetailEvents, CourseDetailsStates> {
  CourseDetailsBloc() : super(const CourseDetailsStates()) {
    on<TriggerCourseDetail>(_triggerCourseDetailsHandler);
  }
  _triggerCourseDetailsHandler(
      TriggerCourseDetail event, Emitter<CourseDetailsStates> emit) {
    emit(state.copyWith(event.courseItem));
  }
}
