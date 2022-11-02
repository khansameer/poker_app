import 'package:flutter/material.dart';
import 'package:poker/admin/features/memebers/admin_debit_page.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<ScheduleBean> listCredit = [];
  int selectedIndex = 0;
  List<ScheduleBean> listDebit = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    loadCredit();
    loadDebit();
    super.initState();
  }

  loadCredit() {
    listCredit.add(ScheduleBean(
      text: "2,500",
    ));
    listCredit.add(ScheduleBean(
      text: "1,500",
    ));
    listCredit.add(ScheduleBean(
      text: "2,000",
    ));
    listCredit.add(ScheduleBean(
      text: "500",
    ));
    listCredit.add(ScheduleBean(
      text: "541",
    ));
  }

  loadDebit() {
    listDebit.add(ScheduleBean(
      text: "-500",
    ));
    listDebit.add(ScheduleBean(
      text: "-500",
    ));
    listDebit.add(ScheduleBean(
      text: "-500",
    ));
    listDebit.add(ScheduleBean(
      text: "-500",
    ));
    listDebit.add(ScheduleBean(
      text: "-500",
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBgPage(
      backImagePath: icDashboardBg,
      margin: AppConstants.zero,
      alignment: Alignment.topCenter,
      imagePath: icDashboardimg,
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppUtils.commonAppBar(
            context: context,
            fontSize: AppConstants.sixteen,
            title: StringUtils.members,
            isShowEdit: false,
            actionTitle: StringUtils.edit),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: AppConstants.eight,
                            right: AppConstants.zero,
                            top: AppConstants.twenty),
                        child: _gridView()),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.only(
                            left: AppConstants.twenty,
                            right: AppConstants.twenty,
                            top: AppConstants.forty),
                        /*  decoration: AppUtils.containerDecoration(
                          color: AppColor.colorDarkBlue, radius: 0),*/
                        child: Container(
                          //margin: EdgeInsets.only(top: 40),

                          child: Container(
                            child: DefaultTabController(
                              length: 2,
                              initialIndex: 0,
                              child: Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.colorFillEditText,
                                        borderRadius: BorderRadius.circular(
                                          AppConstants.twelve,
                                        ),
                                      ),
                                      child: Container(
                                        width: 300,
                                        // margin: EdgeInsets.all(3),
                                        child: TabBar(
                                          onTap: (int index) {
                                            selectedIndex = index;
                                          },
                                          padding: EdgeInsets.only(
                                              left: AppConstants.five,
                                              top: AppConstants.five,
                                              bottom: AppConstants.five,
                                              right: AppConstants.five),
                                          controller: _tabController,
                                          // give the indicator a decoration (color and border radius)
                                          indicator: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              AppConstants.twelve,
                                            ),
                                            color: AppColor.colorButton,
                                          ),
                                          unselectedLabelStyle:
                                              AppUtils.textStyle(
                                                  fontSize: AppConstants.twelve,
                                                  fontWeight: FontWeight.w700),
                                          labelStyle: AppUtils.textStyle(
                                              fontSize: AppConstants.twelve,
                                              fontWeight: FontWeight.w700),
                                          labelColor: Colors.white,
                                          unselectedLabelColor: Colors.white,

                                          tabs: [
                                            // first tab [you can add an icon using the icon property]
                                            Tab(
                                              text: 'Debit List',
                                            ),

                                            // second tab [you can add an icon using the icon property]
                                            Tab(
                                              text: 'Credit List',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppConstants.thirty,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TabBarView(
                                        controller: _tabController,
                                        children: [
                                          AdminDebitPage(listDebit),
                                          AdminDebitPage(listCredit),
                                          //BankDetailsPage(),
                                          //TransactionHistoryPage(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // margin: EdgeInsets.only(left: AppConstants.sixteen,right: AppConstants.sixteen),
                height: AppConstants.eighty,
                alignment: Alignment.topCenter,
                color: AppColor.colorToolBar,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CommonTextWidget(
                      text: '-65,541',
                      fontWeight: FontWeight.w700,
                      fontSize: AppConstants.eighteen,
                    ),
                    CommonTextWidget(
                      text: 'Total Debit',
                      textColor: AppColor.colorWhite1,
                      margintop: AppConstants.five,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget commonRow(String title1, String title2) {
    return Container(
      decoration: AppUtils.containerDecoration(
          radius: AppConstants.eight,
          color: AppColor.colorWhiteLight,
          borderWidth: AppConstants.zero),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.eight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            CommonTextWidget(
              text: title1,
              fontSize: AppConstants.eleven,
            ),
            AppUtils.commonSizedBox(width: AppConstants.thirty),
            CommonTextWidget(
              text: title2,
              fontSize: AppConstants.eleven,
            )
          ],
        ),
      ),
    );
  }

  Widget _gridView() {
    return GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: AppConstants.ten,
        crossAxisCount: AppConstants.two.toInt(),
        mainAxisSpacing: AppConstants.five,
        padding: EdgeInsets.all(AppConstants.four),
        childAspectRatio: AppConstants.nine / AppConstants.nine,
        children: [
          AppUtils.commonBg(
              radius: AppConstants.sixteen,
              left: AppConstants.zero,
              borderWidth: AppConstants.two,
              colorBorder: AppColor.colorWhiteLight,
              right: AppConstants.zero,
              bottom: AppConstants.zero,
              color: AppColor.colorBlueClub,
              top: AppConstants.zero,
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  commonList(text: 'Total Credit', price: '-65,541'),
                  commonList(text: 'Total Debit', price: '6,541'),
                  commonList(text: 'Total Owed', price: '-58,781'),
                ],
              )),
          AppUtils.commonBg(
              left: AppConstants.zero,
              right: AppConstants.zero,
              bottom: AppConstants.zero,
              radius: AppConstants.sixteen,
              borderWidth: AppConstants.two,
              colorBorder: AppColor.colorWhiteLight,
              color: AppColor.colorBlueClub,
              top: AppConstants.zero,
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  commonList(text: 'Host 1', price: '9,752'),
                  commonList(text: 'Host 2', price: '3,390'),
                  // /commonList(text: 'Total Owed',price: '-58,781'),
                ],
              )),
        ]);
  }

  Widget commonList({String? text, String? price}) {
    return AppUtils.commonBg(
      left: AppConstants.zero,
      right: AppConstants.zero,
      padding: AppConstants.ten,
      bottom: AppConstants.zero,
      color: AppColor.colorUnderList,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonTextWidget(
              text: text,
              fontWeight: FontWeight.w600,
              fontSize: AppConstants.twelve),
          CommonTextWidget(
            text: price,
            fontWeight: FontWeight.w600,
            fontSize: AppConstants.twelve,
          ),
        ],
      ),
    );
  }
}
