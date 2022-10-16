import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';

class CommonButtonWidget extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  double? fontSize;
  double? marginTop;
  double? left;
  double? right;
  double? bottom;
  double? radius;
  double? padding;
  VoidCallback? onPressed;
  Color? colorButton;

  CommonButtonWidget({
    this.text,
    this.fontWeight,
    this.fontSize,
    this.radius,
    this.marginTop,
    this.onPressed,
    this.colorButton,
    this.left,
    this.right,
    this.bottom,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: marginTop ?? AppConstants.zero,
          left: left ?? AppConstants.zero,
          bottom: bottom??AppConstants.zero,
          right: right ?? AppConstants.zero),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(padding ?? AppConstants.eighteen),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? AppConstants.eight),
          ),
          backgroundColor:
              colorButton ?? AppColor.colorButton, // Background Color
        ),
        onPressed: onPressed,
        child: Center(
          child: CommonTextWidget(
              text: text,
              fontWeight: fontWeight ?? FontWeight.w600,
              fontSize: fontSize ?? AppConstants.fourteen),
        ),
      ),
    );
  }
}
