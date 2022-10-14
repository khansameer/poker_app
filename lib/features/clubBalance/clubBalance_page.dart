import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_list_bean.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class ClubBalancePage extends StatefulWidget {
  const ClubBalancePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClubBalancePageState();
  }
}

class ClubBalancePageState extends State<ClubBalancePage> {

  List<CommonList> commonList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppUtils.getUserList();
  }
   getUserList() {
    commonList.add(CommonList("In","25 Aug, 23:52","+ 500","Pending",true));
    commonList.add(CommonList("In","25 Aug, 23:52","+ 500","Failed",true));
    commonList.add(CommonList("Out","25 Aug, 23:52","+ 500","Completed",false));
    commonList.add(CommonList("Out","25 Aug, 23:52","+ 500","Completed",false));
    commonList.add(CommonList("In","25 Aug, 23:52","+ 500","Pending",true));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.profile,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      body: Container(
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorDarkBlue, radius: 0),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topCenter,
          imagePath: icDashboardimg,
          widget: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstants.thirty,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: AppConstants.sixteen,
                        right: AppConstants.sixteen),
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
                          AppUtils.commonBg(
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
                ),

                SizedBox(height: AppConstants.thirtyFive,),
                AppUtils.commonDivider(

                    endIndent: AppConstants.zero,
                    indent: AppConstants.zero),
                CommonTextWidget(
                  text: 'History',
                  left: AppConstants.sixteen,
                  right: AppConstants.sixteen,
                  margintop: AppConstants.twenty,
                  fontSize: AppConstants.eighteen,
                  fontWeight: FontWeight.w600,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: AppConstants.twelve,
                      left: AppConstants.sixteen, right: AppConstants.sixteen),
                  child: bindListView(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bindListView() {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: commonList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            decoration: AppUtils.containerDecoration(
                radius: AppConstants.sixteen, color: AppColor.colorBlueClub),
            margin: EdgeInsets.all(AppConstants.five),
            padding: EdgeInsets.only(left: AppConstants.fourteen, right: AppConstants.fourteen, top: AppConstants.twelve, bottom: AppConstants.twelve),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonTextWidget(
                    text:  commonList[index].title,
                    fontWeight: FontWeight.w500,
                  ),
                  CommonTextWidget(
                    text: 'Failed',
                    margintop: AppConstants.three,
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.colorWhite1,
                  ),
                ],
              ),
              leading: AppUtils.commonBg(
                top: AppConstants.zero,
                  padding: AppConstants.twelve,
                  left: AppConstants.zero,
                  radius: AppConstants.sixteen,
                  widget: Icon(
                    Icons.arrow_downward_outlined,
                    color: AppColor.colorWhite,
                  ),
                  color: AppColor.colorGreenDark),
              title: CommonTextWidget(
                text: 'In',

                fontWeight: FontWeight.w500,
              ),
              subtitle: CommonTextWidget(
                text: '25 Aug, 23:52',
                margintop: AppConstants.three,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        });
  }
}
