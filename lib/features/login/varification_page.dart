import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_otp_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';

class VarificationPage extends StatefulWidget{
  const VarificationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VarificationPageState();
  }
  
}
class VarificationPageState extends State<VarificationPage>{
 // late final TextEditingController textEditingController;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CommonBgPage(
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
                  child:InkWell(
                      onTap: (){
                        AppUtils.onBack(context);
                      },
                      child: Icon(Icons.arrow_back_ios,size: AppConstants.twentyFour,color: AppColor.colorWhite,)),
                ),
                CommonTextWidget(
                  text: StringUtils.forgotPassword,
                  fontWeight: FontWeight.w700,
                  margintop: AppConstants.fortyFive,
                  fontSize: AppConstants.twenty,
                ),
                CommonTextWidget(

                  text: 'We,ve sent a 6-digit confirmation code to johndoe@gmail.com. Make sure you enter \nx`correct code.',
                  margintop: AppConstants.thirtyFive,
                ),
                SizedBox(height: AppConstants.twentyFour,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonOtpWidget(

                        textEditingController: textEditingController,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        textEditingController: textEditingController,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        textEditingController: textEditingController,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        textEditingController: textEditingController,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        textEditingController: textEditingController,
                        first: true,
                        last: false),
                    CommonOtpWidget(
                        textEditingController: textEditingController,
                        first: true,
                        last: false),
                  ],
                ),
                CommonButtonWidget(
                    onPressed: (){
                      AppUtils.onBack(context);
                    },
                    text: StringUtils.verify,
                    marginTop: AppConstants.thirtyFive),

                Center(
                  child: AppUtils.richText(top: AppConstants.fortyFive,
                      text:StringUtils.recieved,
                      onTap: (){

                      },
                      linkText: StringUtils.resendCode),
                ),



              ],
            ),
          )),
    );
  }
  
}