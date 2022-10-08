import 'package:flutter/material.dart';
import 'package:poker/common/custom_text_widget.dart';
import 'package:poker/utils/app_color.dart';
import 'package:poker/utils/app_constants.dart';

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

  static Widget commonTextWidget(
      {String? text,
        double? top,
        double? left,
        double? right,
        double? textTopMargin,
        Color? textColor,
        double? fontSize,
        double? letterSpacing,
        bool? isClickable,
        TextDecoration? textDecoration,
        TextAlign? textAlign,
        FontWeight? fontWeight}) {
    return Container(
      margin: EdgeInsets.only(
        top: top ?? AppConstants.zero,
        left: left ?? AppConstants.zero,
        right: right ?? AppConstants.zero,
      ),
      child: CustomTextWidget(
        margintopSize: textTopMargin ?? AppConstants.zero,
        text: text,
        textDecoration: textDecoration ?? TextDecoration.none,
        textAlign: textAlign ?? TextAlign.center,
        fontWeight: fontWeight ?? FontWeight.w500,
        isClickable: isClickable,
        textColor: textColor ?? AppColor.colorWhite,
        fontSize: fontSize ?? AppConstants.fourteen,
        letterSpacing: letterSpacing ?? AppConstants.zero05,
      ),
    );
  }
  static Widget commonImageAssetWidget(
      {String? path,
        double? width,
        double? height,
        Alignment? alignment,
        Color? iconColor,
        BoxFit? boxFit}) {
    return Image.asset(
      path!,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
      color: iconColor,
      fit: boxFit ?? BoxFit.cover,
    );
  }
}