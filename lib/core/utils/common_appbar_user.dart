
import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';

//ignore: must_be_immutable
class CommonAppBarUser extends StatelessWidget {
  String? _txtName;
  String? _userIcon;

  CommonAppBarUser({String? txtName, String? userIcon, Key? key})
      : super(key: key) {
    _txtName = txtName;
    _userIcon = userIcon!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.sixtyFive,
      color: AppColor.colorWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.colorWhite,
              size: AppConstants.twenty,
            ),
          ),
          CommonTextWidget(text: _txtName??"Sameer",)
        //  AppUtils.commonSizedBox(boxWidth: AppConstants.width10),
        /*  CircleAvatar(
            backgroundImage: AssetImage(_userIcon!),
            radius: AppConstants.radius24,
          ),
          AppUtils.commonSizedBox(boxWidth: AppConstants.width15),
        */  /*Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppUtils.commonTextWidget(
                    text: _txtName.toString().toCapitalize(),
                    textColor: AppColors.colorDarkText,
                    fontSize: AppConstants.sp14,
                    fontWeight: AppConstants.fontWeight500,
                    top: AppConstants.height0),
                AppUtils.commonSizedBox(boxWidth: AppConstants.width2),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
