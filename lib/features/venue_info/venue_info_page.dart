import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_list_bean.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class VenueInfoPage extends StatefulWidget{
  const VenueInfoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VenueInfoPageState();
  }
  
}
class VenueInfoPageState extends State<VenueInfoPage>{
  List<CommonList> commonList = [];
  @override
  void initState() {
    getUserList();
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
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.venueInfo,
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
          widget: Container(
              child: bindListView(),
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
                borderWidth: AppConstants.four,
                radius: AppConstants.sixteen,
                color: AppColor.colorBlueClub),
            margin: EdgeInsets.all(AppConstants.five),
            padding: EdgeInsets.only(
                left: AppConstants.fourteen,
                right: AppConstants.fourteen,
                top: AppConstants.twelve,
                bottom: AppConstants.twelve),
            child:/* ListTile(
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
            )*/Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                 children: [
                   CommonTextWidget(
                     text:'Stratford' /*commonList[index].price*/,
                     fontWeight: FontWeight.w500,
                     textAlign: TextAlign.right,
                   ),
                   SizedBox(height: 13,),
                   AppUtils.commonDivider(color: AppColor.colorWhiteLight,indent: 0),
                  /* ListTile(
                     dense: false,

                     visualDensity: VisualDensity(
                         horizontal: 1,vertical: -4
                     ),

                     contentPadding: EdgeInsets.zero,
                     minVerticalPadding: 0,
                     leading: AppUtils.commonImageSVGWidget(path: icMap),
                     title:  CommonTextWidget(
                       textAlign: TextAlign.start,
                       text: commonList[index].status,
                       margintop: AppConstants.three,
                       fontWeight: FontWeight.w500,
                       textColor: AppColor.colorWhite1,
                     ),
                   ),*/
                 ],
               )
              ],
            ),
          );
        });
  }


}