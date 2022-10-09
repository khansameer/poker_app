import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker/core/utils/app_color.dart';

import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_constants.dart';
class CommonTextField extends StatelessWidget {
  String? hint;
  FontWeight? fontWeight;
  double? fontSize;
  double? marginTop;
  Widget? iconWidget;
  double? radius;
  TextInputType? inputTypes;
  Widget? suffixIcon;
  ValueChanged? onChange;
  bool? obscureText;
  TextInputAction? textInputAction;
  CommonTextField({
    this.hint,
    this.fontWeight,
    this.fontSize,
    this.iconWidget,
    this.radius,
    this.inputTypes,
    this.suffixIcon,
    this.onChange,
    this.marginTop,
    this.obscureText,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop??AppConstants.five),
      color: Colors.transparent,
      child: TextField(
        onChanged: onChange,
        keyboardType: inputTypes,
        autocorrect: true,
        obscureText: obscureText??false,
        textInputAction: textInputAction,
        style: TextStyle(
          fontWeight: fontWeight,
          color: AppColor.colorWhite,
          fontSize: fontSize,

        ),
        decoration: InputDecoration(

            hintText:hint,
            suffixIcon:suffixIcon,
            prefixIcon:iconWidget ,

            hintStyle: TextStyle(fontWeight: fontWeight,
              color: AppColor.colorWhite,
              fontSize: fontSize,),
            filled: true,
            fillColor: AppColor.colorGrayLight1,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius!)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius!)),
            )),
      ),
    );
  }
}
