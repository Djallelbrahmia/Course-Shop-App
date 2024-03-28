import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';

AppBar buildBaseAppBar(String title) {
  return AppBar(
    title: reusableSubtitleText(title),
  );
}
