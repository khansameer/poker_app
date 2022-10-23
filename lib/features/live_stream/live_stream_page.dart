import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
class LiveStreamPage extends StatefulWidget{
  const LiveStreamPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LiveStreamPageState();
  }
  
}
class LiveStreamPageState extends State<LiveStreamPage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.liveStream,
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
          widget: Stack(

            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(img)
                    )
                  ),
                  margin: EdgeInsets.only(bottom: AppConstants.oneHundredTwentyTwo),
                  height: double.infinity,

                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: AppConstants.sixteen,right: AppConstants.sixteen),
                height: AppConstants.oneHundred,
                alignment: Alignment.topCenter,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      //padding: EdgeInsets.all(8),
                      padding: EdgeInsets.only(left: AppConstants.sixteen,top: AppConstants.ten,right: AppConstants.sixteen,bottom: AppConstants.ten),
                      decoration: AppUtils.containerDecoration(
                          borderWidth: AppConstants.two,
                          radius: AppConstants.eight,
                          color: AppColor.colorBlueClub),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.remove_red_eye_outlined,color: AppColor.colorWhite,size: AppConstants.twenty,),
                          CommonTextWidget(text: '50',left: AppConstants.ten  )
                        ],
                      ),
                    ),
                    SizedBox(width: AppConstants.fourteen,),
                    Expanded(
                      child: SizedBox(
                          width: AppConstants.twoHundredThirty,
                          height: AppConstants.fortyFive,
                          child: CommonButtonWidget(
                            onPressed: (){
                              AppUtils.onBack(context);
                            },
                            text: StringUtils.endStream,padding: AppConstants.ten, )),
                    )
                  ],
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}