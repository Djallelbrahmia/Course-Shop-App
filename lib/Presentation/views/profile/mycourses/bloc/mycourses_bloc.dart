import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/my_courses_events.dart';
import 'package:shop_app/Presentation/views/profile/mycourses/bloc/my_courses_state.dart';

class MyCourseBlocs extends Bloc<MyCoursesEvents, MyCoursesStates> {
  MyCourseBlocs() : super(const InitialMyCoursesStates()) {
    on<TriggerLoadingMyCoursesEvent>(_triggerLoadingMyCourse);
    on<TriggerLoadedMyCoursesEvent>(_triggerLoadedMyCourse);
    on<TriggerDownloadedMyCoursesEvent>(_triggerDownloadingMyCourse);
    on<TriggerInitialMyCoursesEvents>(_triggerInitialMyCourse);
  }
  _triggerLoadingMyCourse(
      TriggerLoadingMyCoursesEvent event, Emitter<MyCoursesStates> emit) {
    emit(const LoadingMyCoursesStates());
  }

  _triggerInitialMyCourse(
      TriggerInitialMyCoursesEvents event, Emitter<MyCoursesStates> emit) {
    emit(const InitialMyCoursesStates());
  }

  _triggerLoadedMyCourse(
      TriggerLoadedMyCoursesEvent event, Emitter<MyCoursesStates> emit) {
    emit(LoadedMyCourseStates(event.courseItem));
  }

  _triggerDownloadingMyCourse(
      TriggerDownloadedMyCoursesEvent event, Emitter<MyCoursesStates> emit) {
    emit(const DownloadedMyCoursesStates());
  }
}
