import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poker/core/common/common_list_bean.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class AppUtils {

  static TextEditingController tetEmail=TextEditingController();
  static TextEditingController tetPassword=TextEditingController();
  static TextEditingController tetConfrimPassword=TextEditingController();
  static TextEditingController tetNewPassword=TextEditingController();
  static TextEditingController tetReInterPassword=TextEditingController();
  static TextEditingController tetFirstName=TextEditingController();
  static TextEditingController tetLastName=TextEditingController();
  static TextEditingController tetOtp=TextEditingController();


 static List<CommonList> commonList = [];

 static getUserList() {
    commonList.add(CommonList("In","25 Aug, 23:52","+ 500","Pending",true));
    commonList.add(CommonList("In","25 Aug, 23:52","+ 500","Failed",true));
    commonList.add(CommonList("Out","25 Aug, 23:52","+ 500","Completed",false));
    commonList.add(CommonList("Out","25 Aug, 23:52","+ 500","Completed",false));
    commonList.add(CommonList("In","25 Aug, 23:52","+ 500","Pending",true));
  }


  static AppBar commonAppBar({required BuildContext context,String? title,bool? isShowEdit,String? actionTitle,VoidCallback? onTap}){
    return AppBar(
      toolbarHeight: 70,
      actions: [

        Visibility(
          visible: isShowEdit ?? false,
          child: Center(
            child: TextButton(
              onPressed: (){
                AppUtils.redirectToNextScreen(context: context,screenName: RouteName.editProfile);

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
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white,size: AppConstants.twentyFour,),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppColor.colorToolBar,
      elevation: 0,

      centerTitle: true,
      title: CommonTextWidget(
        fontSize: AppConstants.eighteen,
        fontWeight: FontWeight.w600,
        text:title ,
      ),
    );
  }

  static BoxDecoration containerDecorationBg({String? image}) {
    return BoxDecoration(
      image:
          DecorationImage(image: AssetImage(image??icDashboardBg), fit: BoxFit.fill),
    );
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
    Color colorBorder=AppColor.colorWhiteLight,
    BoxShape boxShape = BoxShape.rectangle,
  }) {
    return BoxDecoration(
        color: color,
        shape: boxShape,
        border: Border.all(color: colorBorder?? AppColor.colorWhiteLight, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
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
                text: '${text} ' ,
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
  static Widget commonImageAssetWidget1(

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
  static void onBack(BuildContext context){
    Navigator.pop(context);
  }
  static void redirectToNextScreen({BuildContext? context,String? screenName,String? arguments }){
    Navigator.of(context!).pushNamed(screenName!,arguments: arguments);
  }

 static Widget privacyPolicyLinkAndTermsOfService({VoidCallback? onTapTermsCondition,VoidCallback? onTapPrivacyPolicy}) {
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
                    fontSize: AppConstants.fourteen, textColor: AppColor.colorWhite),
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

  static Widget commonDivider({Color? color,double? indent,double?  endIndent,double? top }){
    return Divider(color: color?? AppColor.colorWhite,indent: indent??15, endIndent: endIndent??15,height: top??0,);
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
      leading: AppUtils.commonImageAssetWidget1(
          path: imagePath??icPerson,
          width: AppConstants.twenty,
          height: AppConstants.twenty,
          alignment: Alignment.centerLeft),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: trailingColor ?? AppColor.colorWhite1,
        size: AppConstants.twenty,
      ),
      title: CommonTextWidget(
        text: text,
        fontSize:fontSize?? AppConstants.fourteen,
        textColor: textColor ?? AppColor.colorWhite,
        fontWeight: FontWeight.w500,
      ),
    );
  }

 static Widget commonBg({
    Widget? widget,
    Color? color,
   double? left,
   double? top,
   double? radius,
   double?padding,
  }) {
    return Container(
      margin:  EdgeInsets.only(left:left?? 16, top: top??10),
      padding:  EdgeInsets.all(padding?? 10),
      decoration: AppUtils.containerDecoration(
          radius: radius??8, color: color ?? AppColor.colorWhiteLight),
      child: widget,
    );
  }

}



