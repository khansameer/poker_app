import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CommonBgPage(
      imagePath: icBackground,
      widget: Scaffold(
        backgroundColor: Colors.transparent,

        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: AppConstants.thirtyFive,
                ),
                Align(
                  alignment: Alignment.center,
                  child: AppUtils.commonImageAssetWidget(
                      path: icLogo,
                      height: AppConstants.eightyFour,
                      width: AppConstants.oneHundredTwentyTwo),
                ),
                CommonTextWidget(
                  text: StringUtils.login,
                  fontWeight: FontWeight.w700,
                  margintop: AppConstants.fortyFive,
                  fontSize: AppConstants.twenty,
                ),
                CommonTextWidget(
                  text: StringUtils.email,
                  margintop: AppConstants.thirtyFive,
                ),
                CommonTextField(
                    controller: AppUtils.tetEmail,
                    inputTypes: TextInputType.emailAddress,
                    marginTop: AppConstants.ten,
                    hint: StringUtils.emailHint,
                    iconWidget: const Icon(
                      Icons.email_outlined,
                      color: AppColor.colorWhite,
                    ),
                    fontSize: AppConstants.fourteen,
                    fontWeight: FontWeight.w500,
                    radius: AppConstants.eight),
                CommonTextWidget(
                    text: StringUtils.password,
                    margintop: AppConstants.eighteen),
                CommonTextField(
                    controller: AppUtils.tetPassword,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: onClickForgot,
                    child: CommonTextWidget(
                        textDecoration: TextDecoration.underline,
                        text: StringUtils.forgotPassword,
                        margintop: AppConstants.twenty),
                  ),
                ),
                CommonButtonWidget(
                    text: StringUtils.login,
                    onPressed: onClickLogin,
                    marginTop: AppConstants.twentyFour),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: AppConstants.thirtyFive),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppConstants.ninetySeven,
                        child: Divider(
                            color: AppColor.colorWhiteLight,
                            height: AppConstants.two,
                            thickness: AppConstants.two),
                      ),
                      CommonTextWidget(
                          left: AppConstants.ten,
                          right: AppConstants.ten,
                          text: StringUtils.connectWith.toCapitalize()),
                      SizedBox(
                        width: AppConstants.ninetySeven,
                        child: Divider(
                            color: AppColor.colorWhiteLight,
                            height: AppConstants.two,
                            thickness: AppConstants.two),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    commonButton(top: AppConstants.sixteen, path: icFacebook),
                    commonButton(
                        left: AppConstants.sixteen,
                        top: AppConstants.sixteen,
                        path: icGoogle),
                    commonButton(
                        left: AppConstants.sixteen,
                        top: AppConstants.sixteen,
                        path: icLinkedin),
                  ],
                ),
                Center(
                  child: AppUtils.richText(
                      top: AppConstants.thirty,
                      text: StringUtils.anAccount,
                      onTap: onClickSignUp,
                      linkText: StringUtils.signup),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonButton(
      {double? left,
      double? right,
      double? top,
      String? path,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: AppConstants.thirty),
        child: Container(
          margin: EdgeInsets.only(
              left: left ?? AppConstants.zero,
              right: right ?? AppConstants.zero,
              top: top ?? AppConstants.zero),
          decoration: AppUtils.containerDecoration(color: Colors.white),
          width: AppConstants.sixty,
          height: AppConstants.sixty,
          child: AppUtils.commonImageAssetWidget(
              path: path,
              width: AppConstants.twentyFour,
              height: AppConstants.twentyFour),
        ),
      ),
    );
  }

  void onClickLogin() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.dashboard);
  }

  void onClickForgot() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.verification);
  }

  void onClickSignUp() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.signup);
  }
}
