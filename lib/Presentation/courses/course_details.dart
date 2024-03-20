import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/courses/course_details_widgets.dart';
import 'package:shop_app/common/routes/names.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  late String id;
  @override
  void didChangeDependencies() {
    var data = ModalRoute.of(context)?.settings.arguments as Map;
    id = data["id"].toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildCourseDetailsAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thumbNail(),
                  SizedBox(
                    height: 15.h,
                  ),
                  menuViewCourseDetails(),
                  SizedBox(
                    height: 15.h,
                  ),
                  reusableSubtitleText("Course Description"),
                  SizedBox(
                    height: 15.h,
                  ),
                  descriptionText(
                    "Lorem Ipsum is simply dummy text whenurvived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ng Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(onTap: () {}, child: goBuyButton("Go Buy")),
                  SizedBox(
                    height: 10.h,
                  ),
                  courseSummaryTitle(),
                  courseSummaryView(context),
                  SizedBox(
                    height: 20.h,
                  ),
                  reusableSubtitleText("Lesson list"),
                  SizedBox(
                    height: 20.h,
                  ),
                  courseLessonList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
