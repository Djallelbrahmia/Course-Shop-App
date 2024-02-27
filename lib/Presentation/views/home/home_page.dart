import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/home/widgets/home_page_widgets.dart';
import 'package:shop_app/common/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildHomeAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText("Hello",
                top: 20.h, color: AppColors.primaryThirdElementText),
            homePageText("Djallel", top: 5.h),
            SizedBox(
              height: 20.h,
            ),
            searchView(),
            menuView()
          ],
        ),
      ),
    );
  }
}
