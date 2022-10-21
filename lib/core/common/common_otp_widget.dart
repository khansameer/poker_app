
import 'package:flutter/material.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';

class CommonOtpWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool? first;
  final bool? last;
  final double? top;

  const CommonOtpWidget({
    Key? key,
    this.controller,
    this.first,
    this.last,
    this.top
  }) : super(key: key);

  //Used custom edittext but view is not set perfect
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height:65,
      margin: EdgeInsets.only(top:top??24 ),
      alignment: Alignment.center,
      decoration: AppUtils.containerDecoration(
        color: AppColor.colorGrayLight1,

        radius: AppConstants.ten,
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Center(
            child:
                TextField(

                  controller: controller,
          maxLength: 1,
          showCursor: false,
          readOnly: false,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          keyboardType: TextInputType.number,
          style: AppUtils.textStyle(
            textColor: AppColor.colorWhite,
            fontSize: AppConstants.fourteen,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          cursorColor: AppColor.colorWhite,
          decoration: InputDecoration(
            counterText: "",
            isDense: true,
            hintText: '*',
            hintStyle: AppUtils.textStyle(
              textColor: AppColor.colorWhite,
              fontSize: AppConstants.fourteen,
            ),
            border: InputBorder.none,
          ),
        )),
      ),
    );
  }
}
