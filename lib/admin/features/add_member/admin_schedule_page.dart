import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker/core/common/RatingDialog.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class AdminSchedulePage extends StatefulWidget {
  const AdminSchedulePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScheduleAdminPageState();
  }
}

class ScheduleAdminPageState extends State<AdminSchedulePage> {
  List<ScheduleBean> scheduleList = [];
  var selectedTimeData = '00:00';
  DateTime _dateTime = DateTime.now();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.schedule,
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
            onTap: () {},
            child: Container(

             // height: AppConstants.twoHundredFiftyFive,
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
                  top: AppConstants.fourteen,
                  bottom: AppConstants.fourteen),
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

                  CommonButtonWidget(
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          barrierColor:AppColor.colorWhiteLight,
                          context: context,
                          builder: (_) =>  CommonDialog(
                            isShowButtonView: false,

                            widget: Container(
                              width: double.minPositive,
                              height:500 ,
                              alignment: Alignment.topLeft,

                              child: bindList(),
                            ),
                            headerTitle: "Reservation List",
                          )
                      );
                    },
                    text: "Show Reservation List".toCapitalize(),
                    left: AppConstants.zero,

                    right: AppConstants.thirty,
                    bottom: AppConstants.ten,
                    marginTop: AppConstants.ten,
                  ),

                ],
              ),
            ),
          );
        });
  }

  assignValue() {
    return selectedTimeData;
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

  Widget bindList(){
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CommonTextWidget(text: "4 Member",textAlign: TextAlign.left,fontSize: AppConstants.fourteen,),
           ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: scheduleList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return AppUtils.commonBg(
                borderWidth: 5,
                colorBorder: Colors.red,
                 widget: ListTile(
                   title: CommonTextWidget(text: "Player name",),
                 )
              );
            })
          ],
        ),
      ),
    );
  }
}
