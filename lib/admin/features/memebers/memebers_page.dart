import 'package:flutter/material.dart';
import 'package:poker/admin/features/memebers/admin_debit_page.dart';
import 'package:poker/core/common/ToggleButton.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
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
    return CommonBgPage(
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
                      margin: EdgeInsets.only(left: 8,right: 8,top: 20),
                      child: _gridView()
                    ),
                    Container(
                      height:MediaQuery.of(context).size.height,
                      margin: EdgeInsets.only(left: 20,right: 20,top:40 ),
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
                                        unselectedLabelStyle: AppUtils.textStyle(fontSize: 12,fontWeight: FontWeight.w700) ,
                                        labelStyle: AppUtils.textStyle(fontSize: 12,fontWeight: FontWeight.w700),
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
                    CommonTextWidget(text: '-65,541',fontWeight: FontWeight.w700,fontSize: AppConstants.eighteen, ),
                    CommonTextWidget(text: 'Total Debit',textColor: AppColor.colorWhite1,margintop: 5,)
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
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      mainAxisSpacing: 5,

      padding: EdgeInsets.all(4.0),
      childAspectRatio: 9.0 / 9.0,
      children: [
        AppUtils.commonBg(
          radius: 16,
          left: 0,
            borderWidth: 2,
            colorBorder: AppColor.colorWhiteLight,
          right: 0,
          bottom: 0,
          color: AppColor.colorBlueClub,
          top: 0,
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              commonList(text: 'Total Credit',price: '-65,541'),
              commonList(text: 'Total Debit',price: '6,541'),
              commonList(text: 'Total Owed',price: '-58,781'),
            ],
          )
        ),
        AppUtils.commonBg(
            left: 0,
            right: 0,
            bottom: 0,
            radius: 16,
            borderWidth: 2,
            colorBorder: AppColor.colorWhiteLight,
            color: AppColor.colorBlueClub,
            top: 0,
            widget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                commonList(text: 'Host 1',price: '9,752'),
                commonList(text: 'Host 2',price: '3,390'),
                // /commonList(text: 'Total Owed',price: '-58,781'),
              ],
            )
        ),
      ]
    );
  }

  Widget commonList({String? text,String? price}){
    return AppUtils.commonBg(
      left: 0,
      right: 0,
      padding: 10,
      bottom: 0,
      color: AppColor.colorUnderList,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonTextWidget(text: text,fontWeight: FontWeight.w600,fontSize: 12,),
          CommonTextWidget(text: price,fontWeight: FontWeight.w600,fontSize: 12,),


        ],
      ),
    );
  }
}
