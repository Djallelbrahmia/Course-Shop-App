import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_bloc.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_states.dart';
import 'package:shop_app/Presentation/views/home/home_controller.dart';
import 'package:shop_app/Presentation/views/home/widgets/home_page_widgets.dart';
import 'package:shop_app/common/entities/user.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/widgets/search_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem? userProfile;
  @override
  void initState() {
    userProfile = HomeController(context: context).userProfile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: buildHomeAppBar(userProfile!.avatar!),
            body: RefreshIndicator(
              onRefresh: () {
                return HomeController(context: context).init();
              },
              child: BlocBuilder<HomePageBlocs, HomepageStates>(
                builder: (context, state) {
                  if (state.courseItems.isEmpty) {
                    HomeController(context: context).init();
                  }
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
                            child: homePageText(userProfile!.name ?? "",
                                top: 5.h)),
                        SliverPadding(
                          padding: EdgeInsets.only(top: 20.h),
                        ),
                        SliverToBoxAdapter(
                            child: searchView("Search your course")),
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
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        AppRoutes.COURSE_DETAILS,
                                        arguments: {
                                          "id": state.courseItems
                                              .elementAt(index)
                                              .id
                                        });
                                  },
                                  child: courseGrid(state.courseItems[index])),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        : Container();
  }
}
