import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_list_bean.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class ClubBalancePage extends StatefulWidget {
  const ClubBalancePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ClubBalancePageState();
  }
}

class ClubBalancePageState extends State<ClubBalancePage> {
  List<CommonList> commonList = [];
  @override
  void initState() {
    getUserList();
    super.initState();
  }

  getUserList() {
    commonList.add(CommonList("In", "25 Aug, 23:52", "+ 500", "Pending", true));
    commonList.add(CommonList("In", "25 Aug, 23:52", "+ 500", "Failed", true));
    commonList
        .add(CommonList("Out", "25 Aug, 23:52", "+ 500", "Completed", false));
    commonList
        .add(CommonList("Out", "25 Aug, 23:52", "+ 500", "Completed", false));
    commonList.add(CommonList("In", "25 Aug, 23:52", "+ 500", "Pending", true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        color: AppColor.colorToolBar,
        height: AppConstants.eightyFour,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonButtonWidget(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColor.colorBottom,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppConstants.fourteen),
                          topRight: Radius.circular(AppConstants.fourteen)),
                    ),
                    builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            trailing: IconButton(
                                onPressed: () {
                                  AppUtils.onBack(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: AppConstants.twentyFour,
                                )),
                            title: CommonTextWidget(
                              text: StringUtils.addChipsAmount.toCapitalize(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AppUtils.commonDivider(
                              color: AppColor.colorWt,
                              indent: AppConstants.zero,
                              endIndent: AppConstants.zero),
                          CommonTextField(
                              left: AppConstants.twenty,
                              rigth: AppConstants.twenty,
                              colorText: AppColor.colorBlue,
                              colorFill: AppColor.colorWhite,
                              controller: AppUtils.tetEmail,
                              inputTypes: TextInputType.number,
                              marginTop: AppConstants.ten,
                              fontSize: AppConstants.fourteen,
                              fontWeight: FontWeight.w500,
                              radius: AppConstants.eight),
                          CommonButtonWidget(
                            onPressed: () {
                              AppUtils.showAlertDialog( context: context);
                            },
                            bottom: AppConstants.twenty,
                            marginTop: AppConstants.twentyFour,
                            text: StringUtils.sendReqest,
                            left: AppConstants.twenty,
                            right: AppConstants.twenty,
                          )
                        ],
                      );
                    });
              },
              text: StringUtils.requestChips,
              left: AppConstants.twenty,
              fontWeight: FontWeight.w600,
              right: AppConstants.twenty,
              marginTop: AppConstants.ten,
            )
          ],
        ),
      ),
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.clubBalance,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      body: Container(
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorDarkBlue, radius: AppConstants.zero),
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
                        borderRadius:
                            BorderRadius.circular(AppConstants.sixteen),
                        image: const DecorationImage(
                            image: AssetImage(icImge), fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.colorFbLight,
                          borderRadius:
                              BorderRadius.circular(AppConstants.sixteen),
                          border: Border.all(
                              color: AppColor.colorWhiteLight,
                              width: AppConstants.five)),
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
                SizedBox(
                  height: AppConstants.thirtyFive,
                ),
                AppUtils.commonDivider(
                    endIndent: AppConstants.zero, indent: AppConstants.zero),
                CommonTextWidget(
                  text: StringUtils.history,
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
                      left: AppConstants.sixteen,
                      right: AppConstants.sixteen),
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
                borderWidth: AppConstants.four,
                radius: AppConstants.sixteen,
                color: AppColor.colorBlueClub),
            margin: EdgeInsets.all(AppConstants.five),
            padding: EdgeInsets.only(
                left: AppConstants.fourteen,
                right: AppConstants.fourteen,
                top: AppConstants.twelve,
                bottom: AppConstants.twelve),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonTextWidget(
                    text: commonList[index].price,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.right,
                  ),
                  CommonTextWidget(
                    textAlign: TextAlign.right,
                    text: commonList[index].status,
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
                  widget: commonList[index].isShow ?? true
                      ? Icon(
                          Icons.arrow_downward_outlined,
                          color: AppColor.colorWhite,
                          size: AppConstants.twenty,
                        )
                      : Icon(
                          size: AppConstants.twenty,
                          Icons.arrow_upward,
                          color: AppColor.colorWhite,
                        ),
                  color: commonList[index].isShow ?? true
                      ? AppColor.colorGreenDark
                      : AppColor.colorLogout),
              title: CommonTextWidget(
                text: commonList[index].title,
                fontWeight: FontWeight.w500,
              ),
              subtitle: CommonTextWidget(
                text: commonList[index].date,
                margintop: AppConstants.three,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        });
  }


}
