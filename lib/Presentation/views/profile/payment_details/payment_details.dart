import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/profile/payment_details/cubit/payment_details_cubit.dart';
import 'package:shop_app/Presentation/views/profile/payment_details/cubit/payment_details_states.dart';
import 'package:shop_app/Presentation/views/profile/payment_details/payment_details_controller.dart';
import 'package:shop_app/Presentation/views/profile/payment_details/payment_details_widgets.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  late PaymentDetailsController _paymentDetailsController;
  @override
  void didChangeDependencies() {
    _paymentDetailsController = PaymentDetailsController(context: context);
    _paymentDetailsController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentDetailsCubits, PaymentDetailStates>(
      builder: (context, state) {
        if (state is HistoryPaymentDetailsStates) {
          return Scaffold(
            appBar: AppBar(
              title: reusableSubtitleText("Payment details"),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  paymentDetailstitle(),
                  buildListPaymentDetailstItem(state)
                ],
              )),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
