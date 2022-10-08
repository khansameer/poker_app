import 'package:flutter/material.dart';
import 'package:poker/utils/app_color.dart';

class  AppUtils{
  static BoxDecoration containerDecorationBg() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0 , 2],
        tileMode: TileMode.mirror,
        colors: [AppColor.colorBlueLight, AppColor.colorBlue],
      ),
    );
  }
}