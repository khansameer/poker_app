
import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';

class CustomChatPicker extends StatefulWidget {
  const CustomChatPicker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CommonChatPickerState();
  }
}

class CommonChatPickerState extends State<CustomChatPicker> {
  @override
  Widget build(BuildContext context) {
    return AppUtils.commonSizedBox(
      height: AppConstants.twoHundredFiftyFive,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(AppConstants.eighteen),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.twelve)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.ten,
              vertical: AppConstants.twenty),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.indigo,
                      "document"),
                  AppUtils.commonSizedBox(width: AppConstants.forty),
                  iconCreation(
                      Icons.camera_alt, Colors.pink, 'camera'),
                  AppUtils.commonSizedBox(width: AppConstants.forty),
                  iconCreation(
                      Icons.insert_photo, Colors.purple, 'gallery'),
                ],
              ),
              AppUtils.commonSizedBox(height: AppConstants.ten),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.headset, Colors.orange, 'audio'),
                  AppUtils.commonSizedBox(height: AppConstants.forty),
                  iconCreation(
                      Icons.location_pin, Colors.teal, 'location'),
                  AppUtils.commonSizedBox(height: AppConstants.forty),
                  iconCreation(Icons.person, Colors.blue, 'contact'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: AppConstants.thirty,
            backgroundColor: color,
            child: Icon(
              icons,
              size: AppConstants.twentyFour,
              color: Colors.white,
            ),
          ),
          AppUtils.commonSizedBox(width: AppConstants.fourteen),
          CommonTextWidget(
            text: text,

            fontSize: AppConstants.fourteen,
            margintop: AppConstants.zero,
            textColor: AppColor.colorToolBar,
          )
        ],
      ),
    );
  }
}
