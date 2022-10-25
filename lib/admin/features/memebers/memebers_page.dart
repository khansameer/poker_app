import 'package:flutter/material.dart';
import 'package:poker/admin/features/memebers/admin_debit_page.dart';
import 'package:poker/core/common/ToggleButton.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/login/login_page.dart';
import 'package:poker/features/signup/signup_page.dart';
import 'package:poker/features/whaton/schedulebean.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> with SingleTickerProviderStateMixin {

  TabController? _tabController;
  List<ScheduleBean> listCredit = [];
  int selectedIndex=0;
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
      text: "2,500",));
    listCredit.add(ScheduleBean(
      text: "1,500",));
    listCredit.add(ScheduleBean(
      text: "2,000",));
    listCredit.add(ScheduleBean(
      text: "500",));
    listCredit.add(ScheduleBean(
      text: "541",));
  }
  loadDebit() {
    listDebit.add(ScheduleBean(
      text: "-500",));
    listDebit.add(ScheduleBean(
      text: "-500",));
    listDebit.add(ScheduleBean(
      text: "-500",));
    listDebit.add(ScheduleBean(
      text: "-500",));
    listDebit.add(ScheduleBean(
      text: "-500",));
  }
  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CommonBgPage(
        backImagePath: icDashboardBg,
        margin: 0,
        alignment: Alignment.topCenter,
        imagePath: icDashboardimg,
        widget: Scaffold(
          backgroundColor:Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: AppUtils.commonAppBar(
              context: context,
              fontSize: AppConstants.sixteen,
              title: StringUtils.newMemberDetails,
              isShowEdit: false,
              actionTitle: StringUtils.edit),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(

                children: [
                  Container(
                    child: _gridView()
                  ),
                  Container(
                    height:MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 20,right: 20,top:50 ),
                  /*  decoration: AppUtils.containerDecoration(
                        color: AppColor.colorDarkBlue, radius: 0),*/
                    child:  Container(
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
                                      12.0,
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
                                          top: 5,
                                          bottom: 5,
                                          right: AppConstants.five),
                                      controller: _tabController,
                                      // give the indicator a decoration (color and border radius)
                                      indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                        color: AppColor.colorButton,
                                      ),
                                      unselectedLabelStyle: AppUtils.textStyle(fontSize: 14,fontWeight: FontWeight.w700) ,
                                      labelStyle: AppUtils.textStyle(fontSize: 14,fontWeight: FontWeight.w700),
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
                                SizedBox(height: 30,),
                                Expanded(
                                  flex: 1,
                                  child: TabBarView(
                                    controller:_tabController ,
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
                    )
                  ),
                ],
              ),
            ),
          ),
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
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            CommonTextWidget(
              text: title1,
              fontSize: 11,
            ),
            AppUtils.commonSizedBox(width: AppConstants.thirty),
            CommonTextWidget(
              text: title2,
              fontSize: 11,
            )
          ],
        ),
      ),
    );
  }
  Widget _gridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 8.0 / 9.0,
      children: [
        FlutterLogo(),
        FlutterLogo()
      ]
    );
  }
}
