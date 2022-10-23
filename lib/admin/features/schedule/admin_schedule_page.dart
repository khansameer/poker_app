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
  List<ScheduleBean> scheduleList1 = [];

  var selectedTimeData = '00:00';
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    loadView();
    loadViewDelete();
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
  loadViewDelete() {
    scheduleList1.add(ScheduleBean(
        text: "Tooth Hurty ",
        date: "THU, 1st October  | 2:30 pm",
        isShow: true,
        textItem: "Chinese Dentist",
        textItem1: "2/5 LOL ",
        textItem2: ""));
    scheduleList1.add(ScheduleBean(
        text: "Event Name",
        date: "Wed, 21st September  | 8 pm",
        isShow: false,
        textItem: "Frames Poker ",
        textItem1: "2/5 plo ",
        textItem2: "2/5 hold em "));
    scheduleList1.add(ScheduleBean(
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

                          context: context,
                          builder: (BuildContext context) {
                        return SimpleDialog(
                          contentPadding: EdgeInsets.zero,
                          insetPadding: EdgeInsets.zero,

                          titlePadding: EdgeInsets.zero,
                          elevation: 0,

                          backgroundColor: AppColor.colorCommonDialog,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppConstants.twelve)),
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child:Container(

                                decoration: AppUtils.containerDecoration(
                                    color: Colors.transparent,
                                    radius: 13,colorBorder: AppColor.colorWhiteLight,borderWidth: 3),
                                  child: Column(

                                    children: [
                                      AppUtils.commonSizedBox(height: AppConstants.twenty),

                                      Container(
                                        margin: AppUtils.commonAllEdgeInsets(left: 20,right: 20),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonTextWidget(
                                              left:AppConstants.ten,
                                              text: "Reservation List",
                                              fontWeight: FontWeight.w800,
                                              fontSize: AppConstants.eighteen,
                                            ),
                                            AppUtils.commonInkWell(
                                              onTap: () {
                                                AppUtils.onBack(context);
                                              },
                                              child: AppUtils.commonIcon(
                                                icon: Icons.close,
                                                color: AppColor.colorWhite,
                                                size: AppConstants.twentyFour,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      AppUtils.commonSizedBox(height: AppConstants.twenty),
                                      AppUtils.commonDivider(
                                        endIndent: AppConstants.zero,
                                        indent: AppConstants.zero,
                                      ),

                                      bindList(),
                                    ],
                                  )),
                            )
                          ],
                        );
                      },
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
    return Container(
      margin: AppUtils.commonAllEdgeInsets(left: 20,right: 20,top: 10,bottom: 20),
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            CommonTextWidget(text: "4 Members",left:7,textAlign: TextAlign.left,fontSize: AppConstants.fourteen,margintop: AppConstants.four,),

            AppUtils.commonSizedBox(height: 5),
            ListView.builder(
            shrinkWrap: true,
            primary: false,

            itemCount: scheduleList1.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return AppUtils.commonBg(
                padding1: AppUtils.commonAllEdgeInsets(left: 0,right: 0,bottom: 0,top: 0),
                radius: 16,


                borderWidth: 2,
                padding: 0,

                left: 0,

                right: 0,
                 colorBorder: AppColor.colorWhiteLight,
                 widget: ListTile(
                   dense: false,
                   minVerticalPadding: 0,
                   contentPadding: EdgeInsets.only(left: 10,right: 10),
                   horizontalTitleGap: 10,

                   leading: SizedBox(
                     width: 40,
                     height: 40,
                     child: AppUtils.commonImageAssetWidget(path: icGirlsIcon),
                   ),
                   trailing: AppUtils.commonInkWell(
                       onTap: (){
                         setState(() {
                           scheduleList1.removeAt(index);
                         });
                       },
                       child: CommonTextWidget(right:10,text: "Remove",textColor: AppColor.colorRemoveText,fontWeight: FontWeight.w700,)),
                   title: CommonTextWidget(text: "Player name",),
                   subtitle: CommonTextWidget(text: "ID 00756",),
                 )
              );
            })
          ],
        ),
      ),
    );
  }
}
