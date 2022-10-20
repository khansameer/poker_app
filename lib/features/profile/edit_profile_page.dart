import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/custom_profile_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/core/utils/validation.dart';
class EditProfilePage extends StatefulWidget{
  const EditProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditProfilePageState();
  }
  
}
class EditProfilePageState extends State<EditProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.profile,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      body: Container(

        decoration:
        AppUtils.containerDecoration(color: AppColor.colorDarkBlue, radius: 0),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topCenter,
          imagePath: icDashboardimg,
          widget: Container(
            margin: EdgeInsets.only(left: AppConstants.sixteen,right: AppConstants.sixteen),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppConstants.thirty,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      child: SizedBox(
                        height: AppConstants.oneHundredTwentyTwo,
                        width: AppConstants.oneHundredTwentyTwo,
                        child: CustomProfileWidget(
                            isEdit: true,
                            widht: AppConstants.oneHundred,
                            height: AppConstants.oneHundred,
                            onClicked: () {}),
                      ),
                    ),
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
                      marginTop: AppConstants.ten,
                      inputTypes: TextInputType.emailAddress,
                      controller: AppUtils.tetEmail,
                      hint: StringUtils.your + StringUtils.email,
                      fontSize: AppConstants.fourteen,
                      fontWeight: FontWeight.w500,
                      radius: AppConstants.eight),

                  CommonButtonWidget(
                      onPressed: onEditClickBtn,
                      colorButton: AppColor.colorButton,
                      text: StringUtils.update,
                      marginTop: AppConstants.fortyFive),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onEditClickBtn(){
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
    }
    else
      {
        AppUtils.tetFirstName.clear();
        AppUtils.tetLastName.clear();
        AppUtils.tetEmail.clear();

        AppUtils.onBack(context);
      }
  }
}