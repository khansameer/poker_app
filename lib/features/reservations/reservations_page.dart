import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

import 'package:poker/features/whaton/schedulebean.dart';

class ReservationsPage extends StatefulWidget{
  const ReservationsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ReservationsPageState();
  }
  
}
class ReservationsPageState  extends State<ReservationsPage> {
  List<ScheduleBean> scheduleList = [];

  @override
  void initState() {
    super.initState();
    loadView();
  }

  loadView() {
    scheduleList.add(ScheduleBean(
        text: "Tooth Hurty ",
        date: "THU, 1st October  | 2:30 pm",
        isShow: false,
        textItem: "Chinese Dentist",
        textItem1: "2/5 LOL ",
        textItem2: ""));
    scheduleList.add(ScheduleBean(
        text: "Event Name",
        date: "Wed, 21st September  | 8 pm",
        isShow: false,
        textItem: "Frames Poker ",
        textItem1: "2/5 plo ",
        textItem2: "2/5 hold em "));
    scheduleList.add(ScheduleBean(
        text: "Event Name",
        date: "Wed, 21st September  | 8 pm",
        isShow: false,
        textItem: "Frames Poker ",
        textItem1: "2/5 plo ",
        textItem2: "2/5 hold em "));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.reservations,
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
          widget: bindListView(),
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
              // AppUtils.redirectToNextScreen(context: context,screenName: RouteName.eventDetails);
            },
            child: Container(
              height: AppConstants.twoHundredSeventyEight,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(icSchedule),
                  )),
              margin: EdgeInsets.only(
                  left: AppConstants.sixteen,
                  right: AppConstants.sixteen,
                  top: AppConstants.twenty),
              padding: EdgeInsets.only(
                  left: AppConstants.twentyFour,
                  right: AppConstants.zero,
                  top: AppConstants.zero,
                  bottom: AppConstants.zero),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextWidget(
                    text: scheduleList[index].text,
                    fontWeight: FontWeight.w700,
                    fontSize: AppConstants.sixteen,
                  ),
                  CommonTextWidget(
                    margintop: AppConstants.five,
                    text: scheduleList[index].date,
                    fontWeight: FontWeight.w400,
                    fontSize: AppConstants.fourteen,
                  ),
                  SizedBox(
                    height: AppConstants.sixteen,
                  ),
                  AppUtils.commonDivider(
                      color: AppColor.colorWhiteLight,
                      indent: AppConstants.zero,
                      endIndent: AppConstants.oneHundredSeventyEight),
                  SizedBox(
                    height: AppConstants.ten,
                  ),
                  commonView(title: scheduleList[index].textItem, icon: icHome),
                  commonView(
                      title: scheduleList[index].textItem1, icon: icCasino),
                  scheduleList[index].textItem2!.isEmpty
                      ? const SizedBox.shrink()
                      : commonView(title: scheduleList[index].textItem2),
                  commonDeleteView(),

                ],
              ),
            ),
          );
        });
  }

  Widget commonView({String? title, String? icon}) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(horizontal: AppConstants.zero, vertical: -4),
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: AppConstants.zero,
      horizontalTitleGap: AppConstants.zero,
      title: CommonTextWidget(
        text: title,
        fontSize: AppConstants.fourteen,
        fontWeight: FontWeight.w600,
      ),
      leading: AppUtils.commonImageSVGWidget(path: icon ?? icCasino),
    );
  }

  Widget commonDeleteView() {
    return Container(
      margin: EdgeInsets.only(top: AppConstants.fourteen),
      child: Column(
        children: [
          AppUtils.commonDivider(
              indent: AppConstants.zero, color: AppColor.colorWhiteLight),
          SizedBox(
            height: AppConstants.ten,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppUtils.commonImageSVGWidget(
                      path: icDoneCircle, iconColor: AppColor.colorGreen),
                  CommonTextWidget(
                      textColor: AppColor.colorGreen,
                      left: AppConstants.ten,
                      text: StringUtils.reserved,
                      fontSize: AppConstants.fourteen,
                      fontWeight: FontWeight.w500),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      AppUtils.commonImageSVGWidget(path: icEdit),
                      CommonTextWidget(
                          textColor: AppColor.colorEdit,
                          left: AppConstants.ten,
                          text: StringUtils.edit,
                          fontSize: AppConstants.fourteen,
                          fontWeight: FontWeight.w600,
                          textDecoration: TextDecoration.underline),
                      SizedBox(
                        width: AppConstants.twenty,
                      ),
                      AppUtils.commonImageSVGWidget(path: icDelete),
                      CommonTextWidget(
                          textColor: AppColor.colorLogout,
                          left: AppConstants.ten,
                          text: StringUtils.edit,
                          fontSize: AppConstants.fourteen,
                          fontWeight: FontWeight.w600,
                          textDecoration: TextDecoration.underline),
                      SizedBox(
                        width: AppConstants.twenty,
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}