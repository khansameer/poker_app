import 'package:flutter/material.dart';
import 'package:poker/common/common_bg_page.dart';
import 'package:poker/common/common_button_widget.dart';
import 'package:poker/common/common_text_widget.dart';
import 'package:poker/common/common_textfield.dart';
import 'package:poker/core/route.dart';
import 'package:poker/utils/app_color.dart';
import 'package:poker/utils/app_constants.dart';
import 'package:poker/utils/app_utils.dart';
import 'package:poker/utils/image_path.dart';
import 'package:poker/utils/string_utils.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignupPageState();
  }
  
}
class SignupPageState extends State<SignupPage>{
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CommonBgPage(
            alignment: Alignment.topLeft,
              imagePath: icBackground,
              widget: SingleChildScrollView(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: AppConstants.sixty,),
                    Align(
                      alignment: Alignment.topLeft,
                      child:Icon(Icons.arrow_back_ios,size: AppConstants.twentyFour,color: AppColor.colorWhite,),
                    ),
                    CommonTextWidget(
                      text: StringUtils.signup,
                      fontWeight: FontWeight.w700,
                      margintop: AppConstants.fortyFive,
                      fontSize: AppConstants.twenty,
                    ),
                    CommonTextWidget(
                      text: StringUtils.firstName,
                      margintop: AppConstants.sixteen,
                    ),
                    CommonTextField(
                        inputTypes: TextInputType.name,
                        marginTop: AppConstants.ten,
                        hint: StringUtils.your+StringUtils.firstName,

                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    CommonTextWidget(
                      text: StringUtils.lastName,
                      margintop: AppConstants.sixteen,
                    ),
                    CommonTextField(
                        marginTop: AppConstants.ten,
                        inputTypes: TextInputType.name,
                        hint: StringUtils.your+StringUtils.lastName,

                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    CommonTextWidget(
                      text: StringUtils.password,
                      margintop: AppConstants.sixteen,
                    ),



                    CommonTextField(
                        obscureText: obscureText,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: !obscureText
                              ? Icon(
                            Icons.visibility,
                            color: AppColor.colorWhite,
                            size: AppConstants.twenty,
                          )
                              : Icon(
                            Icons.visibility_off,
                            color: AppColor.colorWhite,
                            size: AppConstants.twenty,
                          ),
                        ),
                        inputTypes: TextInputType.visiblePassword,
                        marginTop: AppConstants.ten,
                        hint: StringUtils.password,
                        iconWidget: const Icon(
                          Icons.lock_outline,
                          color: AppColor.colorWhite,
                        ),
                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),

                    CommonButtonWidget(
                      onPressed: (){
                        Navigator.of(context).pushNamed(RouteName.verification);
                      },
                        text: StringUtils.signup,
                        marginTop: AppConstants.fortyFive),
                    Center(
                      child: AppUtils.richText(top: AppConstants.thirty,
                          text:StringUtils.alreadySignup,
                          onTap: (){
                              Navigator.pop(context);
                          },
                          linkText: StringUtils.login),
                    ),


                  ],
                ),
              )),
        ],
      ),
    );
  }
  
}