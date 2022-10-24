import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:poker/core/common/RatingDialog.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';

//import 'package:poker/core/common/context_extension.dart';
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
  late List<bool> _isChecked;
  TextEditingController tetAddNote=TextEditingController();
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
          title: StringUtils.newMemberDetails,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      bottomSheet: Container(
        height: 100,
        color: AppColor.colorBlueClub,
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
              left: AppConstants.thirty, right: AppConstants.thirty, top: 24),
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
                      onPressed: () {
                        AppUtils.redirectToNextScreen(
                            context: context,
                            screenName: RouteName.addMemberPage);
                      },
                      right: 5,
                      iconShow: true,
                      colorButton: Color.fromRGBO(81, 98, 137, 1),
                      colorBorder: AppColor.colorWhiteLight,
                      borderWidth: 2,
                      text: 'Add Player',
                      padding: AppConstants.ten,
                    )),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
                      onPressed: () {
                        AppUtils.redirectToNextScreen(
                            context: context,
                            screenName: RouteName.adminTotalAccountDetails);
                      },
                      left: 5,
                      text: 'Show Totals',
                      padding: AppConstants.ten,
                    )),
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: AppUtils.containerDecoration(
            color: Color.fromRGBO(0, 27, 105, 0.63), radius: AppConstants.zero),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topCenter,
          imagePath: icDashboardimg,
          widget: SingleChildScrollView(
            child: Container(
              margin: AppUtils.commonAllEdgeInsets(
                  left: 15, right: 15, bottom: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonTopView(text: 'Game Name'),
                  CommonTextField(
                    hint: 'Search player by name',
                    radius: 12,
                    fontSize: 14,
                    marginTop: 24,
                    colorFill: AppColor.colorWhite.withOpacity(0.3),
                    iconWidget: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        text: '${scheduleList.length} Members',
                        margintop: 0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
        padding1:
            AppUtils.commonAllEdgeInsets(left: 0, right: 0, bottom: 0, top: 0),
        radius: 16,
        borderWidth: 2,
        padding: 10,
        left: left ?? 0,
        right: right ?? 0,
        color: AppColor.colorBlueClub,
        colorBorder: AppColor.colorWhiteLight,
        widget: Column(
          children: [
            SizedBox(
              height: 10,
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
                        left: 10,
                        text: 'Add Note',
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
              height: 10,
            ),
            showAllRecord(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 5,
                  child: CommonButtonWidget(
                    onPressed: () {
                      AppUtils.commonDialog(
                          headerTitle: 'Add Note for Player name',
                          context: context,
                          child: Container(
                            margin: AppUtils.commonAllEdgeInsets(left: 20,right: 20,bottom: 20),
                            child: Column(
                              children: [
                                CommonTextWidget(
                                  fontSize: 14,
                                  lineHeight: 1.5,

                                  textAlign: TextAlign.left,

                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a orci sit amet purus\nsuscipit ullamcorper. ',
                                ),
                                AppUtils.commonSizedBox(height: 20),
                                AppUtils.commonInkWell(
                                  onTap: (){
                                    AppUtils.onBack(context);
                                    addNote(isEdit: true);

                                  },
                                  child: Row(
                                    children: [
                                      AppUtils.commonImageSVGWidget(path: icEdit),
                                      CommonTextWidget(
                                        left: 10,
                                        fontSize: 14,

                                        text: 'Edit Note',
                                        fontWeight: FontWeight.w700,
                                        textColor: AppColor.colorEdit,
                                        textDecoration: TextDecoration.underline,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                    fontSize: 12,
                    marginTop: AppConstants.ten,
                    borderWidth: AppConstants.two,
                    colorBorder: AppColor.colorWhiteLight,
                    text: 'Show Note',
                    colorButton: Color.fromRGBO(81, 98, 137, 1),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: CommonButtonWidget(
                    onPressed: () {
                      AppUtils.commonDialog(
                          context: context,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 25),
                              child: showAllRecord(fontSize: 10)),
                          headerTitle: 'Player Name');
                    },
                    left: AppConstants.ten,
                    fontSize: 12,
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
        top: 24,
        radius: 16,
        left: left ?? 0,
        borderWidth: 2,
        right: right ?? 0,
        width: MediaQuery.of(context).size.width,
        color: AppColor.colorWt.withOpacity(1),
        padding: 10,
        colorBorder: AppColor.colorWhiteLight,
        // padding1: ,
        widget: Container(
          padding: AppUtils.commonAllEdgeInsets(left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextWidget(
                text: text ?? "5000",
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
              AppUtils.commonSizedBox(height: 8),
              ListTile(
                dense: true,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                contentPadding: EdgeInsets.zero,
                leading: AppUtils.commonImageSVGWidget(path: icMan),
                title: CommonTextWidget(
                  text: 'NLH 2/5 Behind Startford',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
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
                  fontSize: 14,
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                dense: true,
                horizontalTitleGap: 0,
                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                contentPadding: EdgeInsets.zero,
                leading: AppUtils.commonImageSVGWidget(path: icMan),
                title: Row(
                  children: [
                    CommonTextWidget(
                      text: '4 Reservation',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    CommonTextWidget(
                      text: 'Show members',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      left: 10,
                      textDecoration: TextDecoration.underline,
                      textColor: AppColor.colorEdit,
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
      left: 2,
      fontSize: fontSize ?? 12,
    );
  }

  Widget commonRow(
      {String? text1,
      String? text2,
      String? text3,
      Color? colorText,
      double? fontSize}) {
    return AppUtils.commonBg(
      left: 0,
      right: 0,
      padding: 8,
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
      margin: EdgeInsets.only(left: 2, right: 2),
      child: VerticalDivider(
        thickness: 1,
        width: 10,
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
                  flex: 4,
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
  Widget addNote({bool? isEdit}){
    isEdit??true?tetAddNote.text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a orci sit amet purus\nsuscipit ullamcorper.":tetAddNote.text="";
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
              maxLines: 5,
              left: 10,
              rigth: 10,
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
