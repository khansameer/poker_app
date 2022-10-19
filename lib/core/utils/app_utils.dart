import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static TextEditingController tetEmail = TextEditingController();
  static TextEditingController tetPassword = TextEditingController();
  static TextEditingController tetConfrimPassword = TextEditingController();
  static TextEditingController tetNewPassword = TextEditingController();
  static TextEditingController tetReInterPassword = TextEditingController();
  static TextEditingController tetFirstName = TextEditingController();
  static TextEditingController tetLastName = TextEditingController();
  static TextEditingController tetOtp = TextEditingController();

  static Widget commonCoinView(
      {VoidCallback? onTap,
      String? text,
      double? top,
      double? right,
      double? left}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: top ?? AppConstants.twenty,
            right: right ?? 0,
            left: left ?? 0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: AppConstants.oneHundredFifty,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.sixteen),
                  image: const DecorationImage(
                      image: AssetImage(icImge), fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.colorFbLight,
                    borderRadius: BorderRadius.circular(AppConstants.sixteen),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppUtils.commonImageAssetWidget(
                    path: icCoin, height: 165, boxFit: BoxFit.scaleDown)
              ],
            ),
          ],
        ),
      ),
    );
  }

  static AppBar commonAppBar(
      {required BuildContext context,
      String? title,
      bool? isShowEdit,
      String? actionTitle,
      VoidCallback? onTap,
      double? fontSize,
      bool? isArrowWthBack}) {
    return AppBar(
      toolbarHeight: 70,
      actions: [
        Visibility(
          visible: isShowEdit ?? false,
          child: Center(
            child: TextButton(
              onPressed: () {
                AppUtils.redirectToNextScreen(
                    context: context, screenName: RouteName.editProfile);
              },
              child: CommonTextWidget(
                textAlign: TextAlign.center,
                right: AppConstants.twentyFour,
                fontSize: AppConstants.eighteen,
                fontWeight: FontWeight.w600,
                text: actionTitle,
              ),
            ),
          ),
        )
      ],
      leading:  isArrowWthBack ?? false ? backBtnWithIcon(context) :
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: AppConstants.twentyFour,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
      backgroundColor: AppColor.colorToolBar,
      elevation: 0,
      centerTitle: true,
      title: CommonTextWidget(
        fontSize: fontSize ?? AppConstants.eighteen,
        fontWeight: FontWeight.w600,
        text: title,
      ),
    );
  }

  static BoxDecoration containerDecorationBg({String? image}) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage(image ?? icDashboardBg), fit: BoxFit.fill),
    );
  }

  static backBtnWithIcon(BuildContext ctx) {
    return InkWell(
      onTap: () =>Navigator.of(ctx).pop(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 4),
           Icon(Icons.arrow_back_ios_sharp, color: AppColor.colorWhite,size: AppConstants.fourteen),
          const SizedBox(width: 2),
          CommonTextWidget(
            text: 'Back',
            textColor: AppColor.colorWhite,
            fontSize: AppConstants.fourteen,
          ),
        ],
      ),
    );
  }

  static BoxDecoration decorationCircle({Color? color}) {
    return BoxDecoration(color: color, shape: BoxShape.circle);
  }

  static BoxDecoration dashboard() {
    return BoxDecoration(
        image: const DecorationImage(
            opacity: 0.2, image: AssetImage(icDashboardimg), fit: BoxFit.fill),
        gradient: LinearGradient(
            stops: [0.4, 0.5, 0.1],
            tileMode: TileMode.repeated,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.colorBlue.withOpacity(1.0),
              AppColor.colorBlueLight.withOpacity(0.8),
              AppColor.colorBlueLight.withOpacity(0.8),
            ]));
  }

  static BoxDecoration containerDecoration({
    double radius = 13,
    Color color = Colors.white,
    double? borderWidth,
    Color colorBorder = AppColor.colorWhiteLight,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: colorBorder, width: borderWidth ?? 2), /*    */
    );
  }

  static Widget richText({
    String? text,
    String? linkText,
    double? fontSize,
    FontWeight? fontWeight,
    FontWeight? fontWeightLink,
    double? top,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(top: top ?? AppConstants.zero),
      child: RichText(
        text: TextSpan(
          //style: TextStyle(color: Colors.black, fontSize: 14),
          children: <TextSpan>[
            TextSpan(
                text: '${text} ',
                style: TextStyle(
                    letterSpacing: 0.5,
                    color: Colors.white,
                    fontSize: fontSize ?? AppConstants.fourteen,
                    fontWeight: fontWeight ?? FontWeight.w500)),

            // TextSpan(text: 'dot '),

            TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onTap,
                text: linkText,
                style: TextStyle(
                    letterSpacing: 1.5,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: fontSize ?? AppConstants.fourteen,
                    fontWeight: fontWeight ?? FontWeight.w700))
          ],
        ),
      ),
    );
  }

  static Widget commonImageAssetWidget(
      {String? path,
      double? width,
      double? height,
      Alignment? alignment,
      Color? iconColor,
      BoxFit? boxFit}) {
    return Center(
      child: Image.asset(
        path!,
        width: width,
        height: height,
        alignment: alignment ?? Alignment.center,
        color: iconColor,
        fit: boxFit ?? BoxFit.cover,
      ),
    );
  }

  static Widget commonImageSVGWidget(
      {String? path,
      double? width,
      double? height,
      Alignment? alignment,
      Color? iconColor,
      BoxFit? boxFit}) {
    return SvgPicture.asset(
      path!,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
      color: iconColor,
      fit: boxFit ?? BoxFit.cover,
    );
  }

  static textStyle(
      {double? letterSpacing,
      FontWeight? fontWeight,
      double? fontSize,
      Color? textColor,
      TextDecoration? textDecoration}) {
    return TextStyle(
        letterSpacing: letterSpacing ?? AppConstants.zero05,
        fontSize: fontSize ?? AppConstants.fourteen,
        color: textColor ?? AppColor.colorWhite,
        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: textDecoration ?? TextDecoration.none);
  }

  static void onBack(BuildContext context) {
    closeKeyBoard(context);
    Navigator.pop(context);
  }

  static void redirectToNextScreen(
      {required BuildContext context, String? screenName, dynamic arguments}) {
    closeKeyBoard(context);
    Navigator.of(context).pushNamed(screenName!, arguments: arguments);
  }

  static Widget privacyPolicyLinkAndTermsOfService(
      {VoidCallback? onTapTermsCondition, VoidCallback? onTapPrivacyPolicy}) {
    return Container(
      margin: EdgeInsets.only(top: AppConstants.thirtyFive),
      child: Text.rich(TextSpan(
          text: StringUtils.signupTerm,
          style: AppUtils.textStyle(
              fontSize: AppConstants.fourteen, textColor: AppColor.colorWhite1),
          children: <TextSpan>[
            TextSpan(
                text: StringUtils.termsCondition,
                style: AppUtils.textStyle(
                    textDecoration: TextDecoration.underline,
                    fontSize: AppConstants.fourteen,
                    textColor: AppColor.colorWhite),
                recognizer: TapGestureRecognizer()
                  ..onTap = onTapTermsCondition),
            TextSpan(
                text: '  and ',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    fontSize: AppConstants.fourteen,
                    color: AppColor.colorWhite1),
                children: <TextSpan>[
                  TextSpan(
                      text: StringUtils.privacyPolicy,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppConstants.fourteen,
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = onTapPrivacyPolicy)
                ])
          ])),
    );
  }

  static Widget commonDivider(
      {Color? color,
      double? indent,
      double? endIndent,
      double? top,
      double? thickness}) {
    return Divider(
      thickness: thickness ?? 2,
      color: color ?? AppColor.colorWhiteLight,
      indent: indent ?? 15,
      endIndent: endIndent ?? 15,
      height: top ?? 0,
    );
  }

  static Widget commonMenuItem(
      {String? text,
      Color? textColor,
      String? imagePath,
      Color? leadingColor,
      double? fontSize,
      Color? trailingColor,
      VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: commonImageSVGWidget(
          path: imagePath ?? icPerson,
          width: AppConstants.twenty,
          height: AppConstants.twenty,
          alignment: Alignment.centerLeft),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: trailingColor ?? AppColor.colorWhite1,
        size: AppConstants.eighteen,
      ),
      title: CommonTextWidget(
        text: text,
        fontSize: fontSize ?? AppConstants.fourteen,
        textColor: textColor ?? AppColor.colorWhite,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static Widget commonBg({
    Widget? widget,
    Color? color,
    double? left,
    double? right,
    double? top,
    double? radius,
    double? borderWidth,
    double? padding,
    Color? colorBorder,
  }) {
    return Container(
      margin:
          EdgeInsets.only(left: left ?? 16, top: top ?? 10, right: right ?? 0),
      padding: EdgeInsets.all(padding ?? 10),
      decoration: AppUtils.containerDecoration(
          colorBorder: colorBorder ?? Colors.transparent,
          borderWidth: borderWidth ?? 0,
          radius: radius ?? 8,
          color: color ?? AppColor.colorWhiteLight),
      child: widget,
    );
  }

  static void showAlertDialog(
      {required BuildContext context,
      double? radius,
      Color? bgColor,
      String? text,
      String? buttonText}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? AppConstants.sixteen)),
            ),
            backgroundColor: bgColor ?? AppColor.colorDialog,
            content: SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 3.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppConstants.fifty,
                    height: AppConstants.fifty,
                    decoration: const BoxDecoration(
                        color: AppColor.colorGreenDark, shape: BoxShape.circle),
                    child: commonImageSVGWidget(
                        boxFit: BoxFit.scaleDown,
                        path: icDone,
                        height: AppConstants.twenty,
                        width: AppConstants
                            .twenty) /*Icon(
                      Icons.ac_unit_outlined,
                      size: AppConstants.twentyFour,
                    )*/
                    ,
                  ),
                  CommonTextWidget(
                      text: text ?? "Request send successfully for \n500 chips",
                      letterSpacing: AppConstants.zero03,
                      lineHeight: AppConstants.one02,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstants.eighteen,
                      margintop: AppConstants.fourteen),
                  CommonButtonWidget(
                    text: buttonText ?? StringUtils.done,
                    left: AppConstants.twentyFour,
                    right: AppConstants.twentyFour,
                    marginTop: AppConstants.twentyFour,
                    onPressed: () {
                      AppUtils.onBack(context);
                    },
                  )
                ],
              ),
              //Contents here
            ));
      },
    );
  }

  static Widget commonGridView(
      {String? text,
      Widget? widget,
      String? imagePath,
      Color? colorBg,
      String? imageTrans}) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: AppConstants.eighteen),
      width: AppConstants.oneHundredSeventyEight,
      height: AppConstants.oneHundredFourty,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.sixteen),
          image: DecorationImage(
              image: AssetImage(imagePath ?? icWhatOn), fit: BoxFit.cover)),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageTrans ?? icWhatOnTrans),
                fit: BoxFit.cover),
            /* color: colorBg ?? AppColor.colorRedLight,*/
            borderRadius: BorderRadius.circular(AppConstants.sixteen),
            border: Border.all(
                color: AppColor.colorWhiteLight, width: AppConstants.five)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUtils.commonBg(
                top: 0,
                left: AppConstants.ten,
                color: AppColor.colorBlackLight,
                widget: widget),
            SizedBox(
              height: AppConstants.sixteen,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppUtils.commonBg(
                    left: AppConstants.ten,
                    top: 0,
                    color: AppColor.colorBlackLight,
                    widget: CommonTextWidget(
                      text: text,
                      fontWeight: FontWeight.w700,
                      fontSize: AppConstants.fourteen,
                    )),
                Container(
                  margin: EdgeInsets.only(left: AppConstants.fourteen),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(AppConstants.twelve),
                  decoration: const BoxDecoration(
                      color: AppColor.colorBlackLight, shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.colorWhite,
                    size: AppConstants.fourteen,
                  ),
                )
                /*   AppUtils.commonBg(

                    color: AppColor.colorBlackLight,
                    widget:  Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColor.colorWhite,
                      size: AppConstants.fourteen,
                    ))*/
              ],
            )
          ],
        ),
      ),
    );
  }

  static Future<void> launchContent({String? path, String? scheme}) async {
    final Uri launchUri = Uri(
      scheme: scheme ?? 'tel',
      path: path ?? "+919999999999",
    );
    await launchUrl(launchUri);
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static closeKeyBoard(BuildContext ctx) {
    FocusScope.of(ctx).unfocus();
  }

  /////////

// Admin Declaration


  static TextEditingController tetFirstNameAdmin = TextEditingController();
  static TextEditingController tetEmailAdmin = TextEditingController();
  static TextEditingController tetTeleNoAdmin = TextEditingController();
}
