import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/image_path.dart';

class AppUtils {
  static BoxDecoration containerDecorationBg() {
    return  BoxDecoration(
      image: DecorationImage(image: AssetImage(icDashboardBg),fit: BoxFit.fill),
     /* gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
       stops: [0.6, 1],

        colors: [AppColor.colorBlue, AppColor.colorBlueLight],
      ),*/
    );
  }

  static BoxDecoration containerDecoration({
    double radius = 13,
    Color color = Colors.white,

    BoxShape boxShape = BoxShape.rectangle,
  }) {
    return BoxDecoration(
        color: color,
        shape: boxShape,
        border: Border.all(
          color: AppColor.colorBlueLight,
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static Widget richText({
    String? text,
    String? linkText,
    double? fontSize,
    FontWeight? fontWeight,
    FontWeight? fontWeightLink,
    double? top,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(top:top??AppConstants.zero ),
      child: RichText(
        text: TextSpan(
          //style: TextStyle(color: Colors.black, fontSize: 14),
          children: <TextSpan>[
            TextSpan(
                text:text,
                style: TextStyle(
                  letterSpacing: 0.5,
                    color: Colors.white,
                    fontSize: fontSize ?? AppConstants.fourteen,
                    fontWeight: fontWeight ?? FontWeight.w500)),
            // TextSpan(text: 'dot '),
            TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onTap,
                text: linkText,
                style:  TextStyle(
                    letterSpacing: 0.5,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: fontSize ?? AppConstants.fourteen,
                    fontWeight: fontWeight ?? FontWeight.w700))
          ],
        ),
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
    return Center(
      child: Image.asset(
        path!,
        width: width,
        height: height,
        alignment: alignment ?? Alignment.center,
        color: iconColor,
        fit: boxFit ?? BoxFit.cover,
      ),
    );
  }

  static textStyle(
      {double? letterSpacing,
        FontWeight? fontWeight,
        double? fontSize,
        Color? textColor,
        TextDecoration? textDecoration}) {
    return TextStyle(
        letterSpacing: letterSpacing ?? AppConstants.zero05,
        fontSize: fontSize ?? AppConstants.fourteen,
        color: textColor ?? AppColor.colorWhite,

        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: textDecoration ?? TextDecoration.none);
  }
}