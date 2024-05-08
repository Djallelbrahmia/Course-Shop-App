import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/courses/lesson/bloc/lesson_bloc.dart';
import 'package:shop_app/Presentation/views/courses/lesson/bloc/lesson_events.dart';
import 'package:shop_app/Presentation/views/courses/lesson/bloc/lesson_states.dart';
import 'package:shop_app/Presentation/views/courses/lesson/lesson_controller.dart';
import 'package:shop_app/common/entities/lesson.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';
import 'package:shop_app/common/widgets/toast.dart';
import 'package:video_player/video_player.dart';

Widget videoPlayer(LessonStates state, LessonController lessonController) {
  return state.lessonVideoItem.isEmpty
      ? Container()
      : Container(
          width: 325.w,
          height: 200.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                    state.lessonVideoItem[state.videoIndex].thumbnail!),
              ),
              borderRadius: BorderRadius.circular(20.h)),
          child: FutureBuilder(
              future: state.initVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return lessonController.videoPlayerController == null
                      ? Container()
                      : AspectRatio(
                          aspectRatio: lessonController
                              .videoPlayerController!.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              VideoPlayer(
                                  lessonController.videoPlayerController!),
                              VideoProgressIndicator(
                                lessonController.videoPlayerController!,
                                allowScrubbing: true,
                                colors: const VideoProgressColors(
                                    playedColor: AppColors.primaryElement),
                              )
                            ],
                          ),
                        );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        );
}

Widget videoButtons(LessonStates state, LessonController lessonController,
    BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.read<LessonBlocs>().add(TriggerIndex(state.videoIndex - 1));
            if (state.videoIndex < 0) {
              context.read<LessonBlocs>().add(const TriggerIndex(0));
              toastInfo(msg: "No videos there");
              return;
            } else {
              var videoItem = state.lessonVideoItem.elementAt(state.videoIndex);
              lessonController.playVideo(videoItem.url!);
            }
          },
          child: Container(
            width: 24.w,
            height: 24.w,
            margin: EdgeInsets.only(right: 15.w),
            child: Image.asset("assets/icons/rewind-left.png"),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (state.isPlay) {
              lessonController.videoPlayerController?.pause();
              context.read<LessonBlocs>().add(const TriggerPlay(false));
            } else {
              lessonController.videoPlayerController?.play();
              context.read<LessonBlocs>().add(const TriggerPlay(true));
            }
          },
          child: state.isPlay
              ? Container(
                  width: 24.w,
                  height: 24.w,
                  child: Image.asset("assets/icons/pause.png"),
                )
              : Container(
                  width: 24.w,
                  height: 24.w,
                  child: Image.asset("assets/icons/play-circle.png"),
                ),
        ),
        GestureDetector(
          onTap: () {
            context.read<LessonBlocs>().add(TriggerIndex(state.videoIndex + 1));

            if (state.videoIndex >= state.lessonVideoItem.length) {
              context
                  .read<LessonBlocs>()
                  .add(TriggerIndex(state.videoIndex - 1));
              toastInfo(msg: "No videos there");
              return;
            } else {
              var videoItem = state.lessonVideoItem.elementAt(state.videoIndex);
              lessonController.playVideo(videoItem.url!);
            }
          },
          child: Container(
            width: 24.w,
            height: 24.w,
            margin: EdgeInsets.only(right: 15.w),
            child: Image.asset("assets/icons/rewind-right.png"),
          ),
        ),
      ],
    ),
  );
}

Widget buildLessonItems(BuildContext context, int index, LessonVideoItem item,
    LessonController lessonController) {
  return Container(
    width: 325.w,
    height: 80.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 1),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 1),
        )
      ],
    ),
    child: InkWell(
      onTap: () {
        context.read<LessonBlocs>().add(TriggerIndex(index));
        lessonController.playVideo(item.url!);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60.h,
                height: 60.h,
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(item.thumbnail!))),
              ),
              Container(
                width: 60.h,
                height: 60.h,
                margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
                child: reusableSubtitleText(item.name ?? "", fontSize: 13.sp),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 60.h,
                margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
                child: Image.asset(
                  'assets/icons/play-circle.png',
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
