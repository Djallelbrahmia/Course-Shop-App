import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/Presentation/views/profile/payment_details/cubit/payment_details_cubit.dart';
import 'package:shop_app/common/apis/course_api.dart';

class PaymentDetailsController {
  late BuildContext context;
  PaymentDetailsController({required this.context});
  void init() {
    asyncLoadBuyCourseData();
  }

  asyncLoadBuyCourseData() async {
    context.read<PaymentDetailsCubits>().loadingPaymentDetails();
    var result = await CourseAPI.orderList();
    if (result.code == 200) {
      if (context.mounted) {
        context.read<PaymentDetailsCubits>().doneLoadingPaymentDetails();

        Future.delayed(const Duration(milliseconds: 100), () {
          context
              .read<PaymentDetailsCubits>()
              .historyPaymentDetails(result.data);
        });
      }
    }
  }
}
