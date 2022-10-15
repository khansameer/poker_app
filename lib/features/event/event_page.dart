import 'package:flutter/material.dart';
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
class EventPage extends StatefulWidget{
  const EventPage({super.key});

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
        shrinkWrap: true,
        primary: false,
        itemCount: commonList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            decoration: AppUtils.containerDecoration(
                borderWidth: AppConstants.four,
                radius: AppConstants.sixteen,
                color: AppColor.colorBlueClub),
            margin: EdgeInsets.all(AppConstants.five),
            padding: EdgeInsets.only(
                left: AppConstants.zero,
                right: AppConstants.zero,
                top: AppConstants.zero,
                bottom: AppConstants.zero),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(AppConstants.sixteen)),
                child: AppUtils.commonImageAssetWidget(width:double.infinity,path: commonList[index].title,boxFit: BoxFit.cover)),
          );
        });
  }


}