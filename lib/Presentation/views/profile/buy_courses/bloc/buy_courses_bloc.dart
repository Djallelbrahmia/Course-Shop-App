import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/bloc/buy_courses_events.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/bloc/buy_courses_states.dart';

class BuyCourseBlocs extends Bloc<BuyCoursesEvents, BuyCoursesStates> {
  BuyCourseBlocs() : super(const InitialBuyCoursesStates()) {
    on<TriggerInitialBuyCoursesEvents>(_triggerInitialBuyCourse);
    on<TriggerLoadedBuyCoursesEvents>(_triggerLoadedBuyCourse);
    on<TriggerDownloadedBuyCoursesEvents>(_triggerDownloadingBuyCourse);
    on<TriggerLoadingBuyCoursesEvents>(_triggerLoadingBuyCourse);
  }
  _triggerLoadingBuyCourse(
      TriggerLoadingBuyCoursesEvents event, Emitter<BuyCoursesStates> emit) {
    emit(const LoadingBuyCoursesStates());
  }

  _triggerInitialBuyCourse(
      TriggerInitialBuyCoursesEvents event, Emitter<BuyCoursesStates> emit) {
    emit(const InitialBuyCoursesStates());
  }

  _triggerLoadedBuyCourse(
      TriggerLoadedBuyCoursesEvents event, Emitter<BuyCoursesStates> emit) {
    emit(LoadedBuyCoursesStates(event.courseItem));
  }

  _triggerDownloadingBuyCourse(
      TriggerDownloadedBuyCoursesEvents event, Emitter<BuyCoursesStates> emit) {
    emit(const DownloadedBuyCoursesStates());
  }
}
