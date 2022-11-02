import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class AdminDebitPage extends StatefulWidget {
  List<ScheduleBean> scheduleList;
  AdminDebitPage(this.scheduleList);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdminDebitPageState();
  }
}

class AdminDebitPageState extends State<AdminDebitPage> {
  //List<ScheduleBean> scheduleList = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bindList();
  }

  Widget bindList() {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: widget.scheduleList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return AppUtils.commonBg(
              padding1: AppUtils.commonAllEdgeInsets(
                  left: AppConstants.zero,
                  right: AppConstants.zero,
                  bottom: AppConstants.zero,
                  top: AppConstants.zero),
              radius: AppConstants.sixteen,
              borderWidth: AppConstants.zero,
              padding: AppConstants.zero,
              left: AppConstants.zero,
              right: AppConstants.zero,
              color: AppColor.colorBlueClub,
              colorBorder: AppColor.colorWhiteLight,
              widget: ListTile(
                dense: true,
                minVerticalPadding: AppConstants.zero,
                contentPadding: EdgeInsets.only(
                    left: AppConstants.ten, right: AppConstants.ten),
                horizontalTitleGap: AppConstants.ten,
                leading: SizedBox(
                  width: AppConstants.forty,
                  height: AppConstants.forty,
                  child: AppUtils.commonImageAssetWidget(path: icGirlsIcon),
                ),
                trailing: AppUtils.commonInkWell(
                    onTap: () {
                      setState(() {
                        //  scheduleList1.removeAt(index);
                      });
                    },
                    child: CommonTextWidget(
                      right: AppConstants.ten,
                      fontSize: AppConstants.thirteen,
                      text: widget.scheduleList[index].text,
                      textColor: AppColor.colorWhite,
                      fontWeight: FontWeight.w800,
                    )),
                title: CommonTextWidget(
                  text: "Player name",
                  fontWeight: FontWeight.w800,
                  fontSize: AppConstants.thirteen,
                ),
                subtitle: CommonTextWidget(
                  text: "ID 00756",
                  textColor: AppColor.colorWhite1,
                  fontSize: AppConstants.twelve,
                ),
              ));
        });
  }
}
