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
  Color? colorFill;
  Color? colorText;
  Color? colorHint;
  double? left;
  double? rigth;
  TextEditingController? controller;
  TextInputAction? textInputAction;
  bool? isDense;
  int? maxLines;
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
    this.controller,
    this.colorFill,
    this.colorText,
    this.left,
    this.rigth,
    this.isDense,
    this.colorHint,
    this.maxLines,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop??AppConstants.five,left: left??0,right:rigth??0),
      color: Colors.transparent,
      child: TextField(
        maxLines: maxLines??1,
        controller: controller,
        onChanged: onChange,
        keyboardType: inputTypes,
        autocorrect: true,
        obscureText: obscureText??false,
        textInputAction: textInputAction,
        style: TextStyle(
          fontWeight: fontWeight,
          color: colorText?? AppColor.colorWhite,
          fontSize: fontSize,

        ),
        decoration: InputDecoration(
            isDense: isDense ?? false,
            hintText:hint,
            suffixIcon:suffixIcon,
            prefixIcon:iconWidget ,

            hintStyle: TextStyle(fontWeight: fontWeight,
              color: colorHint??AppColor.colorWhite,
              fontSize: fontSize,),
            filled: true,
            fillColor: colorFill?? AppColor.colorGrayLight1,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: AppConstants.one,
                color: AppColor.colorGrayLight1
              ),
              borderRadius: BorderRadius.all(Radius.circular(radius!)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: AppConstants.one,
                  color: AppColor.colorGrayLight1
              ),
              borderRadius: BorderRadius.all(Radius.circular(radius!)),
            )),
      ),
    );
  }
}
