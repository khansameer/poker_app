import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
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
              padding1: AppUtils.commonAllEdgeInsets(left: 0,right: 0,bottom: 0,top: 0),
              radius: 16,


              borderWidth: 2,
              padding: 0,

              left: 0,

              right: 0,
              color: AppColor.colorBlueClub,
              colorBorder: AppColor.colorWhiteLight,
              widget: ListTile(
                dense: true,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.only(left: 10,right: 10),
                horizontalTitleGap: 10,

                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: AppUtils.commonImageAssetWidget(path: icGirlsIcon),
                ),
                trailing: AppUtils.commonInkWell(
                    onTap: (){
                      setState(() {
                      //  scheduleList1.removeAt(index);
                      });
                    },
                    child: CommonTextWidget(right:10,fontSize:13,text: widget.scheduleList[index].text,textColor: AppColor.colorWhite,fontWeight: FontWeight.w800,)),
                title: CommonTextWidget(text: "Player name",fontWeight: FontWeight.w800,fontSize: 13,),
                subtitle: CommonTextWidget(text: "ID 00756",textColor: AppColor.colorWhite1,fontSize: 12,),
              )
          );
        });
  }
}
