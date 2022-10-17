import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class EventDetailsPage extends StatefulWidget{
  const EventDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventDetailsPageState();
  }
  
}
class EventDetailsPageState extends State<EventDetailsPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.eventDetails,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorDarkBlue, radius: AppConstants.zero),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topCenter,
          imagePath: icDashboardimg,
          widget: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: AppConstants.twenty,right: AppConstants.twenty,top: AppConstants.twenty),
                alignment: Alignment.topCenter,
                child: AppUtils.commonImageAssetWidget(path: icEventDetails,alignment: Alignment.topCenter),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}