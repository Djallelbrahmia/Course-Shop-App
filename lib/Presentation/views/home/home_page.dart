import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_bloc.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_states.dart';
import 'package:shop_app/Presentation/views/home/home_controller.dart';
import 'package:shop_app/Presentation/views/home/widgets/home_page_widgets.dart';
import 'package:shop_app/common/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;
  @override
  void initState() {
    _homeController = HomeController(context: context);
    _homeController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _homeController.userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: buildHomeAppBar(_homeController.userProfile!.avatar!),
            body: BlocBuilder<HomePageBlocs, HomepageStates>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: homePageText("Hello",
                            top: 20.h,
                            color: AppColors.primaryThirdElementText),
                      ),
                      SliverToBoxAdapter(
                          child: homePageText(
                              _homeController.userProfile!.name ?? "",
                              top: 5.h)),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 20.h),
                      ),
                      SliverToBoxAdapter(child: searchView()),
                      SliverToBoxAdapter(child: slidersView(context, state)),
                      SliverToBoxAdapter(child: menuView()),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15.h,
                                  crossAxisSpacing: 15.h,
                                  childAspectRatio: 1.6),
                          delegate: SliverChildBuilderDelegate(
                            childCount: state.courseItems.length,
                            (context, index) => GestureDetector(
                                onTap: () {},
                                child: courseGrid(state.courseItems[index])),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
