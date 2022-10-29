import 'package:flutter/material.dart';
import 'package:poker/features/whaton/schedulebean.dart';
import 'package:flutter/cupertino.dart';

import 'package:poker/core/common/RatingDialog.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
class TradeHistoryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TradeHistoryState();
  }
  
}
class TradeHistoryState  extends State<TradeHistoryPage> {
  List<ScheduleBean> scheduleList = [];
  late List<bool> _isChecked;
  @override
  void initState() {
    super.initState();
    loadView();


  }

  loadView() {

    scheduleList.add(ScheduleBean(
      text: "-500",));
    scheduleList.add(ScheduleBean(
      text: "-500",));
    scheduleList.add(ScheduleBean(
      text: "+500",));
    scheduleList.add(ScheduleBean(
      text: "-500",));
    scheduleList.add(ScheduleBean(
      text: "-500",));
    scheduleList.add(ScheduleBean(
      text: "+500",));

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
              margin: AppUtils.commonAllEdgeInsets(left: 15,right: 15,bottom: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CommonTextField(
                    hint: 'Search player by name',
                    radius: 12,
                    fontSize: 14,
                    marginTop: 24,
                    colorFill: AppColor.colorWhite.withOpacity(0.3),
                    iconWidget: Icon(Icons.search,color: Colors.white,),


                  ),


                  SizedBox(height: 24,),

                  SizedBox(height: 10,),
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

                commonListItem(index: index,fontSize: 11),

              ],
            ),
          );
        });
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
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: AppUtils.commonImageAssetWidget(path: icGirlsIcon),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CommonTextWidget(text: "Player name",textColor: AppColor.colorWhite.withOpacity(0.7),left: 10,fontSize: 12,),
                    CommonTextWidget(margintop:4,text: "ID 00756",textColor: AppColor.colorWhite.withOpacity(0.7),left: 10,fontSize: fontSize,fontWeight: FontWeight.w400,),
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
                            top: 0,
                            left: 0,
                            right: 0,
                            radius: 100,
                            color: AppColor.colorFillEditText,
                            colorBorder: AppColor.colorWhite.withOpacity(0.7),
                            bottom: 0,
                            widget: CommonTextWidget(text: "Credit Out",textColor: AppColor.colorWhite.withOpacity(0.7),left: 5,fontSize: fontSize,)),
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

                    CommonTextWidget(text: scheduleList[index].text,textColor: AppColor.colorWhite.withOpacity(0.7),left: 5,fontSize: fontSize,fontWeight: FontWeight.w800,),
                    CommonTextWidget(margintop:4,text: "20 Sept, 2022",textColor: AppColor.colorWhite.withOpacity(0.7),left: 5,fontSize: fontSize,fontWeight: FontWeight.w400,),
                  ],
                )
              ],
            )
          ],
        )
    );
  }
  Widget commonTopView({String? price, String? desc,double? left,double? right,Color? textColor}){
    return AppUtils.commonBg(
        top: 24,
        radius: 16,
        left: left??0,
        borderWidth: 2,
        right: right??0,
        height: 70,
        color: AppColor.colorBlueClub,
        padding: 0,
        colorBorder: AppColor.colorWhiteLight,
        // padding1: ,
        widget: Container(
          padding:AppUtils.commonAllEdgeInsets(left: 5,right: 5) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextWidget(text: price??"5000",fontWeight: FontWeight.w800,fontSize:13 ,textColor: textColor,),
              CommonTextWidget(
                margintop: 4,
                text: desc??"Your Chips",fontSize: 10,textAlign: TextAlign.center,textColor: textColor??AppColor.colorWhite.withOpacity(0.7),)
            ],
          ),
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
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: AppUtils.commonImageAssetWidget(path: icGirlsIcon),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CommonTextWidget(text: "Player name",textColor: AppColor.colorWhite.withOpacity(0.7),left: 10,fontSize: fontSize,),
                    CommonTextWidget(margintop:4,text: "ID 00756",textColor: AppColor.colorWhite.withOpacity(0.7),left: 10,fontSize: fontSize,),
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

                          CommonTextWidget(text: "Available",textColor: AppColor.colorWhite.withOpacity(0.7),left: 10,fontSize: fontSize,),
                          CommonTextWidget(margintop:4,text: "500",textColor: AppColor.colorWhite.withOpacity(0.7),left: 10,fontSize: fontSize,fontWeight: FontWeight.w800,),
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
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(width: 2.0, color: AppColor.colorWhiteLight),
                    ),
                    checkColor: Colors.white,

                    value: _isChecked[index],
                    onChanged: ( val) {
                      setState(() {
                        _isChecked[index] = val!;
                      });
                    },
                  ),
                )
              ],
            )
          ],
        )
    );
  }

}