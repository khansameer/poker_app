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
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppConstants.fifteen),
                  bottomRight: Radius.circular(AppConstants.fifteen),
                  topLeft: Radius.circular(AppConstants.fifteen))),
          /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.eight)),*/
          // color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(
              horizontal: AppConstants.fifteen, vertical: AppConstants.five),
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: AppConstants.ten,
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
                        text: 'John Doe',
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.colorBlue,
                        fontSize: AppConstants.twelve,
                      ),
                      CommonTextWidget(
                        textAlign: TextAlign.left,
                        text: message,
                        textColor: AppColor.colorBlue,
                        fontSize: AppConstants.twelve,
                      ),
                    ],
                  )),
              Positioned(
                  bottom: AppConstants.four,
                  right: AppConstants.five,
                  child: CommonTextWidget(
                    text: time,
                    fontSize: AppConstants.ten,
                    textColor: AppColor.colorBlackLight,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
