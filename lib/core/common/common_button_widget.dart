import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';

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
  EdgeInsetsGeometry? paddingOnly;
  VoidCallback? onPressed;
  Color? colorButton;
  Color? colorBorder;
  double? borderWidth;
  bool? iconShow;

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
    this.borderWidth,
    this.colorBorder,
    this.paddingOnly,
    this.iconShow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: paddingOnly,
      margin: EdgeInsets.only(
          top: marginTop ?? AppConstants.zero,
          left: left ?? AppConstants.zero,
          bottom: bottom??AppConstants.zero,
          right: right ?? AppConstants.zero),
      child: TextButton(
        style: TextButton.styleFrom(

          foregroundColor: colorButton ?? AppColor.colorButton,
          padding: paddingOnly??EdgeInsets.all(padding ?? AppConstants.eighteen),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: borderWidth??0,color: colorBorder??Colors.transparent),
            borderRadius: BorderRadius.circular(radius ?? AppConstants.eight),
          ),
          backgroundColor:
              colorButton ?? AppColor.colorButton, // Background Color
        ),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconShow??false?Container(margin:EdgeInsets.only(right: 10),child: Icon(Icons.add,color: Colors.white,)):SizedBox.shrink(),
              CommonTextWidget(
                  text: text,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  fontSize: fontSize ?? AppConstants.fourteen),
            ],
          ),
        ),
      ),
    );
  }
}
