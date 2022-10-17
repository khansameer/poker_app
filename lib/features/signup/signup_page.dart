import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: CommonBgPage(
            alignment: Alignment.topLeft,
            imagePath: icBackground,
            widget: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: AppConstants.sixty,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: AppConstants.twentyFour,
                      color: AppColor.colorWhite,
                    ),
                  ),
                  CommonTextWidget(
                    text: StringUtils.signup,
                    fontWeight: FontWeight.w700,
                    margintop: AppConstants.sixty,
                    fontSize: AppConstants.twenty,
                  ),
                  CommonTextWidget(
                    text: StringUtils.firstName,
                    margintop: AppConstants.thirtyFive,
                  ),
                  CommonTextField(
                      controller: AppUtils.tetFirstName,

                      inputTypes: TextInputType.name,
                      marginTop: AppConstants.ten,
                      hint: StringUtils.your + StringUtils.firstName,
                      fontSize: AppConstants.fourteen,
                      fontWeight: FontWeight.w500,
                      radius: AppConstants.eight),
                  CommonTextWidget(
                    text: StringUtils.lastName,
                    margintop: AppConstants.sixteen,
                  ),
                  CommonTextField(
                      marginTop: AppConstants.ten,
                      controller: AppUtils.tetLastName,
                      inputTypes: TextInputType.name,
                      hint: StringUtils.your + StringUtils.lastName,
                      fontSize: AppConstants.fourteen,
                      fontWeight: FontWeight.w500,
                      radius: AppConstants.eight),
                  CommonTextWidget(
                    text: StringUtils.email,
                    margintop: AppConstants.sixteen,
                  ),
                  CommonTextField(
                      controller: AppUtils.tetEmail,
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
                    margintop: AppConstants.sixteen,
                  ),
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
                  AppUtils.privacyPolicyLinkAndTermsOfService(
                      onTapTermsCondition: onClickTermCondition,
                      onTapPrivacyPolicy: onClickPolicy),
                  CommonButtonWidget(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteName.verification);
                      },
                      text: StringUtils.signup,
                      marginTop: AppConstants.fortyFive),
                  Center(
                    child: AppUtils.richText(
                        top: AppConstants.thirty,
                        text: StringUtils.alreadySignup,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        linkText: StringUtils.login),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void onClickTermCondition() {
    AppUtils.redirectToNextScreen(
        context: context,
        screenName: RouteName.termCondition,
        arguments: StringUtils.termsCondition);
  }

  void onClickPolicy() {
    AppUtils.redirectToNextScreen(
        context: context,
        screenName: RouteName.termCondition,
        arguments: StringUtils.privacyPolicy);
  }
}
