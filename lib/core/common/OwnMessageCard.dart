import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key, this.message, this.time}) : super(key: key);
  final String? message;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - AppConstants.fortyFive,
        ),
        child: Container(
              padding: EdgeInsets.only(left: AppConstants.ten,right: AppConstants.ten),
            decoration: BoxDecoration(
              color: AppColor.colorButton,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppConstants.fifteen),
                bottomLeft: Radius.circular(AppConstants.fifteen),
                bottomRight: Radius.circular(AppConstants.zero),
                  topLeft: Radius.circular(AppConstants.fifteen)
              )
            ),


          margin: EdgeInsets.symmetric(
              horizontal: AppConstants.fifteen, vertical: AppConstants.five),
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: AppConstants.ten,
                    right: AppConstants.twentyFour,
                    top: AppConstants.five,
                    bottom: AppConstants.twenty,
                  ),
                  child: CommonTextWidget(
                    text: message,
                    textAlign: TextAlign.left,
                    fontSize: AppConstants.fourteen,
                    textColor: AppColor.colorWhite,
                  )),
              Positioned(
                bottom: AppConstants.four,
                right: AppConstants.two,
                child: CommonTextWidget(
                  text: time,
                  fontSize: AppConstants.ten,
                  textColor: AppColor.colorWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
