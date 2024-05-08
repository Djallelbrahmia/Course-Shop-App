import 'package:shop_app/common/entities/lesson.dart';

class LessonStates {
  final List<LessonVideoItem> lessonVideoItem;
  final Future<void>? initVideoPlayerFuture;
  final bool isPlay;
  final int videoIndex;
  const LessonStates(
      {this.lessonVideoItem = const <LessonVideoItem>[],
      this.initVideoPlayerFuture,
      this.isPlay = false,
      this.videoIndex = 0});
  LessonStates copyWith(
      {List<LessonVideoItem>? lessonVideoItem,
      Future<void>? initVideoPlayerFuture,
      int? videoIndex,
      bool? isPlay}) {
    return LessonStates(
        lessonVideoItem: lessonVideoItem ?? this.lessonVideoItem,
        videoIndex: videoIndex ?? this.videoIndex,
        initVideoPlayerFuture:
            initVideoPlayerFuture ?? this.initVideoPlayerFuture,
        isPlay: isPlay ?? this.isPlay);
  }
}
