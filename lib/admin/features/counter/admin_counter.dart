import 'package:flutter/material.dart';
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

class AdminCounterPage extends StatefulWidget{
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
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.creditFile,
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
                child: SizedBox(
                    width: AppConstants.twoHundredThirty,
                    height: AppConstants.fortyFive,
                    child: CommonButtonWidget(
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
                                    commonListItem(fontSize: 12,index: 0,left: 15 ,right: 15),
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
                      text: 'Credit Out',padding: AppConstants.ten, )),
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
              margin: AppUtils.commonAllEdgeInsets(left: 20,right: 20,bottom: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      commonTopView(),
                      Expanded(child: commonTopView(price:'1500',desc: 'Total Players chips\n(Excludes chips in play)',left: 5)),
                      AppUtils.commonInkWell(
                          onTap: (){
                            AppUtils.redirectToNextScreen(context: context,screenName: RouteName.adminTradeHistoryPage);
                          },
                          child: Expanded(child: commonTopView(price: '500',desc: "Trade History >",left: 5,textColor: Colors.white))),
                    ],
                  ),


                  AppUtils.commonBg(
                      top: 24,
                      radius: 16,
                      left: 0,
                      borderWidth: 2,
                      right: 0,

                      color: AppColor.colorBlueClub,
                      padding: 14,
                      colorBorder: AppColor.colorWhiteLight,
                      // padding1: ,
                      widget: Container(
                        padding:AppUtils.commonAllEdgeInsets(left: 5,right: 5) ,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget(text: "5000",fontWeight: FontWeight.w800,fontSize:14 ,),
                                CommonTextWidget(margintop:4,text: "Total Chips available to\nsend out",textColor: AppColor.colorWhite.withOpacity(0.7),fontSize: 12,),
                              ],
                            ),
                            AppUtils.commonInkWell(
                              onTap: (){
                                AppUtils.redirectToNextScreen(context: context,screenName: RouteName.adminCreditRequestPage);

                              },
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppUtils.commonBg(
                                        top: 0,
                                        left: 0,
                                        radius: 16,
                                        color: AppColor.colorButton,
                                        right: 0,
                                        width: 120,
                                        bottom: 0,widget:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppUtils.commonBg(
                                          width:32,
                                          height: 32,
                                          left: 0,
                                          right: 0,
                                          top: 0,
                                          bottom: 0,

                                          padding: 0,
                                          color: Colors.white,
                                          /* padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                                              decoration: AppUtils.containerDecoration(
                                                radius: 8,

                                                color: Colors.white,

                                              ),*/
                                          widget: Center(
                                            child: CommonTextWidget(text: "5",textColor: AppColor.colorButton,fontWeight: FontWeight.w800,fontSize: 12,),
                                          ),
                                        ),

                                        AppUtils.commonSizedBox(height: 5),
                                        AppUtils.commonInkWell(
                                            onTap: (){
                                              // AppUtils.redirectToNextScreen(context: context,screenName:RouteName)
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                CommonTextWidget(text: "Credit Requests",fontSize: 11,fontWeight: FontWeight.w400,),
                                                AppUtils.commonIcon(size:12,icon: Icons.arrow_forward_ios_rounded,color:AppColor.colorWhite.withOpacity(0.7))
                                              ],
                                            ))
                                      ],
                                    )
                                    )
                                    /* CommonTextWidget(
                                      margintop: 0,
                                      text: "1500",fontSize: 14,textAlign: TextAlign.center,textColor: AppColor.colorWhite,fontWeight: FontWeight.w800,),

                                    CommonTextWidget(text: "Total Chips available\n to send out",fontWeight: FontWeight.w500,fontSize:12 ,textColor: AppColor.colorWhite.withOpacity(0.7)),
                                 */  // CommonTextWidget(text: "Your Chips",fontWeight: FontWeight.w800,fontSize:13 ,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  ),

                  CommonTextField(
                    hint: 'Search player by name',
                    radius: 12,
                    fontSize: 14,
                    marginTop: 24,
                    colorFill: AppColor.colorWhite.withOpacity(0.3),
                    iconWidget: Icon(Icons.search,color: Colors.white,),


                  ),


                  SizedBox(height: 24,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(text: '${scheduleList.length} Members',margintop: 0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextWidget(text: 'Time Joined',margintop: 0,textColor: AppColor.colorEdit,),
                          AppUtils.commonIcon(icon: Icons.keyboard_arrow_down_outlined,size: 24,color: AppColor.colorEdit)
                        ],
                      ),
                    ],
                  ),
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

                commonListItem(index: index),

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


}
