import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/home/widgets/home_page_widgets.dart';
import 'package:shop_app/Presentation/views/search/bloc/search_bloc.dart';
import 'package:shop_app/Presentation/views/search/bloc/search_states.dart';
import 'package:shop_app/Presentation/views/search/search_controller.dart';
import 'package:shop_app/Presentation/views/sign-in/widgets/app_bar.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/values/constants.dart';
import 'package:shop_app/common/widgets/list_container.dart';
import 'package:shop_app/common/widgets/search_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late SearchViewController _searchController;
  @override
  void didChangeDependencies() {
    _searchController = SearchViewController(context);
    _searchController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Search"),
      body: BlocBuilder<SearchBloc, SearchStates>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                sliver: SliverToBoxAdapter(
                  child: searchView("Search your course"),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                sliver: SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.courseItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 325.w,
                            height: 80.h,
                            margin: EdgeInsets.only(top: 10.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.w),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: const Offset(0, 1)),
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.COURSE_DETAILS,
                                    arguments: {
                                      "id": state.courseItems[index].id
                                    });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 60.w,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                                "${AppConstants.SERVER_UPLOADS}${state.courseItems[index].thumbnail}"))),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      listContainer(
                                          state.courseItems[index].name ?? ""),
                                      listContainer(
                                          state.courseItems[index]
                                                  .description ??
                                              "",
                                          fontSize: 10,
                                          color:
                                              AppColors.primaryThirdElementText,
                                          fontWeight: FontWeight.normal)
                                    ],
                                  ),
                                  Container(
                                    child: Image(
                                        width: 24.w,
                                        height: 24.h,
                                        image: AssetImage(
                                            "assets/icons/arrow_right.png")),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
