import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/bloc/course_d_blocs.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/bloc/course_d_states.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/course_controller.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/course_details_widgets.dart';

import 'package:shop_app/common/widgets/base_text_widget.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  late CourseDetailsController _controller;
  @override
  void didChangeDependencies() {
    _controller = CourseDetailsController(context: context);
    _controller.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailsBloc, CourseDetailsStates>(
      builder: (context, state) {
        return state.courseItem == null
            ? const CircularProgressIndicator()
            : Container(
                color: Colors.white,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: buildCourseDetailsAppBar(),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 25.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            thumbNail(img: state.courseItem?.thumbnail ?? ""),
                            SizedBox(
                              height: 15.h,
                            ),
                            menuViewCourseDetails(
                                nOfPeople: state.courseItem?.follow ?? 0,
                                nOfReview: state.courseItem?.score ?? 0),
                            SizedBox(
                              height: 15.h,
                            ),
                            reusableSubtitleText(state.courseItem?.name ?? ""),
                            SizedBox(
                              height: 15.h,
                            ),
                            descriptionText(
                                state.courseItem?.description ?? ""),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                                onTap: () {
                                  _controller.goBuy(state.courseItem?.id);
                                },
                                child: goBuyButton("Go Buy")),
                            SizedBox(
                              height: 10.h,
                            ),
                            courseSummaryTitle(),
                            courseSummaryView(context,
                                nLesson: state.courseItem?.lesson_num ?? 0,
                                vLength: state.courseItem?.video_len ?? 0,
                                dRessources: state.courseItem?.down_num ?? 0),
                            SizedBox(
                              height: 20.h,
                            ),
                            reusableSubtitleText("Lesson list"),
                            SizedBox(
                              height: 20.h,
                            ),
                            courseLessonList(state)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
