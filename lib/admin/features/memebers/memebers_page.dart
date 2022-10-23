import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppUtils.commonAppBar(
            context: context,
            fontSize: AppConstants.sixteen,
            title: StringUtils.newMemberDetails,
            isShowEdit: false,
            actionTitle: StringUtils.edit),
        body: Container(
          decoration: AppUtils.containerDecoration(
              color: AppColor.colorDarkBlue, radius: 0),
          child: CommonBgPage(
            backImagePath: icDashboardBg,
            margin: AppConstants.fifteen,
            alignment: Alignment.topCenter,
            imagePath: icDashboardimg,
            widget: membersList(),
          ),
        ),
      ),
    );
  }

  Widget membersList() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppUtils.commonBg(
          left: AppConstants.zero,
          radius: AppConstants.sixteen,
          colorBorder: AppColor.colorBorder,
          borderWidth: 2,
          widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                commonRow('Total Credit', '-65,541'),
                AppUtils.commonSizedBox(height: AppConstants.ten),
                commonRow('Total Debt', '6,541'),
                AppUtils.commonSizedBox(height: AppConstants.ten),
                commonRow('Total Owed', '-58,781'),
              ]),
        ),
//////////////////////////////////////////////////
        AppUtils.commonBg(
          left: AppConstants.zero,
          radius: AppConstants.sixteen,
          colorBorder: AppColor.colorBorder,
          borderWidth: 2,
          widget: Column(mainAxisSize: MainAxisSize.min, children: [
            commonRow('Host 1', '9,752'),
            AppUtils.commonSizedBox(height: AppConstants.ten),
            commonRow('Host 2', '3,390'),
          ]),
        ),
      ],
    );
  }

  Widget commonRow(String title1, String title2) {
    return Container(
      decoration: AppUtils.containerDecoration(
          radius: AppConstants.eight,
          color: AppColor.colorWhiteLight,
          borderWidth: AppConstants.zero),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            CommonTextWidget(
              text: title1,
              fontSize: 11,
            ),
            AppUtils.commonSizedBox(width: AppConstants.thirty),
            CommonTextWidget(
              text: title2,
              fontSize: 11,
            )
          ],
        ),
      ),
    );
  }
}
