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
import 'package:poker/core/utils/login_with_google.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/core/utils/validation.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  bool obscureConfirmText = true;
  @override
  void initState() {
    super.initState();
    if(name != null && email != null ){
      AppUtils.tetFirstName.text=name.toString();
      AppUtils.tetEmail.text=email.toString();
    }
  }
  @override
  void dispose() {
    super.dispose();
    AppUtils.tetFirstName.clear();
    AppUtils.tetEmail.clear();
    name =null;
    email =null;

  }

  @override
  Widget build(BuildContext context) {
    return CommonBgPage(
      isLogin: true,
      alignment: Alignment.topLeft,
      imagePath: icBackground,
      widget: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: AppUtils.commonAllEdgeInsets(
                    left: AppConstants.twenty, right: AppConstants.twenty),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppConstants.fifty,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          AppUtils.onBack(context);
                        },
                        icon: Icon(Icons.arrow_back_ios,
                            size: AppConstants.twentyFour,
                            color: AppColor.colorWhite),
                      ),
                    ),
                    CommonTextWidget(
                      text: StringUtils.signup,
                      fontWeight: FontWeight.w700,
                      margintop: AppConstants.fifty,
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
                    CommonTextWidget(
                      text: StringUtils.confirmPassword,
                      margintop: AppConstants.sixteen,
                    ),
                    CommonTextField(
                        controller: AppUtils.tetConfirmPassword,
                        obscureText: obscureConfirmText,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              obscureConfirmText = !obscureConfirmText;
                            });
                          },
                          child: !obscureConfirmText
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
                        hint: StringUtils.confirmPassword,
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
                        onPressed: onClickSingUp,
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
              )
            ],
          ),
        ),
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

  void onClickSingUp() {
    if (Validation.isEmptyString(AppUtils.tetFirstName.text)) {
      AppUtils.showMessage(
          context: context, message: StringUtils.emptyFirstName);
    } else if (Validation.isEmptyString(AppUtils.tetLastName.text)) {
      AppUtils.showMessage(
          context: context, message: StringUtils.emptyLastName);
    } else if (Validation.isEmptyString(AppUtils.tetEmail.text)) {
      AppUtils.showMessage(context: context, message: StringUtils.emptyEmail);
    } else if (!Validation.validateEmail(AppUtils.tetEmail.text)) {
      AppUtils.showMessage(context: context, message: StringUtils.validEmail);
    } else if (Validation.isEmptyString(AppUtils.tetPassword.text)) {
      AppUtils.showMessage(
          context: context, message: StringUtils.emptyPassword);
    } else if (AppUtils.tetPassword.text
        .toString()
        .length < 4) {
      AppUtils.showMessage(
          context: context, message: StringUtils.validPassword);
    } else if (Validation.isEmptyString(AppUtils.tetConfirmPassword.text)) {
      AppUtils.showMessage(
          context: context, message: StringUtils.emptyConfirmPassword);
    } else if (AppUtils.tetConfirmPassword.text
        .toString()
        .length < 4) {
      AppUtils.showMessage(
          context: context, message: StringUtils.validPassword);
    } else if (AppUtils.tetPassword.text.toString() !=
        AppUtils.tetConfirmPassword.text.toString()) {
      AppUtils.showMessage(
          context: context, message: StringUtils.passwordNotMatch);
    } else {
      AppUtils.tetFirstName.clear();
      AppUtils.tetLastName.clear();
      AppUtils.tetEmail.clear();
      AppUtils.tetPassword.clear();
      AppUtils.tetConfirmPassword.clear();
      //AppUtils.tetFirstName.clear();
      Navigator.of(context).pushNamed(RouteName.verification);
    }
  }
}
