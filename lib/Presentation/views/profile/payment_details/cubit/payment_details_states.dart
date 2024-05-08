import 'package:shop_app/common/entities/course.dart';

abstract class PaymentDetailStates {
  const PaymentDetailStates();
}

class InitPaymentDetailStates extends PaymentDetailStates {
  const InitPaymentDetailStates();
}

class LoadingPaymentDetailStates extends PaymentDetailStates {
  const LoadingPaymentDetailStates();
}

class DoneLoadingPaymentDetailStates extends PaymentDetailStates {
  const DoneLoadingPaymentDetailStates();
}

class HistoryPaymentDetailsStates extends PaymentDetailStates {
  final List<CourseItem>? courseItems;
  const HistoryPaymentDetailsStates(this.courseItems);
}
