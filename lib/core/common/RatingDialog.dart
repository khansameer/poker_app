import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonDialog extends StatefulWidget {
  const CommonDialog({Key? key, this.onTapBtn1,this.onTapBtn2,this.colorBg, this.headerTitle, this.radius,this.isShowButtonView,this.widget,this.btn1Text,this.btn2Text})
      : super(key: key);
  final Color? colorBg;
  final String? headerTitle;
  final double? radius;
  final bool? isShowButtonView;
  final Widget? widget;
  final String? btn1Text;
  final String? btn2Text;
  final VoidCallback? onTapBtn1;
  final VoidCallback? onTapBtn2;



  @override
  CommonDialogState createState() => CommonDialogState();
}

class CommonDialogState extends State<CommonDialog> {

  int _stars = 0;
  Widget ratingWidget(int starCount) {

    return AppUtils.commonInkWell(
      child: Icon(
        Icons.star,
        size: 30.0,
        color: _stars >= starCount ? AppColor.colorButton : Colors.white,
      ),
      onTap: () {
        setState(() {
          _stars = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      elevation: 0,

      backgroundColor: AppColor.colorCommonDialog,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.twelve)),
      //this right here
      title: AppUtils.commonBg(
        radius: AppConstants.twelve,
          width: MediaQuery.of(context).size.width - 60,
          padding1: AppUtils.commonAllEdgeInsets(
              top: AppConstants.fifteen, bottom: AppConstants.fifteen),
          padding: AppConstants.zero,
          colorBorder: AppColor.colorWhiteLight,
          borderWidth: AppConstants.three,
          top: AppConstants.zero,
          left: AppConstants.zero,
          right: AppConstants.zero,
          color: Colors.transparent,
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: AppUtils.commonAllEdgeInsets(
                    left: AppConstants.ten, right: AppConstants.ten),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonTextWidget(
                left:AppConstants.ten,
                      text: widget.headerTitle!.toCapitalize(),
                      fontWeight: FontWeight.w800,
                      fontSize: AppConstants.sixteen,
                    ),
                    AppUtils.commonInkWell(
                      onTap: () {
                        AppUtils.onBack(context);
                      },
                      child: AppUtils.commonIcon(
                        icon: Icons.close,
                        color: AppColor.colorWhite,
                        size: AppConstants.twentyFour,
                      ),
                    )
                  ],
                ),
              ),
              AppUtils.commonSizedBox(height: AppConstants.twenty),
              AppUtils.commonDivider(
                endIndent: AppConstants.zero,
                indent: AppConstants.zero,
              ),
              AppUtils.commonSizedBox(height: AppConstants.twenty),
              // AppUtils.commonSizedBox(height: AppConstants.fifteen),
             widget.widget?? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ratingWidget(1),
                  ratingWidget(2),
                  ratingWidget(3),
                  ratingWidget(4),
                  ratingWidget(5),
                ],
              ),

              widget.isShowButtonView??true ?Column(
                children: [
                  AppUtils.commonSizedBox(height: AppConstants.twenty),
                  AppUtils.commonDivider(
                    endIndent: AppConstants.zero,
                    indent: AppConstants.zero,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [//
                      CommonButtonWidget(
                        onPressed:widget.onTapBtn1?? (){
                          AppUtils.onBack(context);
                        },
                        marginTop: AppConstants.fifteen,

                        bottom: 15,
                        borderWidth: AppConstants.two,
                        colorBorder: AppColor.colorWhiteLight,
                        text: widget.btn1Text?? StringUtils.cancel,
                        colorButton: AppColor.colorFillEditText,
                        paddingOnly:
                            AppUtils.commonAllEdgeInsets(left: AppConstants.thirtyFive, right: AppConstants.thirtyFive),
                      ),
                      CommonButtonWidget(
                        onPressed:widget.onTapBtn2??  (){

                          String appPackageName="com.example.poker";
                          try {
                            launch("market://details?id=" + appPackageName);
                          } on PlatformException catch(e) {
                            launch("https://play.google.com/store/apps/details?id=" + appPackageName);
                          } finally {
                            launch("https://play.google.com/store/apps/details?id=" + appPackageName);
                          }
                        },
                        bottom: 15,
                        left: AppConstants.ten,
                        right: AppConstants.ten,
                        marginTop: AppConstants.fifteen,
                        text: widget.btn2Text?? StringUtils.ok,
                        colorButton: AppColor.colorButton,
                        paddingOnly:
                            AppUtils.commonAllEdgeInsets(left: AppConstants.fifty, right: AppConstants.fifty),
                      ),
                    ],
                  )
                ],
              ):SizedBox.shrink(),
            ],
          )),
    );
  }
}
