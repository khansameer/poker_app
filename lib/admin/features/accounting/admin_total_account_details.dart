import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class AdminTotalAccountDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdminTotalAccountDetailsState();
  }
}

class AdminTotalAccountDetailsState
    extends State<AdminTotalAccountDetailsPage> {
  List<ScheduleBean> scheduleList = [];
  late List<bool> _isChecked;
  @override
  void initState() {
    super.initState();
    loadView();
  }

  loadView() {
    scheduleList.add(ScheduleBean(
        text: "Tooth Hurty ",
        date: "THU, 1st October  | 2:30 pm",
        isShow: true,
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
        isShow: true,
        textItem: "Frames Poker ",
        textItem1: "2/5 plo ",
        textItem2: "2/5 hold em "));
    scheduleList.add(ScheduleBean(
        text: "Tooth Hurty ",
        date: "THU, 1st October  | 2:30 pm",
        isShow: true,
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
        isShow: true,
        textItem: "Frames Poker ",
        textItem1: "2/5 plo ",
        textItem2: "2/5 hold em "));
    scheduleList.add(ScheduleBean(
        text: "Tooth Hurty ",
        date: "THU, 1st October  | 2:30 pm",
        isShow: true,
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
        isShow: true,
        textItem: "Frames Poker ",
        textItem1: "2/5 plo ",
        textItem2: "2/5 hold em "));
    _isChecked = List<bool>.filled(scheduleList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: 'Total',
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      bottomSheet: Container(
        height: AppConstants.oneHundred,
        color: AppColor.colorBlueClub,
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
              left: AppConstants.thirty,
              right: AppConstants.thirty,
              top: AppConstants.twentyFour),
          height: AppConstants.oneHundred,
          alignment: Alignment.topCenter,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
                      left: AppConstants.five,
                      text: 'Complete',
                      padding: AppConstants.ten,
                    )),
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorDarkBlue
                .withOpacity(0.63) /*Color.fromRGBO(0, 27, 105, 0.63)*/,
            radius: AppConstants.zero),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topCenter,
          imagePath: icDashboardimg,
          widget: SingleChildScrollView(
            child: Container(
              margin: AppUtils.commonAllEdgeInsets(
                  left: AppConstants.fifteen,
                  right: AppConstants.fifteen,
                  bottom: AppConstants.oneHundredTen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  commonTopView(text: 'Game Name'),
                  SizedBox(
                    height: AppConstants.ten,
                  ),
                  commonListItem(),
                  commonListItem1(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget commonListItem({double? fontSize, double? left, double? right}) {
    return AppUtils.commonBg(
        padding1: AppUtils.commonAllEdgeInsets(
            left: AppConstants.zero,
            right: AppConstants.zero,
            bottom: AppConstants.zero,
            top: AppConstants.zero),
        radius: AppConstants.sixteen,
        borderWidth: AppConstants.two,
        padding: AppConstants.ten,
        left: left ?? 0,
        right: right ?? 0,
        color: AppColor.colorBlueClub,
        colorBorder: AppColor.colorWhiteLight,
        widget: Column(
          children: [
            SizedBox(
              height: AppConstants.ten,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget(
                  text: 'Ins',
                  fontWeight: FontWeight.w700,
                  fontSize: AppConstants.sixteen,
                ),
              ],
            ),
            SizedBox(
              height: AppConstants.ten,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow(text1: 'Source', text2: 'Total')),
                //commonDivider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow(
                        text1: 'Player name',
                        text2: '2,000',
                        colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow(
                        text1: 'Player name',
                        text2: '1,500',
                        colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow(
                        text1: 'Player name',
                        text2: '500',
                        colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow(
                        text1: 'Player name',
                        text2: '500',
                        colorText: Colors.white)),
              ],
            ),
            SizedBox(
              height: AppConstants.twenty,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow(
                        text1: 'Total',
                        text2: '4,500',
                        colorText: Colors.white)),
              ],
            ),
          ],
        ));
  }

  Widget commonListItem1({double? fontSize, double? left, double? right}) {
    return AppUtils.commonBg(
        padding1: AppUtils.commonAllEdgeInsets(
            left: AppConstants.zero,
            right: AppConstants.zero,
            bottom: AppConstants.zero,
            top: AppConstants.zero),
        radius: AppConstants.sixteen,
        borderWidth: AppConstants.two,
        padding: AppConstants.ten,
        left: left ?? 0,
        right: right ?? 0,
        color: AppColor.colorBlueClub,
        colorBorder: AppColor.colorWhiteLight,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: AppConstants.ten,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget(
                  text: 'Out',
                  fontWeight: FontWeight.w700,
                  fontSize: AppConstants.sixteen,
                ),
              ],
            ),
            SizedBox(
              height: AppConstants.ten,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                    flex: 5,
                    child: commonRow(
                        text1: 'Source', text2: 'Total', text3: 'Total')),
                //commonDivider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow1(
                        text1: 'Shopping',
                        text2: '4:30 pm',
                        text3: "2,000",
                        colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow1(
                        text1: 'Rent',
                        text2: '4:10 pm',
                        text3: "1,500",
                        colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow1(
                        text1: 'Player name',
                        text2: '4:00 pm',
                        text3: "500",
                        colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow1(
                        text1: 'Player name',
                        text2: "4:00 pm",
                        text3: '500',
                        colorText: Colors.white)),
              ],
            ),
            SizedBox(
              height: AppConstants.twenty,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,
                    child: commonRow(
                        text1: 'Total',
                        text2: '4,500',
                        colorText: Colors.white)),
              ],
            ),
          ],
        ));
  }

  Widget commonTopView(
      {String? text, String? desc, double? left, double? right}) {
    return AppUtils.commonBg(
        top: AppConstants.twentyFour,
        radius: AppConstants.sixteen,
        left: left ?? 0,
        borderWidth: AppConstants.two,
        right: right ?? 0,
        width: MediaQuery.of(context).size.width,
        color: AppColor.colorBlueClub,
        padding: AppConstants.ten,
        colorBorder: AppColor.colorWhiteLight,
        // padding1: ,
        widget: Container(
          padding: AppUtils.commonAllEdgeInsets(
              left: AppConstants.five, right: AppConstants.five),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonTextWidget(
                      text: text ?? "5000",
                      fontWeight: FontWeight.w800,
                      fontSize: AppConstants.sixteen,
                    ),
                    CommonTextWidget(
                      text: "20 Sep,2022",
                      fontSize: AppConstants.sixteen,
                    ),
                  ]),
              //CommonTextWidget(text: text??"5000",fontWeight: FontWeight.w800,fontSize:16 ,),
              AppUtils.commonSizedBox(height: AppConstants.eight),

              ListTile(
                dense: true,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                contentPadding: EdgeInsets.zero,
                leading: AppUtils.commonImageSVGWidget(path: icMan),
                title: CommonTextWidget(
                  text: 'John Doe',
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.fourteen,
                ),
              ),
            ],
          ),
        ));
  }

  Widget commonList({String? text, Color? colorText, f}) {
    return CommonTextWidget(
      text: text,
      textColor: colorText ?? AppColor.colorWhite,
      left: AppConstants.two,
      fontSize: AppConstants.fourteen,
    );
  }

  Widget commonRow(
      {String? text1, String? text2, String? text3, Color? colorText}) {
    return AppUtils.commonBg(
      left: AppConstants.zero,
      right: AppConstants.zero,
      padding: AppConstants.twelve,
      color: AppColor.colorUnderList,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          commonList(text: text1, colorText: colorText ?? AppColor.colorWhite1),
          commonList(text: text2, colorText: colorText ?? AppColor.colorWhite1),
          //commonList(text: text3,colorText:colorText?? AppColor.colorWhite1),
        ],
      ),
    );
  }

  Widget commonRow1(
      {String? text1, String? text2, String? text3, Color? colorText}) {
    return AppUtils.commonBg(
      left: AppConstants.zero,
      right: AppConstants.zero,
      padding: AppConstants.twelve,
      color: AppColor.colorUnderList,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonList(text: text1, colorText: colorText ?? AppColor.colorWhite1),
          commonList(text: text2, colorText: colorText ?? AppColor.colorWhite1),
          commonList(text: text3, colorText: colorText ?? AppColor.colorWhite1),
        ],
      ),
    );
  }
}
