import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/Presentation/courses/bloc/course_blocs.dart';
import 'package:shop_app/Presentation/courses/course_detail/bloc/course_d_blocs.dart';
import 'package:shop_app/Presentation/courses/course_detail/bloc/course_d_events.dart';
import 'package:shop_app/common/apis/course_api.dart';
import 'package:shop_app/common/entities/entities.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/widgets/toast.dart';

class CourseDetailsController {
  final BuildContext context;
  CourseDetailsController({required this.context});
  Future<void> init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    await asyncLoadAllData(args["id"]);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetails(courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context
            .read<CourseDetailsBloc>()
            .add(TriggerCourseDetail(result.data!));
      }
    } else
      (print('SERVER SIDE ERROR'));
  }

  void goBuy(int? id) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(), dismissOnTap: true);
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);
      if (context.mounted) {
        Navigator.of(context)
            .pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {"url": url});
      }
    } else {
      toastInfo(msg: result.msg ?? "UNKNOWN ERROR");
    }
  }
}
