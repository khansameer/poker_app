import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_list_bean.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
class EventPage extends StatefulWidget{
  final bool? isAdmin;
  const EventPage(this.isAdmin, {super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventPageState();
  }
  
}
class EventPageState extends State<EventPage>{
  List<CommonList> commonList = [];
  @override
  void initState() {
    getUserList();
    super.initState();
  }

  getUserList() {
    commonList.add(CommonList(icEvent1, "25 Aug, 23:52", "+ 500", "Pending", true));
    commonList.add(CommonList(icEvent, "25 Aug, 23:52", "+ 500", "Failed", true));
    commonList
        .add(CommonList(icEvent1, "25 Aug, 23:52", "+ 500", "Completed", false));
    commonList
        .add(CommonList(icEvent, "25 Aug, 23:52", "+ 500", "Completed", false));
    commonList.add(CommonList(icEvent1, "25 Aug, 23:52", "+ 500", "Pending", true));
    commonList.add(CommonList(icEvent, "25 Aug, 23:52", "+ 500", "Pending", false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.event,
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

        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: widget.isAdmin??true?2:1,
        //     mainAxisSpacing: 5,
        //     childAspectRatio: widget.isAdmin??true?1:(2 / 1)/*(2 / 1)*/,
        //     crossAxisSpacing: 0),
        shrinkWrap: true,
        primary: false,
        itemCount: commonList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              AppUtils.redirectToNextScreen(context: context,screenName: RouteName.eventDetails);

            },
            child: Container(
              height: 200,
              decoration: AppUtils.containerDecoration(
                  borderWidth: AppConstants.three,
                  radius: AppConstants.sixteen,
                  color: AppColor.colorBlueClub),
              margin: EdgeInsets.all(AppConstants.five),
              padding: EdgeInsets.only(
                  left: AppConstants.zero,
                  right: AppConstants.zero,
                  top: AppConstants.zero,
                  bottom: AppConstants.zero),
              child: Container(
                margin: EdgeInsets.all(AppConstants.five),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(AppConstants.fourteen)),
                    child: Container(

                      child: AppUtils.commonImageAssetWidget(
                          height: MediaQuery.of(context).size.height,

                          width:double.infinity,path: commonList[index].title,boxFit: BoxFit.cover),
                    )),
              ),
            ),
          );
        }) /*GridView.builder(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.isAdmin??true?2:1,
            mainAxisSpacing: 5,
            childAspectRatio: widget.isAdmin??true?1:(2 / 1)*//*(2 / 1)*//*,
            crossAxisSpacing: 0),
        shrinkWrap: true,
        primary: false,
        itemCount: commonList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              AppUtils.redirectToNextScreen(context: context,screenName: RouteName.eventDetails);

            },
            child: Container(
              height: 200,
              decoration: AppUtils.containerDecoration(
                  borderWidth: AppConstants.three,
                  radius: AppConstants.sixteen,
                  color: AppColor.colorBlueClub),
              margin: EdgeInsets.all(AppConstants.five),
              padding: EdgeInsets.only(
                  left: AppConstants.zero,
                  right: AppConstants.zero,
                  top: AppConstants.zero,
                  bottom: AppConstants.zero),
              child: Container(
                margin: EdgeInsets.all(AppConstants.five),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(AppConstants.fourteen)),
                    child: Container(

                      child: AppUtils.commonImageAssetWidget(
                        height: MediaQuery.of(context).size.height,

                          width:double.infinity,path: commonList[index].title,boxFit: BoxFit.fitHeight),
                    )),
              ),
            ),
          );
        })*/;
  }


}