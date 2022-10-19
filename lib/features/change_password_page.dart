import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/common/custom_profile_widget.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
class ChangePasswordPage extends StatefulWidget{
  const ChangePasswordPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangePasswordPageState();
  }
  
}
class ChangePasswordPageState extends State<ChangePasswordPage>{
  @override
  Widget build(BuildContext context) {
    return CommonBgPage(
      backImagePath: icDashboardBg,
      margin: AppConstants.zero,
      alignment: Alignment.topCenter,
      imagePath: icDashboardimg,
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppUtils.commonAppBar(
            context: context,
            title: StringUtils.changePassword.toCapitalize(),

            isShowEdit: false,
            actionTitle: StringUtils.edit),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: AppConstants.sixteen,right: AppConstants.sixteen),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppConstants.thirty,
                  ),

                  CommonTextWidget(
                    text: StringUtils.currentPassword,
                    margintop: AppConstants.thirtyFive,
                  ),
                  CommonTextField(
                      obscureText: true,
                      inputTypes: TextInputType.visiblePassword,
                      marginTop: AppConstants.ten,
                      controller: AppUtils.tetPassword,
                      hint: "",
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
                  CommonTextWidget(
                    text: StringUtils.newPassword,
                    margintop: AppConstants.sixteen,
                  ),
                  CommonTextField(
                      obscureText: true,
                      inputTypes: TextInputType.visiblePassword,
                      marginTop: AppConstants.ten,
                      controller: AppUtils.tetNewPassword,
                      hint: "",
                      fontSize: AppConstants.fourteen,
                      fontWeight: FontWeight.w500,
                      radius: AppConstants.eight),
                  CommonTextWidget(
                    text: StringUtils.reEnterPassword,
                    margintop: AppConstants.sixteen,
                  ),
                  CommonTextField(
                      obscureText: true,
                      controller: AppUtils.tetReInterPassword,
                      inputTypes: TextInputType.visiblePassword,
                      marginTop: AppConstants.ten,
                      hint: "",
                      fontSize: AppConstants.fourteen,
                      fontWeight: FontWeight.w500,
                      radius: AppConstants.eight),

                  CommonButtonWidget(
                      onPressed: () {
                        AppUtils.onBack(context);
                      },
                      colorButton: AppColor.colorButton,
                      text: StringUtils.changePassword.toCapitalize(),
                      marginTop: AppConstants.fortyFive),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void onClickForgot() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.verification);
  }
}