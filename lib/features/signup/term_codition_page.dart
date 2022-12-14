import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class TermCoditionPage extends StatefulWidget{
  final String? title;
  const TermCoditionPage( {super.key, this.title});

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
        child: SingleChildScrollView(
          child: Column(


            children: [
              Container(
                margin: EdgeInsets.only(left: AppConstants.twentyFour,right: AppConstants.twentyFour,bottom: AppConstants.sixteen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppConstants.thirtyFive,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppUtils.commonImageAssetWidget(path: icLogo,height: AppConstants.sixty,boxFit: BoxFit.cover),
                        InkWell(
                          onTap: (){
                            AppUtils.onBack(context);
                          },
                          child: Icon(
                            Icons.close,color: Colors.white,size: AppConstants.twentyFour,),
                        )
                      ],
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w700,
                      margintop: AppConstants.fourteen,
                      letterSpacing:  1.5,
                      fontSize: AppConstants.twenty+2,
                      /*text:StringUtils.privacyPolicy,*/
                      text: widget.title,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      margintop: AppConstants.twentyFour,

                      fontSize: AppConstants.fourteen,
                      text:StringUtils.desc,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                      margintop: AppConstants.twentyFour,

                      fontSize: AppConstants.fourteen,
                      text:StringUtils.desc1,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      margintop: AppConstants.twentyFour,
                      letterSpacing: 0.5,

                      fontSize: AppConstants.fourteen,
                      text:StringUtils.desc2,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                      margintop: AppConstants.twentyFour,

                      fontSize: AppConstants.fourteen,
                      text:StringUtils.desc1,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      margintop: AppConstants.twentyFour,
                      letterSpacing: 0.5,

                      fontSize: AppConstants.fourteen,
                      text:StringUtils.desc2,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                      margintop: AppConstants.twentyFour,

                      fontSize: AppConstants.fourteen,
                      text:StringUtils.desc1,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      margintop: AppConstants.twentyFour,
                      letterSpacing: 0.5,

                      fontSize: AppConstants.fourteen,
                      text:StringUtils.desc2,
                    ),
                  ],
                ),
              ),


            ],
          ),

        ),
      ),

    );
  }
  
}