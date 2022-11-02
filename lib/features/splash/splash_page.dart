import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/services/network_repository.dart';
import 'package:poker/core/utils/AppConstants.dart';
import 'package:poker/core/utils/PreferenceHelper.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/features/login/model/login_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    gotoLogin();
  }

  gotoLogin() async {
    Timer(const Duration(seconds: 3), () {
      if (PreferenceHelper.getBool(PreferenceHelper.IS_LOGIN) == true) {
        getUserDataFromPref();
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteName.login, (route) => false);
      }
    });
  }
  getUserDataFromPref() async {
    LoginModel? loginModel = await getUserData();
    if (loginModel?.success==true){
      userInfo = loginModel?.data;
     AppUtils.redirectToNextScreen(context: context,screenName: RouteName.adminDashboard,arguments: false);
      /* Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.dashboard, (route) => false);*/
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.login, (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBgPage(
        imagePath: icBackground,
        widget: AppUtils.commonSizedBox(
          width: AppConstants.twoHundred,
          height: AppConstants.twoHundred,
          child: Center(
            child: AppUtils.commonImageAssetWidget(path: icLogo),
          ),
        ),
      ),
    );
  }

}
