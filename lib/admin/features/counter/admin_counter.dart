import 'package:flutter/material.dart';
import 'package:poker/core/common/RatingDialog.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class AdminCounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdminCounterState();
  }
}

class AdminCounterState extends State<AdminCounterPage> {
  List<ScheduleBean> scheduleList = [];
  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    loadView();
  }

  loadView() {
    scheduleList.add(ScheduleBean(
      text: "Sam",
    ));
    scheduleList.add(ScheduleBean(
      text: "Smith",
    ));
    scheduleList.add(ScheduleBean(
      text: "Jhon",
    ));
    scheduleList.add(ScheduleBean(
      text: "Neha",
    ));
    scheduleList.add(ScheduleBean(
      text: "Rekha",
    ));

    _isChecked = List<bool>.filled(scheduleList.length, false);
  }

  void filterSearchResults(String query) {
    List<ScheduleBean> dummySearchList = [];
    dummySearchList.addAll(scheduleList);
    if (query.isNotEmpty) {
      List<ScheduleBean> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.text!.toCapitalize().contains(query)) {
          dummyListData.add(item);
        }
      });

      setState(() {
        scheduleList.clear();
        scheduleList.addAll(dummyListData);
      });
    } else {
      setState(() {
        loadView();
        dummySearchList.clear();
        print('===========${dummySearchList}');
      });
    }
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
              SizedBox(
                  width: AppConstants.twoHundredFifty,
                  height: AppConstants.fortyFive,
                  child: CommonButtonWidget(
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      commonListItem(
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CommonTextWidget(
                                                      text: "0",
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize:
                                                          AppConstants.fifteen,
                                                      left:
                                                          AppConstants.fifteen,
                                                    ),
                                                    CommonTextWidget(
                                                      left:
                                                          AppConstants.fifteen,
                                                      margintop:
                                                          AppConstants.five,
                                                      text: "Total Credit out",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
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
                                                  paddingOnly: EdgeInsets.only(
                                                      left: AppConstants.forty,
                                                      right:
                                                          AppConstants.forty),
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
                    text: 'Credit Out',
                    padding: AppConstants.ten,
                  ))
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
                  left: AppConstants.twenty,
                  right: AppConstants.twenty,
                  bottom: AppConstants.oneHundredTen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      commonTopView(),
                      Expanded(
                          flex: 1,
                          child: commonTopView(
                              price: '1500',
                              desc:
                                  'Total Players chips\n(Excludes chips in play)',
                              left: AppConstants.five)),
                      AppUtils.commonInkWell(
                          onTap: () {
                            AppUtils.redirectToNextScreen(
                                context: context,
                                screenName: RouteName.adminTradeHistoryPage);
                          },
                          child: Expanded(
                              flex: 1,
                              child: commonTopView(
                                  price: '500',
                                  desc: "Trade History >",
                                  left: AppConstants.five,
                                  textColor: Colors.white))),
                    ],
                  ),
                  AppUtils.commonBg(
                      top: AppConstants.twentyFour,
                      radius: AppConstants.sixteen,
                      left: AppConstants.zero,
                      borderWidth: AppConstants.two,
                      right: AppConstants.zero,
                      color: AppColor.colorBlueClub,
                      padding: AppConstants.fourteen,
                      colorBorder: AppColor.colorWhiteLight,
                      // padding1: ,
                      widget: Container(
                        padding: AppUtils.commonAllEdgeInsets(
                            left: AppConstants.five, right: AppConstants.five),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget(
                                  text: "5000",
                                  fontWeight: FontWeight.w800,
                                  fontSize: AppConstants.fourteen,
                                ),
                                CommonTextWidget(
                                  margintop: AppConstants.four,
                                  text: "Total Chips available to\nsend out",
                                  textColor:
                                      AppColor.colorWhite.withOpacity(0.7),
                                  fontSize: AppConstants.twelve,
                                ),
                              ],
                            ),
                            AppUtils.commonInkWell(
                              onTap: () {
                                AppUtils.redirectToNextScreen(
                                    context: context,
                                    screenName:
                                        RouteName.adminCreditRequestPage);
                              },
                              child: Container(
                                child: Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppUtils.commonBg(
                                          top: AppConstants.zero,
                                          left: AppConstants.zero,
                                          radius: AppConstants.sixteen,
                                          color: AppColor.colorButton,
                                          right: AppConstants.zero,
                                          width: AppConstants.oneHundredTwenty,
                                          bottom: AppConstants.zero,
                                          widget: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppUtils.commonBg(
                                                width: AppConstants.thirtyTwo,
                                                height: AppConstants.thirtyTwo,
                                                left: AppConstants.zero,
                                                right: AppConstants.zero,
                                                top: AppConstants.zero,
                                                bottom: AppConstants.zero,
                                                padding: AppConstants.zero,
                                                color: Colors.white,
                                                widget: Center(
                                                  child: CommonTextWidget(
                                                    text: "5",
                                                    textColor:
                                                        AppColor.colorButton,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize:
                                                        AppConstants.twelve,
                                                  ),
                                                ),
                                              ),
                                              AppUtils.commonSizedBox(
                                                  height: AppConstants.five),
                                              AppUtils.commonInkWell(
                                                  onTap: () {
                                                    // AppUtils.redirectToNextScreen(context: context,screenName:RouteName)
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CommonTextWidget(
                                                        text: "Credit Requests",
                                                        fontSize:
                                                            AppConstants.eleven,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      AppUtils.commonIcon(
                                                          size: AppConstants
                                                              .eleven,
                                                          icon: Icons
                                                              .arrow_forward_ios_rounded,
                                                          color: AppColor
                                                              .colorWhite
                                                              .withOpacity(0.7))
                                                    ],
                                                  ))
                                            ],
                                          ))
                                      /* CommonTextWidget(
                                        margintop: 0,
                                        text: "1500",fontSize: 14,textAlign: TextAlign.center,textColor: AppColor.colorWhite,fontWeight: FontWeight.w800,),

                                      CommonTextWidget(text: "Total Chips available\n to send out",fontWeight: FontWeight.w500,fontSize:12 ,textColor: AppColor.colorWhite.withOpacity(0.7)),
                                   */
                                      // CommonTextWidget(text: "Your Chips",fontWeight: FontWeight.w800,fontSize:13 ,),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  CommonTextField(
                    hint: 'Search player by name',
                    radius: AppConstants.twelve,
                    fontSize: AppConstants.fourteen,
                    onChange: (value) {
                      filterSearchResults(value);
                    },
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        text: '${scheduleList.length} Members',
                        margintop: AppConstants.zero,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextWidget(
                            text: 'Time Joined',
                            margintop: AppConstants.zero,
                            textColor: AppColor.colorEdit,
                          ),
                          AppUtils.commonIcon(
                              icon: Icons.keyboard_arrow_down_outlined,
                              size: AppConstants.twentyFour,
                              color: AppColor.colorEdit)
                        ],
                      ),
                    ],
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
                      text: scheduleList[index].text,
                      textColor: AppColor.colorWhite.withOpacity(1),
                      left: AppConstants.ten,
                      fontSize: fontSize,
                    ),
                    CommonTextWidget(
                      margintop: 4,
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
}
