
import 'package:flutter/material.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';

class CustomOTP extends StatelessWidget {
  final TextEditingController? controller;
  final bool autoFocus;
  final String? title;
  final String? desc;
  final double? top;
  final bool? first;
  final bool? last;

  const CustomOTP({
    Key? key,
    this.title,
    this.first,
    this.last,
    this.controller,
    this.top,
    this.desc, required this.autoFocus,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height:65,
      margin: EdgeInsets.only(top:top??24 ),
      decoration: AppUtils.containerDecoration(
        color: AppColor.colorGrayLight1,

        radius: AppConstants.ten,
        //radius: AppConstants.radius24,
       // isBoxShadow: false,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextField(
            //autofocus: autoFocus,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: controller,
            maxLength: 1,
            showCursor: false,
            readOnly: false,
            style: AppUtils.textStyle(
              textColor: AppColor.colorWhite,
              fontSize: AppConstants.fourteen,
              fontWeight: FontWeight.w500,
            ),
            cursorColor:AppColor.colorWhite,
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
            onChanged: (value) {
            /*  if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }*/
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && first == false) {
                FocusScope.of(context).previousFocus();
              }

            },
          ),
        ],
      ),
    );
  }
}