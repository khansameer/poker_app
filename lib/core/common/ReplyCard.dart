import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key, this.message, this.time}) : super(key: key);
  final String? message;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - AppConstants.fortyFive,
        ),
        child: Container(
         // elevation: 1,
          padding: EdgeInsets.only(left: AppConstants.ten,right: AppConstants.ten),
          decoration: BoxDecoration(
              color: AppColor.colorWhite,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppConstants.fifteen),
                  bottomRight: Radius.circular(AppConstants.fifteen),

                  topLeft: Radius.circular(AppConstants.fifteen)
              )
          ),
     /*     shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppConstants.fifteen),
                  bottomRight: Radius.circular(AppConstants.fifteen),
                  topLeft: Radius.circular(AppConstants.fifteen))),*/
          /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.eight)),*/
          // color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(
              horizontal: AppConstants.fifteen, vertical: AppConstants.five),
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: AppConstants.fourteen,
                    right: AppConstants.thirty,
                    top: AppConstants.five,
                    bottom: AppConstants.twenty,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget(
                        textAlign: TextAlign.left,
                        text: 'Jolly Cooper',

                        fontWeight: FontWeight.w700,
                        textColor: AppColor.colorBlue,
                        fontSize: AppConstants.fourteen,
                      ),
                      CommonTextWidget(
                        textAlign: TextAlign.left,
                        text: message,
                        margintop: AppConstants.four,
                        textColor: AppColor.colorBlue,
                        fontSize: AppConstants.fourteen,
                      ),
                    ],
                  )),
              Positioned(
                  bottom: AppConstants.four,
                  right:0,
                  child: CommonTextWidget(
                    text: time,
                    fontSize: AppConstants.twelve,
                    textColor: AppColor.colorBlackLight,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
