import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {

    return SplashPageState();
  }
  
}
class SplashPageState extends State<SplashPage>{
  @override
  initState() {
    super.initState();

    gotoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBgPage(
        imagePath: icBackground,
        widget: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: AppUtils.commonImageAssetWidget(path: icLogo),
          ),
        ),
      ),
    );
  }
  gotoLogin() async {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.login, (route) => false);
    });
  }

}