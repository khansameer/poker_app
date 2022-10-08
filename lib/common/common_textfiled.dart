import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker/utils/app_color.dart';
import 'package:poker/utils/app_constants.dart';

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
            hintStyle: TextStyle(color: Colors.white),
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
