import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/dashboard/model/dashbord_bean.dart';

class DashboardPage extends StatefulWidget {
  final bool? isAdmin;

  const DashboardPage({super.key, this.isAdmin});

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  List<DashboardBean> dashboardList = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void onClickProfile() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.profile);
  }

  void onClickReservations() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.reservations);
  }

  void onClickClubBalance() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.clubBalance);
  }

  void onClickEvent() {}

  loadVIew() {
    dashboardList.add(DashboardBean(
        image: icWhatOn,
        icon: event,
        text: StringUtils.whatOn,
        imageTrans: icWhatOnTrans));
    dashboardList.add(DashboardBean(
        image: icEventBg,
        icon: celebration,
        text: StringUtils.event,
        imageTrans: icEventTrans));
    dashboardList.add(DashboardBean(
        image: icCredit,
        icon: difference,
        text: StringUtils.creditFile,
        imageTrans: icCreditTrans));
    dashboardList.add(DashboardBean(
        image: icChatRoom,
        icon: chat,
        text: StringUtils.chatRoom,
        imageTrans: icChatTrans));
    dashboardList.add(DashboardBean(
        image: icVenue,
        icon: venue,
        text: StringUtils.venueInfo,
        imageTrans: icVenueTrans));
    dashboardList.add(DashboardBean(
        image: icLiveStrem,
        icon: video,
        text: StringUtils.liveStream,
        imageTrans: icLiveStreamTrans));
  }

  @override
  void initState() {
    super.initState();
    loadVIew();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      drawer: widget.isAdmin ?? false
          ? Drawer(
              elevation: AppConstants.zero,
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
                              width: AppConstants.seventySeven,
                              height: AppConstants.fiftyThree,
                            )),
                            IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState!.closeDrawer();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: AppColor.colorWhite,
                                  size: AppConstants.twentyFour,
                                )),
                          ],
                        )),
                        AppUtils.commonDivider(
                            indent: AppConstants.zero,
                            endIndent: AppConstants.zero,
                            color: AppColor.colorWhiteLight),
                        SizedBox(
                          height: AppConstants.sixteen,
                        ),
                        AppUtils.commonMenuItem(
                            text: StringUtils.profile, onTap: onClickProfile),
                        AppUtils.commonDivider(color: AppColor.colorWhiteLight),
                        SizedBox(
                          height: AppConstants.sixteen,
                        ),
                        AppUtils.commonMenuItem(
                            text: StringUtils.reservations,
                            imagePath: icReservations,
                            onTap: onClickReservations),
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
                            text: StringUtils.followUs,
                            left: AppConstants.twentyFour,
                            textColor: AppColor.colorWhite1,
                            fontSize: AppConstants.sixteen,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: AppConstants.sixteen,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: AppConstants.twentyFour),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                commonTopView(
                                  width: AppConstants.seventy,
                                  height: AppConstants.seventy,
                                  widget: AppUtils.commonImageSVGWidget(
                                      boxFit: BoxFit.scaleDown,
                                      path: icFb,
                                      width: AppConstants.thirty,
                                      height: AppConstants.thirty),
                                ),
                                SizedBox(
                                  width: AppConstants.twenty,
                                ),
                                commonTopView(
                                    width: AppConstants.seventy,
                                    height: AppConstants.seventy,
                                    widget: AppUtils.commonImageAssetWidget(
                                        path: icInstagram,
                                        boxFit: BoxFit.scaleDown,
                                        width: AppConstants.thirty,
                                        height: AppConstants.thirty))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.thirty,
                          ),
                          AppUtils.commonDivider(
                              color: AppColor.colorWhiteLight,
                              endIndent: AppConstants.zero,
                              indent: AppConstants.zero),
                          AppUtils.commonMenuItem(
                              text: StringUtils.rateUs, imagePath: icStar),
                          AppUtils.commonDivider(
                              color: AppColor.colorWhiteLight),
                          AppUtils.commonMenuItem(
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    RouteName.login, (route) => false);
                              },
                              text: StringUtils.logout,
                              imagePath: icLogout,
                              textColor: AppColor.colorLogout),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : null,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.isAdmin ?? false
                        ? const SizedBox.shrink()
                        : commonTopView(onTap: () {
                            if (_scaffoldKey.currentState!.isDrawerOpen) {
                              _scaffoldKey.currentState!.openEndDrawer();
                            } else {
                              _scaffoldKey.currentState!.openDrawer();
                            }
                          }),
                    Expanded(
                        child: Image.asset(
                      icLogo,
                      width: AppConstants.seventySeven,
                      height: AppConstants.fiftyThree,
                    )),
                  ],
                ),
                widget.isAdmin ?? false
                    ? adminWelcomeTitle()
                    : AppUtils.commonCoinView(onTap: onClickClubBalance),
                gridView(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          widget.isAdmin ?? false ? bottomNavigationBarWidget() : null,
    );
  }

  Widget adminWelcomeTitle() {
    return Container(
      margin:
          EdgeInsets.only(top: AppConstants.twenty, bottom: AppConstants.ten),
      child: Column(
        children: [
          CommonTextWidget(
            text: StringUtils.hiMartin,
            fontSize: AppConstants.sixteen,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: AppConstants.ten),
          CommonTextWidget(
              text: StringUtils.welToPokerRoom,
              fontSize: AppConstants.twenty,
              fontWeight: FontWeight.w700,
              letterSpacing: AppConstants.one),
        ],
      ),
    );
  }

  Widget bottomNavigationBarWidget() {
    return Container(
        margin: EdgeInsets.only(
            left: AppConstants.fifteen,
            right: AppConstants.fifteen,
            bottom: AppConstants.twenty),
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorFbLight, radius: AppConstants.fifteen),
        height: 85,
        // color: AppColor.colorFbLight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            commonBottomNavTabs(
                path: icMembers, title: StringUtils.members, onTap: () {}),
            commonBottomNavTabs(
                path: icCounter, title: StringUtils.counter, onTap: () {}),
            commonBottomNavTabs(
                path: icAddMember, title: StringUtils.addMember, onTap: () {}),
            commonBottomNavTabs(
                path: icSettings, title: StringUtils.settings, onTap: () {}),
          ],
        ));
  }

  Widget commonBottomNavTabs(
      {String? path, String? title, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppUtils.commonImageAssetWidget(
              width: AppConstants.thirty,
              height: AppConstants.thirty,
              path: path),
          SizedBox(height: AppConstants.five),
          CommonTextWidget(
              text: title,
              fontSize: AppConstants.twelve,
              fontWeight: FontWeight.w700),
        ],
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
          radius: radius ?? AppConstants.twelve),
      child: InkWell(
        onTap: onTap,
        child: widget ??
            Center(
              child: Icon(
                Icons.menu,
                color: AppColor.colorButton,
                size: AppConstants.twenty,
              ),
            ),
      ),
    );
  }

  Widget commonLoadSvg({double? width, double? height, String? path}) {
    return AppUtils.commonImageSVGWidget(
      path: path ?? event,
      width: width ?? AppConstants.eighteen,
      height: height ?? AppConstants.eighteen,
    );
  }

  Widget gridView() {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: dashboardList.length,
        padding: EdgeInsets.all(AppConstants.five),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppConstants.two.toInt(),
            crossAxisSpacing: AppConstants.ten,
            mainAxisSpacing: AppConstants.one),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.whatOn);
              }
              if (index == 1) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.event);
              }
              if (index == 2) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.clubBalance);
              }
              if (index == 3) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.chatRoom);
              }
              if (index == 4) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.venueInfo);
              }
              if (index == 5) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.liveStream);
              }
            },
            child: AppUtils.commonGridView(
                imageTrans: dashboardList[index].imageTrans,
                imagePath: dashboardList[index].image,
                text: dashboardList[index].text,
                widget: commonLoadSvg(path: dashboardList[index].icon)),
          );
        });
  }
}
