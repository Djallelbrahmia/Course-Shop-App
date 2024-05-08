import 'package:shop_app/common/entities/course.dart';

abstract class BuyCoursesEvents {
  const BuyCoursesEvents();
}

class TriggerLoadingBuyCoursesEvents extends BuyCoursesEvents {
  const TriggerLoadingBuyCoursesEvents();
}

class TriggerInitialBuyCoursesEvents extends BuyCoursesEvents {
  const TriggerInitialBuyCoursesEvents();
}

class TriggerDownloadedBuyCoursesEvents extends BuyCoursesEvents {
  const TriggerDownloadedBuyCoursesEvents();
}

class TriggerLoadedBuyCoursesEvents extends BuyCoursesEvents {
  final List<CourseItem> courseItem;
  const TriggerLoadedBuyCoursesEvents(this.courseItem);
}
