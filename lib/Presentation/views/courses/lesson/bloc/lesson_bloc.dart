import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/courses/lesson/bloc/lesson_events.dart';
import 'package:shop_app/Presentation/views/courses/lesson/bloc/lesson_states.dart';

class LessonBlocs extends Bloc<LessonEvents, LessonStates> {
  LessonBlocs() : super(const LessonStates()) {
    on<TriggerLessonVideo>(_triggerLessonVideo);
    on<TriggerUrlItem>(_triggerUrlItem);
    on<TriggerIndex>(_triggerVideoIndex);
    on<TriggerPlay>(_triggerPlay);
  }
  void _triggerLessonVideo(
      TriggerLessonVideo event, Emitter<LessonStates> emit) {
    emit(state.copyWith(lessonVideoItem: event.lessonVideoItem));
  }

  void _triggerUrlItem(TriggerUrlItem event, Emitter<LessonStates> emit) {
    emit(state.copyWith(initVideoPlayerFuture: event.initVideoPlayerFuture));
  }

  void _triggerPlay(TriggerPlay event, Emitter<LessonStates> emit) {
    emit(state.copyWith(isPlay: event.isPlay));
  }

  void _triggerVideoIndex(TriggerIndex event, Emitter<LessonStates> emit) {
    emit(state.copyWith(videoIndex: event.videoIndex));
  }
}
