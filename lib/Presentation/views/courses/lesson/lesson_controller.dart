import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/courses/lesson/bloc/lesson_bloc.dart';
import 'package:shop_app/Presentation/views/courses/lesson/bloc/lesson_events.dart';
import 'package:shop_app/common/apis/lesson_api.dart';
import 'package:shop_app/common/entities/lesson.dart';
import 'package:shop_app/common/widgets/toast.dart';
import 'package:video_player/video_player.dart';

class LessonController {
  final BuildContext context;
  VideoPlayerController? videoPlayerController;
  LessonController({required this.context});
  void init() {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    context.read<LessonBlocs>().add(const TriggerPlay(false));
    asyncLoadLessonData(args['id']);
  }

  void asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonApi.lessonDetail(lessonRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<LessonBlocs>().add(TriggerLessonVideo(result.data!));
      }
      if (result.data!.isNotEmpty) {
        // var url = result.data!.elementAt(0).url;

        videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
            "https://videos.pexels.com/video-files/2887463/2887463-hd_1920_1080_25fps.mp4"));
        var initPlayer = videoPlayerController?.initialize();
        if (context.mounted) {
          context.read<LessonBlocs>().add(TriggerUrlItem(initPlayer));
          context.read<LessonBlocs>().add(const TriggerPlay(false));
        }
      }
    } else {
      toastInfo(msg: "Error loading lessons");
    }
  }

  void playVideo(String url) {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    context.read<LessonBlocs>().add(const TriggerPlay(false));
    context.read<LessonBlocs>().add(const TriggerUrlItem(null));
    var initPlayer = videoPlayerController
        ?.initialize()
        .then((value) => videoPlayerController?.seekTo(Duration.zero));
    context.read<LessonBlocs>().add(TriggerUrlItem(initPlayer));
    context.read<LessonBlocs>().add(const TriggerPlay(true));
  }
}
