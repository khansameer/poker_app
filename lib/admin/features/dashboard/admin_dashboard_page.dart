import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/dashboard/model/dashbord_bean.dart';

class AdminDashboardPage extends StatefulWidget {
  final bool? isAdmin;

  const AdminDashboardPage({super.key, this.isAdmin});

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<AdminDashboardPage> {
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

  void onClickMembers() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.membersPage);
  }

  void onClickCounter() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.adminCounter);
  }

  void onClickAddMember() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.addMemberPage);
  }

  void onClickSetting() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.adminSchedule);
  }

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
        text: StringUtils.accounting,
        imageTrans: icVenueTrans));
    dashboardList.add(
      DashboardBean(
          image: icLiveStrem,
          icon: video,
          text: StringUtils.liveStream,
          imageTrans: icLiveStreamTrans),
    );
  }

  @override
  void initState() {
    super.initState();
    loadVIew();
    print('=====${widget.isAdmin}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //   bottomNavigationBar: bottomNavigationBarWidget(),
      body: Container(
        decoration: AppUtils.dashboard(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(
              left: AppConstants.fourteen, right: AppConstants.fourteen),
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppConstants.sixty,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Image.asset(
                            icLogo,
                            width: AppConstants.oneHundredTwentyTwo,
                            height: AppConstants.eightyFour,
                          )),
                        ],
                      ),
                      adminWelcomeTitle(),
                      gridView(),
                      bottomNavigationBarWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar:bottomNavigationBarWidget(),
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
            fontSize: AppConstants.eighteen,
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
        padding: EdgeInsets.only(top: AppConstants.fifteen, bottom: AppConstants.fifteen),
        margin: EdgeInsets.only(
            top: AppConstants.twenty,
            left: AppConstants.fifteen,
            right: AppConstants.fifteen,
            bottom: AppConstants.twenty),
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorFbLight.withOpacity(1),
            radius: AppConstants.fifteen),
        height: AppConstants.oneHundred,
        // color: AppColor.colorFbLight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            commonBottomNavTabs(
                path: icMembers,
                title: StringUtils.members,
                onTap: onClickMembers),
            commonBottomNavTabs(
                path: icCounter,
                title: StringUtils.counter,
                onTap: onClickCounter),
            commonBottomNavTabs(
                path: icAddMember,
                title: StringUtils.addMember,
                onTap: onClickAddMember),
            commonBottomNavTabs(
                path: icSettings,
                title: StringUtils.settings,
                onTap: () {
                  AppUtils.redirectToNextScreen(
                      context: context, screenName: RouteName.profile);
                }),
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
          Container(
            decoration: AppUtils.containerDecoration(
                radius: AppConstants.thirteen, color: Color.fromRGBO(83, 67, 198, 1)),
            child: AppUtils.commonImageAssetWidget(
                width: AppConstants.forty,
                boxFit: BoxFit.scaleDown,
                height: AppConstants.forty,
                path: path),
          ),
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
                    context: context, screenName: RouteName.adminSchedule);
              }
              if (index == 1) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.event);
              }
              if (index == 2) {
                AppUtils.redirectToNextScreen(
                    context: context,
                    screenName: RouteName.adminCreditFilePage);
              }
              if (index == 3) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.chatRoom);
              }
              if (index == 4) {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.adminAccounting);
              }
              if (index == 5) {
                AppUtils.redirectToNextScreen(
                    context: context,
                    screenName: RouteName.liveStream,
                    arguments: true);
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
