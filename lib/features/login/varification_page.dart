import 'package:flutter/material.dart';
import 'package:poker/core/common/CustomOTP.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_otp_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/core/utils/validation.dart';

class VarificationPage extends StatefulWidget {
  const VarificationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return VarificationPageState();
  }
}

class VarificationPageState extends State<VarificationPage> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CommonBgPage(
          alignment: Alignment.topLeft,
          imagePath: icBackground,
          widget: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstants.sixty,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        AppUtils.onBack(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: AppConstants.twentyFour,
                        color: AppColor.colorWhite,
                      )),
                ),
                CommonTextWidget(
                  text: StringUtils.forgotPassword,
                  fontWeight: FontWeight.w700,
                  margintop: AppConstants.fortyFive,
                  fontSize: AppConstants.twentyFour,
                ),
                CommonTextWidget(
                  text:
                      "We've sent a 6-digit confirmation code to johndoe@gmail.com. Make sure you enter \ncorrect code.",
                  margintop: AppConstants.thirtyFive,
                ),
                SizedBox(
                  height: AppConstants.twentyFour,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /*CustomOTP(
                      first: true,
                      last: false,
                      autoFocus: true,
                      controller:
                      textEditingController1,
                    ),
                    CustomOTP(
                      first: true,
                      last: false,
                      autoFocus: true,
                      controller:
                      textEditingController2,
                    ),
                    CustomOTP(
                      first: true,
                      last: false,
                      autoFocus: true,
                      controller:
                      textEditingController3,
                    ),
                    CustomOTP(
                      autoFocus: true,
                      first: true,
                      last: false,
                      controller:
                      textEditingController4,
                    ),
                    CustomOTP(
                      first: true,
                      last: false,
                      autoFocus: true,
                      controller:
                      textEditingController5,
                    ),
                    CommonOtpWidget(
                      first: true,
                      last: false,
                      controller:
                      textEditingController6,
                    ),*/
                   CommonOtpWidget(
                       controller: textEditingController1,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        controller: textEditingController2,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        controller: textEditingController3,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        controller: textEditingController4,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        controller: textEditingController5,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        controller: textEditingController6,
                        first: false,
                        last: true),
                  ],
                ),
                CommonButtonWidget(
                    onPressed:onClickVerify,
                    text: StringUtils.verify,
                    marginTop: AppConstants.thirtyFive),
                Center(
                  child: AppUtils.richText(
                      top: AppConstants.fortyFive,
                      text: StringUtils.recieved,
                      onTap: () {},
                      linkText: StringUtils.resendCode),
                ),
              ],
            ),
          )),
    );
  }

  void onClickVerify(){
   AppUtils.closeKeyBoard(context);
   if(Validation.isEmptyString(textEditingController1.text.toString())){
     AppUtils.showMessage(context: context,message: "All field required");
   }
   else  if(Validation.isEmptyString(textEditingController2.text.toString())){
     AppUtils.showMessage(context: context,message: "All field required");
   }
   else  if(Validation.isEmptyString(textEditingController3.text.toString())){
     AppUtils.showMessage(context: context,message: "All field required");
   }
   else  if(Validation.isEmptyString(textEditingController4.text.toString())){
     AppUtils.showMessage(context: context,message: "All field required");
   }
   else  if(Validation.isEmptyString(textEditingController5.text.toString())){
     AppUtils.showMessage(context: context,message: "All field required");
   }
   else  if(Validation.isEmptyString(textEditingController6.text.toString())){
     AppUtils.showMessage(context: context,message: "All field required");
   }
   else{
     AppUtils.onBack(context);
   }
  }
}
