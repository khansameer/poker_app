import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class AdminAccountingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountingState();
  }
}

class AccountingState extends State<AdminAccountingPage> {
  List<ScheduleBean> scheduleList = [];
  TextEditingController tetAddNote = TextEditingController();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.newMemberDetails,
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
                flex: AppConstants.five.toInt(),
                child: SizedBox(
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
                      onPressed: () {
                        AppUtils.redirectToNextScreen(
                            context: context,
                            screenName: RouteName.addMemberPage);
                      },
                      right: AppConstants.five,
                      iconShow: true,
                      colorButton: AppColor.colorAddPlayer,
                      colorBorder: AppColor.colorWhiteLight,
                      borderWidth: AppConstants.two,
                      text: StringUtils.addPlayer,
                      padding: AppConstants.ten,
                    )),
              ),
              Expanded(
                flex: AppConstants.five.toInt(),
                child: SizedBox(
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
                      onPressed: () {
                        AppUtils.redirectToNextScreen(
                            context: context,
                            screenName: RouteName.adminTotalAccountDetails);
                      },
                      left: AppConstants.five,
                      text: StringUtils.showTotal,
                      padding: AppConstants.ten,
                    )),
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorBlueLight.withOpacity(0.63),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonTopView(text: 'Game Name'),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        text: '${scheduleList.length} Members',
                        margintop: AppConstants.zero,
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
        left: left ?? AppConstants.zero,
        right: right ?? AppConstants.zero,
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
                  text: 'Player Name',
                  fontWeight: FontWeight.w700,
                ),
                AppUtils.commonInkWell(
                  onTap: () {
                    addNote(isEdit: false);
                  },
                  child: Row(
                    children: [
                      AppUtils.commonImageSVGWidget(path: icEdit),
                      CommonTextWidget(
                        left: AppConstants.ten,
                        text: StringUtils.addNote,
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.colorEdit,
                        textDecoration: TextDecoration.underline,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppConstants.ten,
            ),
            showAllRecord(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: AppConstants.five.toInt(),
                  child: CommonButtonWidget(
                    onPressed: () {
                      AppUtils.commonDialog(
                          headerTitle: 'Add Note for Player name',
                          context: context,
                          child: Container(
                            margin: AppUtils.commonAllEdgeInsets(
                                left: AppConstants.twenty,
                                right: AppConstants.twenty,
                                bottom: AppConstants.twenty),
                            child: Column(
                              children: [
                                CommonTextWidget(
                                  fontSize: AppConstants.fourteen,
                                  lineHeight: 1.5,
                                  textAlign: TextAlign.left,
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a orci sit amet purus\nsuscipit ullamcorper. ',
                                ),
                                AppUtils.commonSizedBox(
                                    height: AppConstants.twenty),
                                AppUtils.commonInkWell(
                                  onTap: () {
                                    AppUtils.onBack(context);
                                    addNote(isEdit: true);
                                  },
                                  child: Row(
                                    children: [
                                      AppUtils.commonImageSVGWidget(
                                          path: icEdit),
                                      CommonTextWidget(
                                        left: AppConstants.ten,
                                        fontSize: AppConstants.fourteen,
                                        text: StringUtils.editNote,
                                        fontWeight: FontWeight.w700,
                                        textColor: AppColor.colorEdit,
                                        textDecoration:
                                            TextDecoration.underline,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                    fontSize: AppConstants.twelve,
                    marginTop: AppConstants.ten,
                    borderWidth: AppConstants.two,
                    colorBorder: AppColor.colorWhiteLight,
                    text: StringUtils.showNote,
                    colorButton: AppColor.colorAddPlayer,
                  ),
                ),
                Expanded(
                  flex: AppConstants.five.toInt(),
                  child: CommonButtonWidget(
                    onPressed: () {
                      AppUtils.commonDialog(
                          context: context,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: AppConstants.ten,
                                  right: AppConstants.ten,
                                  bottom: AppConstants.twentyFour),
                              child: showAllRecord(fontSize: AppConstants.ten)),
                          headerTitle: 'Player Name');
                    },
                    left: AppConstants.ten,
                    fontSize: AppConstants.twelve,
                    right: AppConstants.ten,
                    marginTop: AppConstants.ten,
                    text: 'Show All records',
                    colorButton: AppColor.colorButton,
                    //colorButton: Color.fromRGBO(106, 90, 230, 1),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget commonTopView(
      {String? text, String? desc, double? left, double? right}) {
    return AppUtils.commonBg(
        top: AppConstants.twentyFour,
        radius: AppConstants.sixteen,
        left: left ?? AppConstants.zero,
        borderWidth: AppConstants.two,
        right: right ?? AppConstants.zero,
        width: MediaQuery.of(context).size.width,
        color: AppColor.colorWt.withOpacity(1),
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
              CommonTextWidget(
                text: text ?? "5000",
                fontWeight: FontWeight.w800,
                fontSize: AppConstants.sixteen,
              ),
              AppUtils.commonSizedBox(height: AppConstants.eight),
              ListTile(
                dense: true,
                minVerticalPadding: AppConstants.zero,
                horizontalTitleGap: AppConstants.zero,
                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                contentPadding: EdgeInsets.zero,
                leading: AppUtils.commonImageSVGWidget(path: icMan),
                title: CommonTextWidget(
                  text: 'NLH 2/5 Behind Startford',
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.fourteen,
                ),
              ),
              ListTile(
                dense: true,
                minVerticalPadding: AppConstants.zero,
                horizontalTitleGap: AppConstants.zero,
                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                contentPadding: EdgeInsets.zero,
                leading: AppUtils.commonImageSVGWidget(path: icMan),
                title: CommonTextWidget(
                  text: 'John Doe',
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.fourteen,
                ),
              ),
              ListTile(
                minVerticalPadding: AppConstants.zero,
                dense: true,
                horizontalTitleGap: AppConstants.zero,
                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                contentPadding: EdgeInsets.zero,
                leading: AppUtils.commonImageSVGWidget(path: icMan),
                title: Row(
                  children: [
                    CommonTextWidget(
                      text: '4 Reservation',
                      fontWeight: FontWeight.w500,
                      fontSize: AppConstants.fourteen,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              contentPadding: EdgeInsets.zero,
                              insetPadding: EdgeInsets.zero,
                              titlePadding: EdgeInsets.zero,
                              elevation: AppConstants.zero,
                              backgroundColor: AppColor.colorCommonDialog,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.twelve)),
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 60,
                                  child: Container(
                                      decoration: AppUtils.containerDecoration(
                                          color: Colors.transparent,
                                          radius: AppConstants.thirteen,
                                          colorBorder: AppColor.colorWhiteLight,
                                          borderWidth: AppConstants.three),
                                      child: Column(
                                        children: [
                                          AppUtils.commonSizedBox(
                                              height: AppConstants.twenty),
                                          Container(
                                            margin:
                                                AppUtils.commonAllEdgeInsets(
                                                    left: AppConstants.twenty,
                                                    right: AppConstants.twenty),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CommonTextWidget(
                                                  left: AppConstants.ten,
                                                  text: "Reservation List",
                                                  fontWeight: FontWeight.w800,
                                                  fontSize:
                                                      AppConstants.sixteen,
                                                ),
                                                AppUtils.commonInkWell(
                                                  onTap: () {
                                                    AppUtils.onBack(context);
                                                  },
                                                  child: AppUtils.commonIcon(
                                                    icon: Icons.close,
                                                    color: AppColor.colorWhite,
                                                    size: AppConstants.twenty,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          AppUtils.commonSizedBox(
                                              height: AppConstants.twenty),
                                          AppUtils.commonDivider(
                                            endIndent: AppConstants.zero,
                                            indent: AppConstants.zero,
                                          ),
                                          AppUtils.bindDialogList(),
                                        ],
                                      )),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: CommonTextWidget(
                        text: 'Show members',
                        fontWeight: FontWeight.w500,
                        fontSize: AppConstants.fourteen,
                        left: AppConstants.ten,
                        textDecoration: TextDecoration.underline,
                        textColor: AppColor.colorEdit,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget commonList({String? text, Color? colorText, double? fontSize}) {
    return CommonTextWidget(
      text: text,
      textColor: colorText ?? AppColor.colorWhite,
      left: AppConstants.two,
      fontSize: fontSize ?? AppConstants.twelve,
    );
  }

  Widget commonRow(
      {String? text1,
      String? text2,
      String? text3,
      Color? colorText,
      double? fontSize}) {
    return AppUtils.commonBg(
      left: AppConstants.zero,
      right: AppConstants.zero,
      padding: AppConstants.eight,
      color: Color.fromRGBO(50, 69, 116, 1),
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          commonList(
              text: text1,
              colorText: colorText ?? AppColor.colorWhite1,
              fontSize: fontSize),
          commonList(
              text: text2,
              colorText: colorText ?? AppColor.colorWhite1,
              fontSize: fontSize),
          commonList(
              text: text3,
              colorText: colorText ?? AppColor.colorWhite1,
              fontSize: fontSize),
        ],
      ),
    );
  }

  Widget commonDivider() {
    return Container(
      margin: EdgeInsets.only(left: AppConstants.two, right: AppConstants.two),
      child: VerticalDivider(
        thickness: 1,
        width: AppConstants.ten,
        color: AppColor.colorWhiteLight,
      ),
    );
  }

  Widget showAllRecord({double? fontSize}) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: AppConstants.four.toInt(),
                  child: commonRow(
                      fontSize: fontSize,
                      text1: 'Credit',
                      text2: 'Time',
                      text3: 'Total')),
              commonDivider(),
              Expanded(
                  flex: 6,
                  child: commonRow(
                      fontSize: fontSize,
                      text1: 'Cash out',
                      text2: 'Time',
                      text3: 'End Balance')),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child: commonRow(
                      fontSize: fontSize,
                      text1: '500',
                      text2: '4:30 pm',
                      text3: '2,000',
                      colorText: AppColor.colorWhite)),
              commonDivider(),
              Expanded(
                  flex: 6,
                  child: commonRow(
                      fontSize: fontSize,
                      text1: '500',
                      text2: '4:30 pm',
                      text3: '2,000',
                      colorText: AppColor.colorWhite)),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child: commonRow(
                      fontSize: fontSize,
                      text1: '500',
                      text2: '4:30 pm',
                      text3: '2,000',
                      colorText: AppColor.colorWhite)),
              commonDivider(),
              Expanded(
                  flex: 6,
                  child: commonRow(
                      fontSize: fontSize,
                      text1: '500',
                      text2: '4:30 pm',
                      text3: '2,000',
                      colorText: AppColor.colorWhite)),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child: commonRow(
                      fontSize: fontSize,
                      text1: '500',
                      text2: '4:30 pm',
                      text3: '2,000',
                      colorText: AppColor.colorWhite)),
              commonDivider(),
              Expanded(
                  flex: 6,
                  child: commonRow(
                      fontSize: fontSize,
                      text1: '500',
                      text2: '4:30 pm',
                      text3: '2,000',
                      colorText: AppColor.colorWhite)),
            ],
          ),
        ),
      ],
    );
  }

  Widget addNote({bool? isEdit}) {
    isEdit ?? true
        ? tetAddNote.text =
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a orci sit amet purus\nsuscipit ullamcorper."
        : tetAddNote.text = "";
    return AppUtils.commonDialog(
        context: context,
        onTapBtn2: () {
          AppUtils.onBack(context);
        },
        onTapBtn1: () {
          AppUtils.onBack(context);
        },
        btn2Text: 'Save',
        isShowButtonView: true,
        headerTitle: 'Add Note for Player name',
        child: Container(
          child: CommonTextField(
              maxLines: AppConstants.five.toInt(),
              left: AppConstants.ten,
              rigth: AppConstants.ten,
              controller: tetAddNote,
              colorFill: AppColor.colorFillEditText,
              inputTypes: TextInputType.emailAddress,
              marginTop: AppConstants.ten,
              hint: 'Write your note here',
              fontSize: AppConstants.fourteen,
              fontWeight: FontWeight.w500,
              radius: AppConstants.eight),
        ));
  }
}
