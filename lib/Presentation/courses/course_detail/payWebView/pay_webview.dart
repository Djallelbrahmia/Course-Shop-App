import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/courses/course_detail/payWebView/bloc/payview_bloc.dart';
import 'package:shop_app/Presentation/courses/course_detail/payWebView/bloc/payview_event.dart';
import 'package:shop_app/Presentation/courses/course_detail/payWebView/bloc/payview_stats.dart';
import 'package:shop_app/Presentation/courses/course_detail/payWebView/pay_webview_controller.dart';
import 'package:shop_app/common/widgets/app_bar.dart';
import 'package:shop_app/common/widgets/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebView extends StatefulWidget {
  const PayWebView({super.key});

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  final WebViewController _controller = WebViewController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    context.read<PayWebViewBloc>().add(TriggerWebView(args['url']));
  }

  @override
  void dispose() {
    _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PayWebViewBloc, PayWebViewStates>(
      listener: (context, state) {
        _controller.loadRequest(Uri.parse(state.url));
        _controller.addJavaScriptChannel("Pay",
            onMessageReceived: (JavaScriptMessage message) {
          toastInfo(msg: message.message);
          Navigator.of(context).pop(message.message);
        });
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildBaseAppBar("Payment page"),
          body: WebViewWidget(
            controller: _controller,
          ),
        );
      },
    );
  }
}
