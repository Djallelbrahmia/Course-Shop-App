import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/courses/course_detail/payWebView/bloc/payview_event.dart';
import 'package:shop_app/Presentation/courses/course_detail/payWebView/bloc/payview_stats.dart';

class PayWebViewBloc extends Bloc<PayWebViewEvent, PayWebViewStates> {
  PayWebViewBloc() : super(const PayWebViewStates()) {
    on<TriggerWebView>(_triggerWebView);
  }
  void _triggerWebView(TriggerWebView event, Emitter<PayWebViewStates> emit) {
    emit(state.copyWith(url: event.url));
  }
}
