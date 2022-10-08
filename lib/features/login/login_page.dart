import 'package:flutter/material.dart';
import 'package:poker/common/common_bg_page.dart';
import 'package:poker/common/common_button_widget.dart';
import 'package:poker/common/common_textfiled.dart';
import 'package:poker/utils/app_color.dart';
import 'package:poker/utils/app_constants.dart';
import 'package:poker/utils/app_utils.dart';
import 'package:poker/utils/string_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CommonBgPage(
              imagePath: "",
              widget: Container(
                // margin: EdgeInsets.only(top: 56),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppUtils.commonTextWidget(text: StringUtils.email),
                    CommonTextField(
                        marginTop: AppConstants.ten,
                        hint: StringUtils.emailHint,
                        iconWidget: const Icon(
                          Icons.email,
                          color: AppColor.colorWhite,
                        ),
                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    AppUtils.commonTextWidget(
                        text: StringUtils.password, top: AppConstants.ten),
                    CommonTextField(
                        hint: StringUtils.password,
                        iconWidget: const Icon(
                          Icons.lock,
                          color: AppColor.colorWhite,
                        ),
                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppUtils.commonTextWidget(
                          text: StringUtils.forgotPassword,
                          top: AppConstants.twenty),
                    ),
                    CommonButtonWidget(
                        text: StringUtils.login,
                        marginTop: AppConstants.twenty),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        commonButton(top: AppConstants.sixteen,widgetIcon: const Icon(
                          Icons.facebook,
                          color: Colors.red,
                        )),
                        commonButton(left: AppConstants.sixteen ,top: AppConstants.sixteen,widgetIcon: const Icon(
                          Icons.email,
                          color: Colors.red,
                        )),
                        commonButton(left: AppConstants.sixteen ,top: AppConstants.sixteen,widgetIcon: const Icon(
                          Icons.library_add,
                          color: Colors.red,
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppUtils.commonTextWidget(
                            top: AppConstants.twenty,
                            fontWeight: FontWeight.w500,
                            text: StringUtils.anAccount
                        ),
                        TextButton(
                          onPressed: (){},
                          child: AppUtils.commonTextWidget(
                              top: AppConstants.twenty,
                              fontWeight: FontWeight.w700,
                              textDecoration: TextDecoration.underline,
                              text: StringUtils.signup
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget commonButton({double? left, double? right, double? top,Widget? widgetIcon}) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Container(
        margin: EdgeInsets.only(
            left: left ?? AppConstants.zero,
            right: right ?? AppConstants.zero,
            top: top ?? AppConstants.zero),
        decoration: AppUtils.containerDecoration(color: Colors.white),
        width: 54,
        height: 54,
        child: widgetIcon,
      ),
    );
  }
}
