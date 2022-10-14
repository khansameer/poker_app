import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/custom_profile_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  text: 'John Doe',
                  fontWeight: FontWeight.w700,
                ),
                CommonTextWidget(
                  margintop: AppConstants.ten,
                  fontSize: AppConstants.sixteen,
                  text: 'johndoe@mail.com',
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
                    text: StringUtils.changePassword,
                    fontSize: AppConstants.sixteen,
                    imagePath: icKey),
                AppUtils.commonDivider(
                    indent: AppConstants.zero,
                    endIndent: AppConstants.zero,
                    top: AppConstants.thirtyFive),
                AppUtils.commonMenuItem(
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
}
