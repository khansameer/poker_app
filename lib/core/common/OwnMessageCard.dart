import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';

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
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppConstants.fifteen),
                  bottomLeft: Radius.circular(AppConstants.fifteen),
                  bottomRight: Radius.circular(AppConstants.zero),
                  topLeft: Radius.circular(AppConstants.fifteen))),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.eight)),
          color: AppColor.colorButton,
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
                  child: CommonTextWidget(
                    text: message,
                    textColor: AppColor.colorWhite,
                  )),
              Positioned(
                bottom: AppConstants.four,
                right: AppConstants.two,
                child: Row(
                  children: [
                    Text(
                      time!,
                      style: TextStyle(
                        fontSize: AppConstants.twelve,
                        color: AppColor.colorWhite,
                      ),
                    ),
                    SizedBox(
                      width: AppConstants.five,
                    ), /*Icon(
                      Icons.done_all,
                      size: AppConstants.twenty,
                    ),*/
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
