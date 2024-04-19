import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/courses/lesson/bloc/lesson_bloc.dart';
import 'package:shop_app/Presentation/courses/lesson/bloc/lesson_events.dart';
import 'package:shop_app/Presentation/courses/lesson/bloc/lesson_states.dart';
import 'package:shop_app/Presentation/courses/lesson/lesson_controller.dart';
import 'package:shop_app/Presentation/courses/lesson/widgets/lesson_details_widget.dart';
import 'package:shop_app/Presentation/views/sign-in/widgets/app_bar.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({super.key});

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  late LessonController _lessonController;
  @override
  void didChangeDependencies() {
    _lessonController = LessonController(context: context);
    _lessonController.init();
    context.read<LessonBlocs>().add(const TriggerUrlItem(null));
    context.read<LessonBlocs>().add(const TriggerIndex(0));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBlocs, LessonStates>(builder: (context, state) {
      return SafeArea(
          child: Container(
        color: Colors.white,
        child: Scaffold(
          appBar: buildAppBar("Lesson details"),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                sliver: SliverToBoxAdapter(
                    child: Column(
                  children: [
                    //video Preview
                    videoPlayer(state, _lessonController),
                    videoButtons(state, _lessonController, context)
                  ],
                )),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 25.w),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => buildLessonItems(context, index,
                            state.lessonVideoItem[index], _lessonController),
                        childCount: state.lessonVideoItem.length)),
              )
            ],
          ),
        ),
      ));
    });
  }
}
