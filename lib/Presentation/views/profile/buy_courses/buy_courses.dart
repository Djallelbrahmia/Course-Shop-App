import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/home/widgets/home_page_widgets.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/bloc/buy_courses_bloc.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/bloc/buy_courses_states.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/buy_courses_controller.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/buy_courses_widget.dart';

class BuyCourses extends StatefulWidget {
  const BuyCourses({super.key});

  @override
  State<BuyCourses> createState() => _BuyCoursesState();
}

class _BuyCoursesState extends State<BuyCourses> {
  late BuyCoursesController _buyCoursesController;
  @override
  void didChangeDependencies() {
    _buyCoursesController = BuyCoursesController(context: context);
    _buyCoursesController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCourseBlocs, BuyCoursesStates>(
        builder: (context, state) {
      if (state is LoadedBuyCoursesStates) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            child: SingleChildScrollView(
                child: Column(
              children: [courseBoughtTitle(), buildBoughtListItem(state)],
            )),
          ),
        );
      } else if (state is DownloadedBuyCoursesStates) {
        return Container();
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
