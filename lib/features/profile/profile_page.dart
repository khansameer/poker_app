import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/custom_profile_widget.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/AppConstants.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/login_with_google.dart';
import 'package:poker/core/utils/string_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {

    String? name, email;

    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {

  String? name = userInfo!.name.toString();
  String? email =userInfo!.email.toString();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.profile,
          isShowEdit: true,
          actionTitle: StringUtils.edit),
      body: Container(
        decoration:
            AppUtils.containerDecoration(color: AppColor.colorBlue, radius: 0),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topCenter,
          imagePath: icDashboardimg,
          widget: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstants.thirty,
                ),
                ClipRRect(
                  child: SizedBox(
                    height: AppConstants.oneHundredTwentyTwo,
                    width: AppConstants.oneHundredTwentyTwo,
                    child: CustomProfileWidget(
                        isEdit: false,
                        widht: AppConstants.oneHundred,
                        height: AppConstants.oneHundred,
                        onClicked: () {}),
                  ),
                ),
                CommonTextWidget(
                  margintop: AppConstants.twenty,
                  fontSize: AppConstants.twenty,
                  text:name,
                  fontWeight: FontWeight.w700,
                ),
                CommonTextWidget(
                  margintop: AppConstants.ten,
                  fontSize: AppConstants.sixteen,
                  text: email,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: AppConstants.thirty,
                ),
                AppUtils.commonDivider(
                    indent: AppConstants.zero,
                    endIndent: AppConstants.zero,
                    top: AppConstants.thirtyFive),
                AppUtils.commonMenuItem(
                  boxFit: BoxFit.scaleDown,

                      onTap: onClickChangePassword,
                    text: StringUtils.changePassword,
                    fontSize: AppConstants.sixteen,
                    imagePath: icKey),
                AppUtils.commonDivider(

                    indent: AppConstants.zero,
                    endIndent: AppConstants.zero,
                    top: AppConstants.twentyFour),
                AppUtils.commonMenuItem(
                  onTap: onClickLogout,
                    text: StringUtils.logout,
                    textColor: AppColor.colorLogout,
                    imagePath: icLogout,
                    fontSize: AppConstants.sixteen)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onClickChangePassword(){
    AppUtils.redirectToNextScreen(context: context,screenName: RouteName.changePassword);
  }
  void onClickLogout(){
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteName.login, (route) => false);
  }

}
