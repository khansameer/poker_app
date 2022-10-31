import 'package:flutter/material.dart';
import 'package:poker/core/common/RatingDialog.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_list_bean.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class ClubBalancePage extends StatefulWidget {
 // const ClubBalancePage({super.key});
  final bool? isAdmin;
  const ClubBalancePage(this.isAdmin, {super.key});
  @override
  State<StatefulWidget> createState() {
    return ClubBalancePageState();
  }
}

class ClubBalancePageState extends State<ClubBalancePage> {
  List<CommonList> commonList = [];
  late bool _isChecked;
  @override
  void initState() {
    getUserList();
    _isChecked = true;
    super.initState();
  }

  getUserList() {
    commonList.add(CommonList("In", "25 Aug, 23:52", "+ 500", "Pending", true));
    commonList.add(CommonList("In", "25 Aug, 23:52", "+ 500", "Failed", true));
    commonList
        .add(CommonList("Out", "25 Aug, 23:52", "+ 500", "Completed", false));
    commonList
        .add(CommonList("Out", "25 Aug, 23:52", "+ 500", "Completed", false));
    commonList.add(CommonList("In", "25 Aug, 23:52", "+ 500", "Pending", true));
  }

  @override
  Widget build(BuildContext context) {
    return CommonBgPage(
      backImagePath: icDashboardBg,
      margin: AppConstants.zero,
      alignment: Alignment.topCenter,
      imagePath: icDashboardimg,
      widget: Scaffold(
        resizeToAvoidBottomInset: false,

        bottomSheet: Container(
          color: AppColor.colorToolBar,
          height: AppConstants.eightyFour,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonButtonWidget(
                onPressed: () {
                 if(widget.isAdmin??true){
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
                 }
                 else{
                   showModalBottomSheet(
                       context: context,
                       isScrollControlled: true,
                       backgroundColor: AppColor.colorBottom,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(AppConstants.fourteen),
                             topRight: Radius.circular(AppConstants.fourteen)),
                       ),
                       builder: (context) {
                         return Padding(
                           padding: MediaQuery.of(context).viewInsets,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                               ListTile(
                                 trailing: IconButton(
                                     onPressed: () {
                                       AppUtils.onBack(context);
                                     },
                                     icon: Icon(
                                       Icons.close,
                                       color: Colors.white,
                                       size: AppConstants.twentyFour,
                                     )),
                                 title: CommonTextWidget(
                                   text: StringUtils.addChipsAmount.toCapitalize(),
                                   fontWeight: FontWeight.w700,
                                 ),
                               ),
                               AppUtils.commonDivider(
                                   color: AppColor.colorWt,
                                   indent: AppConstants.zero,
                                   endIndent: AppConstants.zero),
                               CommonTextField(
                                   colorHint: AppColor.colorHint,
                                   hint: "Enter the chips amount",
                                   left: AppConstants.twenty,
                                   rigth: AppConstants.twenty,

                                   colorText: AppColor.colorBlue,
                                   colorFill: AppColor.colorWhite,
                                   controller: AppUtils.tetEmail,
                                   inputTypes: TextInputType.number,
                                   marginTop: AppConstants.ten,
                                   fontSize: AppConstants.fourteen,
                                   fontWeight: FontWeight.w600,
                                   radius: AppConstants.eight),
                               CommonButtonWidget(
                                 onPressed: () {
                                   Navigator.pop(context);
                                   AppUtils.showAlertDialog( context: context,bgColor: AppColor.colorDialog);

                                 },
                                 bottom: AppConstants.twenty,
                                 marginTop: AppConstants.twentyFour,
                                 text: StringUtils.sendReqest,
                                 left: AppConstants.twenty,
                                 right: AppConstants.twenty,
                               )
                             ],
                           ),
                         );
                       });
                 }
                },
                text: StringUtils.requestChips,
                left: AppConstants.twenty,
                fontWeight: FontWeight.w600,
                right: AppConstants.twenty,
                marginTop: AppConstants.ten,
              )
            ],
          ),
        ),
        appBar: AppUtils.commonAppBar(
            context: context,
            title: StringUtils.clubBalance,
            isShowEdit: false,
            actionTitle: StringUtils.edit),
        body: Container(
          decoration: AppUtils.containerDecoration(
              color: AppColor.colorDarkBlue, radius: AppConstants.zero),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstants.thirty,
                ),
                AppUtils.commonCoinView(left: AppConstants.sixteen,right: AppConstants.sixteen,top: AppConstants.four),
                SizedBox(
                  height: AppConstants.twenty,
                ),
                AppUtils.commonDivider(
                    color: AppColor.colorWhiteLight,
                    endIndent: AppConstants.zero, indent: AppConstants.zero),
                CommonTextWidget(
                  text: StringUtils.history,
                  left: AppConstants.sixteen,
                  right: AppConstants.sixteen,
                  margintop: AppConstants.twenty,
                  fontSize: AppConstants.eighteen,
                  fontWeight: FontWeight.w600,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      bottom: AppConstants.eightyFour,
                      top: AppConstants.twelve,
                      left: AppConstants.sixteen,
                      right: AppConstants.sixteen),
                  child: bindListView(),
                )
              ],
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
        itemCount: commonList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            decoration: AppUtils.containerDecoration(
                borderWidth: AppConstants.two,
                radius: AppConstants.sixteen,
                color: AppColor.colorBlueClub),
            margin: EdgeInsets.only(top: AppConstants.five,bottom: AppConstants.five),
            padding: EdgeInsets.only(
                left: AppConstants.fourteen,
                right: AppConstants.fourteen,
                top: AppConstants.zero,
                bottom: AppConstants.zero),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonTextWidget(
                    text: commonList[index].price,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.right,
                  ),
                  CommonTextWidget(
                    textAlign: TextAlign.right,
                    text: commonList[index].status,
                    margintop: AppConstants.three,
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.colorWhite1,
                  ),
                ],
              ),
              leading: AppUtils.commonBg(
                  top: AppConstants.zero,
                  padding: AppConstants.twelve,
                  left: AppConstants.zero,
                  radius: AppConstants.sixteen,
                  widget: commonList[index].isShow ?? true
                      ? Icon(
                    Icons.arrow_downward_outlined,
                    color: AppColor.colorWhite,
                    size: AppConstants.twenty,
                  )
                      : Icon(
                    size: AppConstants.twenty,
                    Icons.arrow_upward,
                    color: AppColor.colorWhite,
                  ),
                  color: commonList[index].isShow ?? true
                      ? AppColor.colorGreenDark
                      : AppColor.colorLogout),
              title: CommonTextWidget(
                text: commonList[index].title,
                fontWeight: FontWeight.w500,
              ),
              subtitle: CommonTextWidget(
                text: commonList[index].date,
                margintop: AppConstants.three,
                fontWeight: FontWeight.w500,
              ),
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

                    value: _isChecked,
                    onChanged: ( val) {
                      setState(() {
                        _isChecked = val!;
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
