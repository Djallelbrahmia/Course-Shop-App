import 'package:shop_app/common/entities/lesson.dart';

abstract class LessonEvents {
  const LessonEvents();
}

class TriggerLessonVideo extends LessonEvents {
  final List<LessonVideoItem> lessonVideoItem;
  const TriggerLessonVideo(this.lessonVideoItem) : super();
}

class TriggerUrlItem extends LessonEvents {
  final Future<void>? initVideoPlayerFuture;
  const TriggerUrlItem(this.initVideoPlayerFuture) : super();
}

class TriggerPlay extends LessonEvents {
  final bool isPlay;
  const TriggerPlay(this.isPlay) : super();
}

class TriggerIndex extends LessonEvents {
  final int videoIndex;
  const TriggerIndex(this.videoIndex) : super();
}
