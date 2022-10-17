import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_list_bean.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class VenueInfoPage extends StatefulWidget {
  const VenueInfoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VenueInfoPageState();
  }
}

class VenueInfoPageState extends State<VenueInfoPage> {
  MediaQueryData? queryData;
  List<CommonList> commonList = [];
  List<CommonList> commonList1 = [];
  bool _hasCallSupport = false;
  @override
  void initState() {
    getUserList();
    getContectList();
    super.initState();
  }

  getUserList() {
    commonList.add(
        CommonList("Stratford", "25 Aug, 23:52", "+ 500", "Pending", true));
    commonList
        .add(CommonList("Greenwich", "25 Aug, 23:52", "+ 500", "Failed", true));
  }

  getContectList() {
    commonList1.add(
        CommonList("Stratford", "25 Aug, 23:52", "+ 500", "Pending", true));
    commonList1
        .add(CommonList("Greenwich", "25 Aug, 23:52", "+ 500", "Failed", true));
    commonList1.add(
        CommonList("Stratford", "25 Aug, 23:52", "+ 500", "Pending", true));
    commonList1.add(
        CommonList("Stratford", "25 Aug, 23:52", "+ 500", "Pending", true));
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context); // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.venueInfo,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      body: Container(
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorDarkBlue, radius: AppConstants.zero),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topRight,
          imagePath: icDashboardimg,
          widget: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: bindListView(),
                ),
                SizedBox(
                  height: 30,
                ),
                AppUtils.commonDivider(
                    color: AppColor.colorWhiteLight,
                    endIndent: 0,
                    indent: 0,
                    thickness: 3),
                CommonTextWidget(
                  margintop: AppConstants.twenty,
                  left: AppConstants.sixteen,
                  text: "Contacts",
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstants.eighteen,
                  textAlign: TextAlign.left,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: AppConstants.ten),
                  child: bindListtContact(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bindListView() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
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
              margin: EdgeInsets.only(
                  left: AppConstants.sixteen,
                  right: AppConstants.sixteen,
                  top: AppConstants.sixteen),
              padding: EdgeInsets.only(
                  left: AppConstants.fourteen,
                  right: AppConstants.fourteen,
                  top: AppConstants.twelve,
                  bottom: AppConstants.twelve),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidget(
                          text: commonList[index].title,
                          fontWeight: FontWeight.w600,
                          fontSize: AppConstants.sixteen,
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: AppConstants.twelve,
                        ),
                        AppUtils.commonDivider(
                            color: AppColor.colorWhiteLight,
                            indent: AppConstants.zero,
                            endIndent: AppConstants.ten),
                        Container(
                          margin: EdgeInsets.only(top: AppConstants.twelve),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppUtils.commonImageSVGWidget(path: icMap),
                              CommonTextWidget(
                                left: AppConstants.twelve,
                                text:
                                    'NLH 2/5 Behind Startford' /*commonList[index].price*/,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: AppConstants.eighty,
                        height: AppConstants.eighty,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(icDirection))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppUtils.commonImageSVGWidget(
                                path: icDirectionsIcon),
                            CommonTextWidget(
                              margintop: AppConstants.five,
                              text: StringUtils.direction,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ));
        });
  }

  Widget bindListtContact() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemCount: commonList1.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
              decoration: AppUtils.containerDecoration(
                  borderWidth: AppConstants.four,
                  radius: AppConstants.sixteen,
                  color: AppColor.colorBlueClub),
              margin: EdgeInsets.only(
                  left: AppConstants.sixteen,
                  right: AppConstants.sixteen,
                  top: AppConstants.sixteen),
              padding: EdgeInsets.only(
                  left: AppConstants.fourteen,
                  right: AppConstants.fourteen,
                  top: AppConstants.twelve,
                  bottom: AppConstants.twelve),
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,

                title: CommonTextWidget(
                  text: commonList1[index].title,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                ),
                subtitle: CommonTextWidget(
                  margintop: AppConstants.five,
                  text: '+44 797 577 7666' /*commonList[index].price*/,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                ),
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.twenty),
                  child: Container(
                    width: AppConstants.sixty,
                    height: AppConstants.sixty,
                    decoration: const BoxDecoration(
                      color: AppColor.colorButton,
                    ),
                    child:IconButton(
                      onPressed: (){
                        _makePhoneCall('+917383044605');
                     /*  canLaunchUrl(Uri(scheme: 'tel',path: '7984512507')).then((bool result){
                         setState(() {
                           _hasCallSupport = result;

                         });

                       });*/
                      },
                      icon: AppUtils.commonImageSVGWidget(path: icCall,boxFit: BoxFit.scaleDown),
                    ) ,

                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.twelve),
                  child: Container(
                    width: AppConstants.sixty,
                    height: AppConstants.sixty,
                    decoration: BoxDecoration(
                      //  color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConstants.twenty)),
                      border: Border.all(
                        color: AppColor.colorBorder,
                        width: AppConstants.three,
                      ),
                    ),
                    child: AppUtils.commonImageAssetWidget(
                        path: icGirlsIcon,
                        boxFit: BoxFit.fill,
                        height: AppConstants.sixty,
                        width: AppConstants.sixty),
                  ),
                ),
              ));
        });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

}
