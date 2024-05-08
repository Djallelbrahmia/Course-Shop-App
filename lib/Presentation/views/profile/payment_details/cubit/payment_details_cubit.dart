import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/profile/payment_details/cubit/payment_details_states.dart';
import 'package:shop_app/common/entities/course.dart';

class PaymentDetailsCubits extends Cubit<PaymentDetailStates> {
  PaymentDetailsCubits() : super(const InitPaymentDetailStates());
  void historyPaymentDetails(List<CourseItem>? courseItems) {
    emit(HistoryPaymentDetailsStates(courseItems));
  }

  void loadingPaymentDetails() {
    emit(const LoadingPaymentDetailStates());
  }

  void doneLoadingPaymentDetails() {
    emit(const DoneLoadingPaymentDetailStates());
  }
}
