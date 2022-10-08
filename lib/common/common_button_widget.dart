import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker/utils/app_constants.dart';
import 'package:poker/utils/app_utils.dart';

class CommonButtonWidget extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  double? fontSize;
  double? marginTop;
  double? radius;
  double? padding;
  VoidCallback? onPressed;

  CommonButtonWidget({
    this.text,
    this.fontWeight,
    this.fontSize,
    this.radius,
    this.marginTop,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? AppConstants.zero),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(radius ?? AppConstants.sixteen),
            )),
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(padding ?? AppConstants.twenty)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed: onPressed,
        child: Center(
          child: AppUtils.commonTextWidget(
              text: text,
              fontWeight: fontWeight ?? FontWeight.w600,
              fontSize: fontSize ?? AppConstants.fourteen),
        ),
      ),
    );
  }
}
