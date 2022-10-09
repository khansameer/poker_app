import 'package:flutter/material.dart';
import 'package:poker/common/common_bg_page.dart';
import 'package:poker/common/common_button_widget.dart';
import 'package:poker/common/common_text_widget.dart';
import 'package:poker/common/common_textfield.dart';
import 'package:poker/common/context_extension.dart';
import 'package:poker/core/route.dart';
import 'package:poker/utils/app_color.dart';
import 'package:poker/utils/app_constants.dart';
import 'package:poker/utils/app_utils.dart';
import 'package:poker/utils/image_path.dart';
import 'package:poker/utils/string_utils.dart';

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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CommonBgPage(
              imagePath: icBackground,
              widget: SingleChildScrollView(
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: AppConstants.thirtyFive,),
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
                      margintop: AppConstants.sixteen,
                    ),
                    CommonTextField(
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
                        text: StringUtils.password, margintop: AppConstants.eighteen),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: CommonTextWidget(
                          text: StringUtils.forgotPassword,
                          margintop: AppConstants.sixteen),
                    ),
                    CommonButtonWidget(
                        text: StringUtils.login,
                        marginTop: AppConstants.twenty),
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
                        commonButton(
                            top: AppConstants.sixteen, path: icFacebook),
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
                      child: AppUtils.richText(top: AppConstants.thirty,
                      text:StringUtils.anAccount,
                      onTap: (){
                        Navigator.of(context).pushNamed(RouteName.signup);
                      },
                      linkText: StringUtils.signup),
                    ),

                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget commonButton(
      {double? left, double? right, double? top, String? path}) {
    return Container(
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
    );
  }
}
