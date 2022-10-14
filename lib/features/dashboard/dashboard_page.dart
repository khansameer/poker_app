import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'dart:math' as math;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    void onClickProfile(){
      AppUtils.redirectToNextScreen(context: context,screenName: RouteName.profile);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: AppUtils.containerDecorationBg(image: icMenuBg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                      child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Image.asset(
                        icLogo,
                        width: 77,
                        height: 53,
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            color: AppColor.colorWhite,
                            size: 24,
                          )),
                    ],
                  )),
                  AppUtils.commonDivider(
                      indent: AppConstants.zero,
                      endIndent: AppConstants.zero,
                      color: AppColor.colorWhite1),
                  AppUtils.commonMenuItem(text: StringUtils.profile,onTap: onClickProfile),
                  AppUtils.commonDivider(color: AppColor.colorWhite1),
                  AppUtils.commonMenuItem(text:StringUtils.profile,imagePath: icReservations),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextWidget(
                      textAlign: TextAlign.center,
                      text:StringUtils.followUs,
                      left: 24,
                      textColor: AppColor.colorWhite1,
                      fontSize: AppConstants.sixteen,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: AppConstants.sixteen,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          commonTopView(
                            width: 70,
                            height: 70,
                            widget: AppUtils.commonImageAssetWidget1(
                              boxFit: BoxFit.scaleDown,
                                path: icFb,
                                width: AppConstants.thirty,
                                height: AppConstants.thirty),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          commonTopView(
                              width: 70,
                              height: 70,
                              widget: AppUtils.commonImageAssetWidget1(
                                  path: icInsta,

                                  boxFit: BoxFit.scaleDown,
                                  width: AppConstants.thirty,
                                  height: AppConstants.thirty))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    AppUtils.commonDivider(
                        color: AppColor.colorWhite1,
                        endIndent: AppConstants.zero,
                        indent: AppConstants.zero),
                    AppUtils.commonMenuItem(text: "Rate us on the app store",imagePath: icStar),
                    AppUtils.commonDivider(color: AppColor.colorWhite1),
                    AppUtils.commonMenuItem(text: "Log Out",imagePath: icLogout,textColor: AppColor.colorLogout),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: AppUtils.dashboard(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(
              left: AppConstants.fourteen, right: AppConstants.fourteen),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppConstants.sixty,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonTopView(onTap: () {
                      if (_scaffoldKey.currentState!.isDrawerOpen) {
                        _scaffoldKey.currentState!.openEndDrawer();
                      } else {
                        _scaffoldKey.currentState!.openDrawer();
                      }
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppUtils.commonImageAssetWidget(
                            alignment: Alignment.center,
                            path: icLogo,
                            width: 77,
                            height: 53),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 40),
                  height: 130,
                  // padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                          image: AssetImage(icImge), fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.colorFbLight,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: AppColor.colorWhiteLight, width: 5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidget(
                          left: AppConstants.sixteen,
                          text: "👋 Hi, John",
                          fontWeight: FontWeight.w800,
                          fontSize: AppConstants.eighteen,
                        ),
                        commonBg(
                            widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonTextWidget(
                              text: "Current Credit",
                              textColor: AppColor.colorWhite,
                              fontWeight: FontWeight.w600,
                            ),
                            CommonTextWidget(
                              text: "500",
                              left: AppConstants.five,
                              textColor: AppColor.colorWhite,
                              fontWeight: FontWeight.w700,
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonGridView(
                        imagePath: icGrid,
                        text: StringUtils.whatOn,
                        widget: Image.asset(
                          icGoogle,
                          width: 20,
                          height: 20,
                        )),
                    commonGridView(
                        imagePath: icEventBg,
                        text: StringUtils.events,
                        colorBg: AppColor.colorBlueLight1,
                        widget: Image.asset(
                          icGoogle,
                          width: 20,
                          height: 20,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonGridView(
                        text: StringUtils.creditFile,
                        widget: Image.asset(
                          icGoogle,
                          width: 20,
                          height: 20,
                        )),
                    commonGridView(
                        text: StringUtils.chatRoom,
                        widget: Image.asset(
                          icGoogle,
                          width: 20,
                          height: 20,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonGridView(
                        text: StringUtils.venueInfo,
                        widget: Image.asset(
                          icGoogle,
                          width: 20,
                          height: 20,
                        )),
                    commonGridView(
                        text: StringUtils.liveStream,
                        widget: Image.asset(
                          icGoogle,
                          width: 20,
                          height: 20,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonTopView(
      {Widget? widget,
      VoidCallback? onTap,
      double? width,
      double? height,
      Color? color,
      double? radius}) {
    return Container(
      width: width ?? 55,
      height: height ?? 55,
      decoration: AppUtils.containerDecoration(
          color: color ?? AppColor.colorBlue,
          radius: radius ??
              AppConstants
                  .twelve) /*BoxDecoration(
          border: Border.all(color: AppColor.colorWhiteLight, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: AppColor.colorBlue)*/
      ,
      child: InkWell(
        onTap: onTap,
        child: widget ??
            Center(
              child: Icon(
                Icons.menu,
                color: AppColor.colorButton,
              ),
            ),
      ),
    );
  }

  Widget commonBg({
    Widget? widget,
    Color? color,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 10),
      padding: const EdgeInsets.all(10),
      decoration: AppUtils.containerDecoration(
          radius: 8, color: color ?? AppColor.colorWhiteLight),
      child: widget,
    );
  }

  Widget commonGridView(
      {String? text, Widget? widget, String? imagePath, Color? colorBg,String}) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 10),
      width: 178,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(imagePath ?? icGrid), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.1, 0.5, 0.8, 0.9],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColor.colorBlueLight1,
                  AppColor.colorBlueLight1,
                  AppColor.colorWt,
                  AppColor.colorWt
                ]),
            color: colorBg ?? AppColor.colorRedLight,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.colorWhiteLight, width: 3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonBg(color: Color.fromRGBO(0, 0, 0, 0.32), widget: widget),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                commonBg(
                    color: Color.fromRGBO(0, 0, 0, 0.32),
                    widget: CommonTextWidget(
                      text: text,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    )),
                commonBg(
                    color: Color.fromRGBO(0, 0, 0, 0.32),
                    widget: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColor.colorWhite,
                      size: 15,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }


}
