import 'package:flutter/material.dart';
import 'package:poker/core/common/RatingDialog.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class CreditRequestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreditRequestPageState();
  }
}

class CreditRequestPageState extends State<CreditRequestPage> {
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
    _isChecked = List<bool>.filled(scheduleList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: 'Credit Requests',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                    width: AppConstants.twoHundredThirty,
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
                      colorButton: AppColor.colorFillEditText,
                      colorBorder: AppColor.colorWhite.withOpacity(0.7),
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            barrierColor: AppColor.colorWhiteLight,
                            context: context,
                            builder: (_) => CommonDialog(
                                  isShowButtonView: false,
                                  headerTitle: "Credit Out",
                                  widget: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CommonTextWidget(
                                          text: '5000',
                                          left: AppConstants.fifteen,
                                          fontSize: AppConstants.eighteen,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        CommonTextWidget(
                                          textColor: AppColor.colorWhite
                                              .withOpacity(0.7),
                                          fontSize: AppConstants.fourteen,
                                          margintop: AppConstants.eight,
                                          left: AppConstants.fifteen,
                                          text:
                                              'Total Chips available to send out',
                                        ),
                                        AppUtils.commonSizedBox(
                                            height: AppConstants.twenty),
                                        AppUtils.commonDivider(),
                                        CommonTextField(
                                            left: AppConstants.fifteen,
                                            rigth: AppConstants.fifteen,
                                            marginTop: AppConstants.twenty,
                                            inputTypes: TextInputType.number,
                                            hint: 'Enter the amount',
                                            suffixIcon: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonTextWidget(
                                                  text: "\$",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            fontSize: AppConstants.fourteen,
                                            fontWeight: FontWeight.w500,
                                            radius: AppConstants.twelve),
                                        CommonTextWidget(
                                          text: "Sending to",
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppConstants.fourteen,
                                          margintop: AppConstants.fifteen,
                                          left: AppConstants.fifteen,
                                        ),
                                        commonListItem1(
                                            fontSize: AppConstants.twelve,
                                            index: 0,
                                            left: AppConstants.fifteen,
                                            right: AppConstants.fifteen),
                                        AppUtils.commonSizedBox(
                                          height: AppConstants.twenty,
                                        ),
                                        AppUtils.commonDivider(
                                            indent: AppConstants.zero,
                                            endIndent: AppConstants.zero),
                                        AppUtils.commonSizedBox(
                                            height: AppConstants.twenty),
                                        Container(
                                          margin: AppUtils.commonAllEdgeInsets(
                                              bottom: AppConstants.twenty),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CommonTextWidget(
                                                        text: "0",
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: AppConstants
                                                            .sixteen,
                                                        left: AppConstants
                                                            .fifteen,
                                                      ),
                                                      CommonTextWidget(
                                                        left: AppConstants
                                                            .fifteen,
                                                        margintop:
                                                            AppConstants.five,
                                                        text:
                                                            "Total Credit out",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: AppConstants
                                                            .fifteen,
                                                        textColor: AppColor
                                                            .colorWhite
                                                            .withOpacity(0.7),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CommonButtonWidget(
                                                    text: 'Confirm',
                                                    paddingOnly:
                                                        EdgeInsets.only(
                                                            left: AppConstants
                                                                .forty,
                                                            right: AppConstants
                                                                .forty),
                                                    right: AppConstants.fifteen,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      text: 'Reject all',
                      padding: AppConstants.ten,
                    )),
              ),
              Expanded(
                child: SizedBox(
                    width: AppConstants.twoHundredThirty,
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
                      left: AppConstants.fifteen,
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            barrierColor: AppColor.colorWhiteLight,
                            context: context,
                            builder: (_) => CommonDialog(
                                  isShowButtonView: false,
                                  headerTitle: "Credit Out",
                                  widget: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CommonTextWidget(
                                          text: '5000',
                                          left: AppConstants.fifteen,
                                          fontSize: AppConstants.eighteen,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        CommonTextWidget(
                                          textColor: AppColor.colorWhite
                                              .withOpacity(0.7),
                                          fontSize: AppConstants.fourteen,
                                          margintop: AppConstants.eight,
                                          left: AppConstants.fifteen,
                                          text:
                                              'Total Chips available to send out',
                                        ),
                                        AppUtils.commonSizedBox(
                                            height: AppConstants.twenty),
                                        AppUtils.commonDivider(),
                                        CommonTextField(
                                            left: AppConstants.fifteen,
                                            rigth: AppConstants.fifteen,
                                            marginTop: AppConstants.twenty,
                                            inputTypes: TextInputType.number,
                                            hint: 'Enter the amount',
                                            suffixIcon: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonTextWidget(
                                                  text: "\$",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            fontSize: AppConstants.fourteen,
                                            fontWeight: FontWeight.w500,
                                            radius: AppConstants.twelve),
                                        CommonTextWidget(
                                          text: "Sending to",
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppConstants.fourteen,
                                          margintop: AppConstants.fifteen,
                                          left: AppConstants.fifteen,
                                        ),
                                        commonListItem1(
                                            fontSize: AppConstants.twelve,
                                            index: 0,
                                            left: AppConstants.fifteen,
                                            right: AppConstants.fifteen),
                                        AppUtils.commonSizedBox(
                                          height: AppConstants.twenty,
                                        ),
                                        AppUtils.commonDivider(
                                            indent: AppConstants.zero,
                                            endIndent: AppConstants.zero),
                                        AppUtils.commonSizedBox(
                                            height: AppConstants.twenty),
                                        Container(
                                          margin: AppUtils.commonAllEdgeInsets(
                                              bottom: AppConstants.twenty),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CommonTextWidget(
                                                        text: "0",
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: AppConstants
                                                            .sixteen,
                                                        left: AppConstants
                                                            .fifteen,
                                                      ),
                                                      CommonTextWidget(
                                                        left: AppConstants
                                                            .fifteen,
                                                        margintop:
                                                            AppConstants.five,
                                                        text:
                                                            "Total Credit out",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: AppConstants
                                                            .fourteen,
                                                        textColor: AppColor
                                                            .colorWhite
                                                            .withOpacity(0.7),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CommonButtonWidget(
                                                    text: 'Confirm',
                                                    paddingOnly:
                                                        EdgeInsets.only(
                                                            left: AppConstants
                                                                .forty,
                                                            right: AppConstants
                                                                .forty),
                                                    right:
                                                        AppConstants.fourteen,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      text: 'Approve all',
                      padding: AppConstants.ten,
                    )),
              )
            ],
          ),
        ),
      ),
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
        radius: AppConstants.seventy,
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
                        CommonTextWidget(
                          text: "Available",
                          textColor: AppColor.colorWhite.withOpacity(0.7),
                          left: AppConstants.five,
                          fontSize: fontSize,
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
            ),
            Row(
              children: [
                AppUtils.commonInkWell(
                  onTap: () {
                    setState(() {
                      scheduleList.removeAt(index);
                    });
                  },
                  child: AppUtils.commonBg(
                      top: AppConstants.zero,
                      bottom: AppConstants.zero,
                      left: AppConstants.zero,
                      right: AppConstants.five,
                      radius: AppConstants.eight,
                      color: Colors.transparent,
                      width: AppConstants.thirty,
                      height: AppConstants.thirty,
                      padding: AppConstants.zero,
                      widget: Icon(
                        Icons.close,
                        size: AppConstants.eighteen,
                        color: Colors.white,
                      ),
                      colorBorder: AppColor.colorWhiteLight,
                      borderWidth: AppConstants.two),
                ),
                AppUtils.commonBg(
                  top: AppConstants.zero,
                  bottom: AppConstants.zero,
                  left: AppConstants.zero,
                  right: AppConstants.zero,
                  radius: AppConstants.eight,
                  color: AppColor.colorButton,
                  padding1: AppUtils.commonAllEdgeInsets(
                      left: AppConstants.ten,
                      right: AppConstants.ten,
                      top: AppConstants.twenty,
                      bottom: AppConstants.twenty),
                  padding: AppConstants.eight,
                  widget: CommonTextWidget(
                    text: 'Send',
                    fontSize: fontSize,
                    left: AppConstants.ten,
                    right: AppConstants.ten,
                  ),
                ),
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
                    splashRadius: 0,
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
