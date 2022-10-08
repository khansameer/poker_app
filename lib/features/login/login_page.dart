import 'package:flutter/material.dart';
import 'package:poker/common/common_bg_page.dart';
import 'package:poker/common/common_textfiled.dart';
import 'package:poker/utils/app_color.dart';
import 'package:poker/utils/app_constants.dart';
import 'package:poker/utils/string_utils.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {

    return LoginPageState();
  }
  
}
class LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CommonBgPage(
              imagePath: "",
              widget: Container(
                margin: EdgeInsets.only(top: 56),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    CommonTextField(
                        hint: StringUtils.email_hint,
                        iconWidget: const Icon(Icons.email,color: AppColor.colorWhite,),
                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.ten),

                    CommonTextField(
                        hint: StringUtils.email_hint,
                        iconWidget: const Icon(Icons.email,color: AppColor.colorWhite,),
                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.ten),
                  ],
                ),
              )),
        ],
      ),
    );
  }
  
}