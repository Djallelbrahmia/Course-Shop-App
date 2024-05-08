import 'package:shop_app/common/entities/entities.dart';

abstract class BuyCoursesStates {
  const BuyCoursesStates();
}

class LoadingBuyCoursesStates extends BuyCoursesStates {
  const LoadingBuyCoursesStates();
}

class DownloadedBuyCoursesStates extends BuyCoursesStates {
  const DownloadedBuyCoursesStates();
}

class InitialBuyCoursesStates extends BuyCoursesStates {
  const InitialBuyCoursesStates();
}

class LoadedBuyCoursesStates extends BuyCoursesStates {
  final List<CourseItem> courseItem;
  const LoadedBuyCoursesStates(this.courseItem);
}
