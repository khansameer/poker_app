
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker/core/utils/app_color.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  ProgressIndicatorWidget({this.title});

  @override
  State<StatefulWidget> createState() {
    return _ProgressIndicatorWidgetState(title);
  }

  final String? title;
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with WidgetsBindingObserver {
  String? title = "";

  _ProgressIndicatorWidgetState(String? title) {
    title = title;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColor.colorBlue),
    );
  }
}
