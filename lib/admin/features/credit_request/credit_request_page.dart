import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:poker/features/whaton/schedulebean.dart';
class CreditRequestPage extends StatefulWidget{
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                    width: AppConstants.twoHundredThirty,
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
                      colorButton:AppColor.colorFillEditText ,

                      colorBorder: AppColor.colorWhite.withOpacity(0.7),
                      onPressed: (){
                        showDialog(
                            barrierDismissible: false,
                            barrierColor:AppColor.colorWhiteLight,
                            context: context,
                            builder: (_) =>  CommonDialog(
                              isShowButtonView: false,
                              headerTitle: "Credit Out",
                              widget: Container(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:  MainAxisAlignment.start,
                                  children: [

                                    CommonTextWidget(
                                      text: '5000',
                                      left: AppConstants.fifteen,
                                      fontSize: AppConstants.eighteen,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    CommonTextWidget(
                                      textColor: AppColor.colorWhite.withOpacity(0.7),
                                      fontSize: 14,
                                      margintop: 8,
                                      left: AppConstants.fifteen,
                                      text: 'Total Chips available to send out',
                                    ),
                                    AppUtils.commonSizedBox(height: 20),
                                    AppUtils.commonDivider(),
                                    CommonTextField(

                                        left: 15,
                                        rigth: 15 ,marginTop: 20,
                                        inputTypes: TextInputType.number,
                                        hint: 'Enter the amount',
                                        suffixIcon: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CommonTextWidget(text: "\$",textAlign: TextAlign.center,),
                                          ],
                                        ),
                                        fontSize: AppConstants.fourteen,

                                        fontWeight: FontWeight.w500,
                                        radius: AppConstants.twelve),
                                    CommonTextWidget(text: "Sending to",fontWeight: FontWeight.w500,fontSize: 14,margintop: 15,left: 15,),
                                    commonListItem1(fontSize: 12,index: 0,left: 15 ,right: 15),
                                    AppUtils.commonSizedBox(height: 20,),
                                    AppUtils.commonDivider(indent: 0,endIndent: 0),
                                    AppUtils.commonSizedBox(height: 20),
                                    Container(
                                      margin: AppUtils.commonAllEdgeInsets(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CommonTextWidget(text: "0",fontWeight: FontWeight.w800,fontSize: 16,left: 15,),
                                                  CommonTextWidget(left:15,margintop:5,text: "Total Credit out",fontWeight: FontWeight.w500,fontSize: 14,textColor: AppColor.colorWhite.withOpacity(0.7),),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CommonButtonWidget(text: 'Confirm',paddingOnly: EdgeInsets.only(left: 40,right: 40),right: 15,),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                            )
                        );
                      },
                      text: 'Reject all',padding: AppConstants.ten, )),
              ), Expanded(
                child: SizedBox(
                    width: AppConstants.twoHundredThirty,
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
                      left: 15,
                      onPressed: (){
                        showDialog(
                            barrierDismissible: false,
                            barrierColor:AppColor.colorWhiteLight,
                            context: context,
                            builder: (_) =>  CommonDialog(
                              isShowButtonView: false,
                              headerTitle: "Credit Out",
                              widget: Container(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:  MainAxisAlignment.start,
                                  children: [

                                    CommonTextWidget(
                                      text: '5000',
                                      left: AppConstants.fifteen,
                                      fontSize: AppConstants.eighteen,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    CommonTextWidget(
                                      textColor: AppColor.colorWhite.withOpacity(0.7),
                                      fontSize: 14,
                                      margintop: 8,
                                      left: AppConstants.fifteen,
                                      text: 'Total Chips available to send out',
                                    ),
                                    AppUtils.commonSizedBox(height: 20),
                                    AppUtils.commonDivider(),
                                    CommonTextField(

                                        left: 15,
                                        rigth: 15 ,marginTop: 20,
                                        inputTypes: TextInputType.number,
                                        hint: 'Enter the amount',
                                        suffixIcon: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CommonTextWidget(text: "\$",textAlign: TextAlign.center,),
                                          ],
                                        ),
                                        fontSize: AppConstants.fourteen,

                                        fontWeight: FontWeight.w500,
                                        radius: AppConstants.twelve),
                                    CommonTextWidget(text: "Sending to",fontWeight: FontWeight.w500,fontSize: 14,margintop: 15,left: 15,),
                                    commonListItem1(fontSize: 12,index: 0,left: 15 ,right: 15),
                                    AppUtils.commonSizedBox(height: 20,),
                                    AppUtils.commonDivider(indent: 0,endIndent: 0),
                                    AppUtils.commonSizedBox(height: 20),
                                    Container(
                                      margin: AppUtils.commonAllEdgeInsets(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CommonTextWidget(text: "0",fontWeight: FontWeight.w800,fontSize: 16,left: 15,),
                                                  CommonTextWidget(left:15,margintop:5,text: "Total Credit out",fontWeight: FontWeight.w500,fontSize: 14,textColor: AppColor.colorWhite.withOpacity(0.7),),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CommonButtonWidget(text: 'Confirm',paddingOnly: EdgeInsets.only(left: 40,right: 40),right: 15,),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                            )
                        );
                      },
                      text: 'Approve all',padding: AppConstants.ten, )),
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

                        CommonTextWidget(text: "Available",textColor: AppColor.colorWhite.withOpacity(0.7),left: 5,fontSize: fontSize,),
                        CommonTextWidget(margintop:4,text: "20 Sept, 2022",textColor: AppColor.colorWhite.withOpacity(0.7),left: 5,fontSize: fontSize,fontWeight: FontWeight.w400,),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [

                AppUtils.commonInkWell(
                  onTap: (){
                    setState(() {
                      scheduleList.removeAt(index);
                    });
                  },
                  child: AppUtils.commonBg(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 5,
                    radius: 8,
                    color: Colors.transparent,
                    width: 30,
                    height: 30,
                    padding: 0,
                    widget: Icon(Icons.close,size: 18,color: Colors.white,),
                    colorBorder:  AppColor.colorWhiteLight,
                    borderWidth: 2
                  ),
                ),
                AppUtils.commonBg(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    radius: 8,
                    color: AppColor.colorButton,
                    padding1:AppUtils.commonAllEdgeInsets(left: 10,right: 10,top:20,bottom: 20),
                    padding: 8,
                    widget:CommonTextWidget(text: 'Send',fontSize: fontSize,left: 10,right: 10,),

                ),
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