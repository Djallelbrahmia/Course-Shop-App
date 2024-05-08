import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/search/bloc/search_bloc.dart';
import 'package:shop_app/Presentation/views/search/bloc/search_event.dart';
import 'package:shop_app/common/apis/course_api.dart';
import 'package:shop_app/common/widgets/toast.dart';

class SearchViewController {
  late BuildContext context;
  SearchViewController(this.context);
  void init() {
    asyncLoadRecommendedData();
  }

  Future<void> asyncLoadRecommendedData() async {
    var result = await CourseAPI.courseList();
    if (result.code == 200) {
      if (context.mounted) {
        context.read<SearchBloc>().add(TriggerSearchEvents(result.data!));
      } else {
        toastInfo(msg: "Internet error");
      }
    }
  }
}
