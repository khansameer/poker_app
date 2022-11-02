import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class TradeHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TradeHistoryState();
  }
}

class TradeHistoryState extends State<TradeHistoryPage> {
  List<ScheduleBean> scheduleList = [];
  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    loadView();
  }

  loadView() {
    scheduleList.add(ScheduleBean(
      text: "-500",
    ));
    scheduleList.add(ScheduleBean(
      text: "-500",
    ));
    scheduleList.add(ScheduleBean(
      text: "+500",
    ));
    scheduleList.add(ScheduleBean(
      text: "-500",
    ));
    scheduleList.add(ScheduleBean(
      text: "-500",
    ));
    scheduleList.add(ScheduleBean(
      text: "+500",
    ));

    _isChecked = List<bool>.filled(scheduleList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: 'Trade History',
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
                  left: AppConstants.fifteen,
                  right: AppConstants.fifteen,
                  bottom: AppConstants.oneHundredTen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextField(
                    hint: 'Search player by name',
                    radius: AppConstants.twelve,
                    fontSize: AppConstants.fourteen,
                    marginTop: AppConstants.twentyFour,
                    colorFill: AppColor.colorWhite.withOpacity(0.3),
                    iconWidget: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.twentyFour,
                  ),
                  SizedBox(
                    height: AppConstants.ten,
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
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonListItem(index: index, fontSize: AppConstants.eleven),
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
        padding: AppConstants.ten,
        left: left ?? 0,
        right: right ?? 0,
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
                      textColor: AppColor.colorWhite.withOpacity(0.7),
                      left: AppConstants.ten,
                      fontSize: AppConstants.twelve,
                    ),
                    CommonTextWidget(
                      margintop: AppConstants.four,
                      text: "ID 00756",
                      textColor: AppColor.colorWhite.withOpacity(0.7),
                      left: AppConstants.ten,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppUtils.commonBg(
                            top: AppConstants.zero,
                            left: AppConstants.zero,
                            right: AppConstants.zero,
                            radius: AppConstants.oneHundred,
                            color: AppColor.colorFillEditText,
                            colorBorder: AppColor.colorWhite.withOpacity(0.7),
                            bottom: AppConstants.zero,
                            widget: CommonTextWidget(
                              text: "Credit Out",
                              textColor: AppColor.colorWhite.withOpacity(0.7),
                              left: AppConstants.five,
                              fontSize: fontSize,
                            )),
                        //CommonTextWidget(margintop:4,text: "20 Sept, 2022",textColor: AppColor.colorWhite.withOpacity(0.7),left: 5,fontSize: fontSize,fontWeight: FontWeight.w400,),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget(
                      text: scheduleList[index].text,
                      textColor: AppColor.colorWhite.withOpacity(0.7),
                      left: AppConstants.five,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w800,
                    ),
                    CommonTextWidget(
                      margintop: AppConstants.four,
                      text: "20 Sept, 2022",
                      textColor: AppColor.colorWhite.withOpacity(0.7),
                      left: AppConstants.five,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }

  Widget commonTopView(
      {String? price,
      String? desc,
      double? left,
      double? right,
      Color? textColor}) {
    return AppUtils.commonBg(
        top: AppConstants.twentyFour,
        radius: AppConstants.sixteen,
        left: left ?? 0,
        borderWidth: AppConstants.two,
        right: right ?? 0,
        height: AppConstants.seventy,
        color: AppColor.colorBlueClub,
        padding: AppConstants.zero,
        colorBorder: AppColor.colorWhiteLight,
        // padding1: ,
        widget: Container(
          padding: AppUtils.commonAllEdgeInsets(
              left: AppConstants.five, right: AppConstants.five),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextWidget(
                text: price ?? "5000",
                fontWeight: FontWeight.w800,
                fontSize: AppConstants.thirteen,
                textColor: textColor,
              ),
              CommonTextWidget(
                margintop: AppConstants.four,
                text: desc ?? "Your Chips",
                fontSize: AppConstants.ten,
                textAlign: TextAlign.center,
                textColor: textColor ?? AppColor.colorWhite.withOpacity(0.7),
              )
            ],
          ),
        ));
  }

  Widget commonListItem1(
      {required int index, double? fontSize, double? left, double? right}) {
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
                      textColor: AppColor.colorWhite.withOpacity(0.7),
                      left: AppConstants.ten,
                      fontSize: fontSize,
                    ),
                    CommonTextWidget(
                      margintop: AppConstants.four,
                      text: "ID 00756",
                      textColor: AppColor.colorWhite.withOpacity(0.7),
                      left: AppConstants.ten,
                      fontSize: fontSize,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      VerticalDivider(
                        color: AppColor.colorWhiteLight,
                        thickness: 2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextWidget(
                            text: "Available",
                            textColor: AppColor.colorWhite.withOpacity(0.7),
                            left: AppConstants.ten,
                            fontSize: fontSize,
                          ),
                          CommonTextWidget(
                            margintop: AppConstants.four,
                            text: "500",
                            textColor: AppColor.colorWhite.withOpacity(0.7),
                            left: AppConstants.ten,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    autofocus: false,
                    splashRadius: AppConstants.zero,
                    activeColor: AppColor.colorButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.five),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => BorderSide(
                          width: AppConstants.two,
                          color: AppColor.colorWhiteLight),
                    ),
                    checkColor: Colors.white,
                    value: _isChecked[index],
                    onChanged: (val) {
                      setState(() {
                        _isChecked[index] = val!;
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ));
  }
}
