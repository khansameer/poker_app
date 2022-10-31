import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class AdminCreditFilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminCreditFileState();
  }
}

class AdminCreditFileState extends State<AdminCreditFilePage> {
  List<ScheduleBean> scheduleList = [];
  @override
  void initState() {
    super.initState();
    loadView();
  }

  loadView() {
    scheduleList.add(ScheduleBean(
      text: "Player Name",
    ));
    scheduleList.add(ScheduleBean(
      text: "Player Name",
    ));
    scheduleList.add(ScheduleBean(
      text: "Player Name",
    ));
    scheduleList.add(ScheduleBean(
      text: "Player Name",
    ));
    scheduleList.add(ScheduleBean(
      text: "Player Name",
    ));
    scheduleList.add(ScheduleBean(
      text: "Player Name",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.creditFile,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      body: Container(
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorDarkBlue, radius: AppConstants.zero),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topCenter,
          imagePath: icDashboardimg,
          widget: SingleChildScrollView(
            child: Container(
              margin: AppUtils.commonAllEdgeInsets(
                  left: AppConstants.twenty,
                  right: AppConstants.twenty,
                  bottom: AppConstants.oneHundredTen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppConstants.ten,
                  ),
                  CommonTextField(
                    hint: 'Search player by name',
                    radius: AppConstants.twelve,
                    fontSize: AppConstants.fourteen,
                    marginTop: AppConstants.ten,
                    colorFill: AppColor.colorWhite.withOpacity(0.3),
                    iconWidget: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.twenty,
                  ),
                  bindListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bindListView() {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: scheduleList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              AppUtils.redirectToNextScreen(
                  context: context,
                  screenName: RouteName.clubBalance,
                  arguments: true);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonListItem(index: index),
              ],
            ),
          );
        });
  }

  Widget commonListItem(
      {required int index, double? fontSize, double? left, double? right}) {
    return AppUtils.commonBg(
        padding1: AppUtils.commonAllEdgeInsets(
            left: AppConstants.zero,
            right: AppConstants.zero,
            bottom: AppConstants.zero,
            top: AppConstants.zero),
        radius: AppConstants.sixteen,
        borderWidth: AppConstants.two,
        padding: AppConstants.fifteen,
        left: left ?? AppConstants.zero,
        right: right ?? AppConstants.zero,
        color: AppColor.colorBlueClub,
        colorBorder: AppColor.colorWhiteLight,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: AppConstants.forty,
                  height: AppConstants.forty,
                  child: AppUtils.commonImageAssetWidget(path: icGirlsIcon),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget(
                      text: "Player name",
                      textColor: AppColor.colorWhite.withOpacity(1),
                      left: AppConstants.ten,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w800,
                    ),
                    CommonTextWidget(
                      margintop: AppConstants.four,
                      text: "ID 00756",
                      textColor: AppColor.colorWhite.withOpacity(0.7),
                      left: AppConstants.ten,
                      fontSize: AppConstants.twelve,
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
