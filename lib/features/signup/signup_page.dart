import 'package:flutter/material.dart';
import 'package:poker/common/common_bg_page.dart';
import 'package:poker/common/common_button_widget.dart';
import 'package:poker/common/common_textfield.dart';
import 'package:poker/utils/app_color.dart';
import 'package:poker/utils/app_constants.dart';
import 'package:poker/utils/app_utils.dart';
import 'package:poker/utils/image_path.dart';
import 'package:poker/utils/string_utils.dart';

class SignupPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignupPageState();
  }
  
}
class SignupPageState extends State<SignupPage>{
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CommonBgPage(
            alignment: Alignment.topLeft,
              imagePath: icBackground,
              widget: SingleChildScrollView(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: AppConstants.sixty,),
                    Align(
                      alignment: Alignment.topLeft,
                      child:Icon(Icons.arrow_back_ios,size: AppConstants.twentyFour,color: AppColor.colorWhite,),
                    ),
                    AppUtils.commonTextWidget(
                      text: StringUtils.signup,
                      fontWeight: FontWeight.w700,
                      top: AppConstants.fortyFive,
                      fontSize: AppConstants.twenty,
                    ),
                    AppUtils.commonTextWidget(
                      text: StringUtils.firstName,
                      top: AppConstants.sixteen,
                    ),
                    CommonTextField(
                        inputTypes: TextInputType.name,
                        marginTop: AppConstants.ten,
                        hint: StringUtils.your+StringUtils.firstName,

                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    AppUtils.commonTextWidget(
                      text: StringUtils.lastName,
                      top: AppConstants.sixteen,
                    ),
                    CommonTextField(
                        marginTop: AppConstants.ten,
                        inputTypes: TextInputType.name,
                        hint: StringUtils.your+StringUtils.lastName,

                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    AppUtils.commonTextWidget(
                      text: StringUtils.password,
                      top: AppConstants.sixteen,
                    ),



                    CommonTextField(
                        obscureText: obscureText,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: !obscureText
                              ? Icon(
                            Icons.visibility,
                            color: AppColor.colorWhite,
                            size: AppConstants.twenty,
                          )
                              : Icon(
                            Icons.visibility_off,
                            color: AppColor.colorWhite,
                            size: AppConstants.twenty,
                          ),
                        ),
                        inputTypes: TextInputType.visiblePassword,
                        marginTop: AppConstants.ten,
                        hint: StringUtils.password,
                        iconWidget: const Icon(
                          Icons.lock_outline,
                          color: AppColor.colorWhite,
                        ),
                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppUtils.commonTextWidget(
                            top: AppConstants.thirty,
                            fontWeight: FontWeight.w500,
                            text: "By signing up you agree to our"),
                        Expanded(
                          child: AppUtils.commonTextWidget(
                              top: AppConstants.thirty,
                              fontWeight: FontWeight.w700,
                              textDecoration: TextDecoration.underline,
                              text: "Terms & Condition"),
                        ),
                        Expanded(
                          child: AppUtils.commonTextWidget(
                              top: AppConstants.thirty,
                              fontWeight: FontWeight.w600,
                              textDecoration: TextDecoration.underline,
                              text: "and Privacy Policy."),
                        ),
                      ],
                    ),
                    CommonButtonWidget(
                        text: StringUtils.login,
                        marginTop: AppConstants.twenty),


                  ],
                ),
              )),
        ],
      ),
    );
  }
  
}