import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class TermCoditionPage extends StatefulWidget{
  const TermCoditionPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TermCoditionPageState();
  }
  
}
class TermCoditionPageState extends State<TermCoditionPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.colorBlue,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: AppConstants.twentyFour,right: AppConstants.twentyFour),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: AppConstants.fortyFive,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppUtils.commonImageAssetWidget(path: icLogo,height: AppConstants.sixty,boxFit: BoxFit.cover),
                    Icon(Icons.close,color: Colors.white,size: AppConstants.twentyFour,)
                  ],
                ),
                CommonTextWidget(
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w700,
                  margintop: AppConstants.fourteen,
                  letterSpacing:  1.5,
                  fontSize: AppConstants.twentyFour,
                  text:StringUtils.privacyPolicy,
                ),
                CommonTextWidget(
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400,
                  margintop: AppConstants.twentyFour,

                  fontSize: AppConstants.sixteen,
                  text:StringUtils.desc,
                ),
                CommonTextWidget(
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                  margintop: AppConstants.twenty,

                  fontSize: AppConstants.sixteen,
                  text:StringUtils.desc1,
                ),
                CommonTextWidget(
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400,
                  margintop: AppConstants.ten,

                  fontSize: AppConstants.sixteen,
                  text:StringUtils.desc2,
                ),

              ],
            ),

          ),
        ),
      ),

    );
  }
  
}