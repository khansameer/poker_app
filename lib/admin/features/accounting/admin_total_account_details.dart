import 'package:flutter/cupertino.dart';
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

class AdminTotalAccountDetailsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdminTotalAccountDetailsState();
  }
  
}
class AdminTotalAccountDetailsState extends State<AdminTotalAccountDetailsPage> {
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
          title: StringUtils.newMemberDetails,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      bottomSheet:  Container(
        height: 100,
        color: AppColor.colorBlueClub,
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(left: AppConstants.thirty,right: AppConstants.thirty,top: 24  ),
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
                      left: 5,

                      text: 'Complete',padding: AppConstants.ten, )),
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
              margin: AppUtils.commonAllEdgeInsets(left: 15,right: 15,bottom: 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  commonTopView(text: 'Game Name'),

                  SizedBox(height: 10,),
                commonListItem(index: 0),
                commonListItem1(index: 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget commonListItem({required int index,double? fontSize,double? left,double? right}){
    return AppUtils.commonBg(
        padding1: AppUtils.commonAllEdgeInsets(left: 0,right: 0,bottom: 0,top: 0),
        radius: 16,


        borderWidth: 2,
        padding: 10,

        left: left??0,

        right:right?? 0,
        color: AppColor.colorBlueClub,
        colorBorder: AppColor.colorWhiteLight,
        widget: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CommonTextWidget(text: 'Ins',fontWeight: FontWeight.w700,fontSize: 16,),

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow(text1: 'Source',text2: 'Total')),
                //commonDivider(),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow(text1: 'Player name',text2: '2,000',colorText: Colors.white)),
                ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow(text1: 'Player name',text2: '1,500',colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow(text1: 'Player name',text2: '500',colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow(text1: 'Player name',text2: '500',colorText: Colors.white)),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow(text1: 'Total',text2: '4,500',colorText: Colors.white)),
              ],
            ),



          ],
        )
    );
  }
  Widget commonListItem1({required int index,double? fontSize,double? left,double? right}){
    return AppUtils.commonBg(
        padding1: AppUtils.commonAllEdgeInsets(left: 0,right: 0,bottom: 0,top: 0),
        radius: 16,


        borderWidth: 2,
        padding: 10,

        left: left??0,

        right:right?? 0,
        color: AppColor.colorBlueClub,
        colorBorder: AppColor.colorWhiteLight,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CommonTextWidget(text: 'Out',fontWeight: FontWeight.w700,fontSize: 16,),

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                    flex: 5,child: commonRow(text1: 'Source',text2: 'Total',text3: 'Total')),
                //commonDivider(),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow1(text1: 'Shopping',text2: '4:30 pm',text3:"2,000",colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                    flex: 10,child: commonRow1(text1: 'Rent',text2: '4:10 pm',text3:"1,500",colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                    flex: 10,child: commonRow1(text1: 'Player name',text2: '4:00 pm',text3:"500",colorText: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow1(text1: 'Player name',text2:"4:00 pm",text3: '500',colorText: Colors.white)),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 10,child: commonRow(text1: 'Total',text2: '4,500',colorText: Colors.white)),
              ],
            ),



          ],
        )
    );
  }
  Widget commonTopView({String? text, String? desc,double? left,double? right}){
    return AppUtils.commonBg(
        top: 24,
        radius: 16,
        left: left??0,
        borderWidth: 2,
        right: right??0,
        width: MediaQuery.of(context).size.width,
        color: AppColor.colorBlueClub,
        padding: 10,
        colorBorder: AppColor.colorWhiteLight,
        // padding1: ,
        widget: Container(
          padding:AppUtils.commonAllEdgeInsets(left: 5,right: 5) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextWidget(text: text??"5000",fontWeight: FontWeight.w800,fontSize:16 ,),
              AppUtils.commonSizedBox(height: 8),


              ListTile(
                dense: true,

                minVerticalPadding:0,
                horizontalTitleGap:0 ,
                visualDensity: VisualDensity(
                    vertical: -4,

                    horizontal: -4
                ),
                contentPadding: EdgeInsets.zero,
                leading: AppUtils.commonImageSVGWidget(path: icMan),
                title: CommonTextWidget(text:'John Doe',fontWeight: FontWeight.w500,fontSize:14 ,),
              ),

            ],
          ),
        )
    );
  }

  Widget commonList({String? text,Color?colorText,f}){
    return CommonTextWidget(text:text,textColor: colorText??AppColor.colorWhite,left: 2,fontSize: 14,);
  }
  Widget commonRow({String? text1,String? text2,String? text3,Color? colorText}){
    return  AppUtils.commonBg(
      left: 0,
      right: 0,
      padding: 12,
      color: Color.fromRGBO(50, 69, 116, 1),

      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          commonList(text: text1,colorText: colorText??AppColor.colorWhite1),
          commonList(text: text2,colorText: colorText??AppColor.colorWhite1),
          //commonList(text: text3,colorText:colorText?? AppColor.colorWhite1),

        ],
      ),
    );
  }


  Widget commonRow1({String? text1,String? text2,String? text3,Color? colorText}){
    return  AppUtils.commonBg(
      left: 0,
      right: 0,
      padding: 12,
      color: Color.fromRGBO(50, 69, 116, 1),

      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonList(text: text1,colorText: colorText??AppColor.colorWhite1),
          commonList(text: text2,colorText: colorText??AppColor.colorWhite1),
          commonList(text: text3,colorText: colorText??AppColor.colorWhite1),

        ],
      ),
    );
  }
}

