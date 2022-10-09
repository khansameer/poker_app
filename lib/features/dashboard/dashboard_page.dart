import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';

class DashboardPage extends StatefulWidget{
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
  
}
class DashboardPageState extends State<DashboardPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage(icDashboardimg),fit: BoxFit.fill
            )),
          ),
          Container(

            width: double.infinity,
            height: double.infinity,
            decoration: AppUtils.containerDecorationBg(),
            child: Container(
              margin: EdgeInsets.only(left: AppConstants.fourteen,right: AppConstants.fourteen),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                      SizedBox(height: AppConstants.sixty,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        commonTopView(),
                        AppUtils.commonImageAssetWidget(path: icLogo,width: 77,height: 53),
                        commonTopView(),

                      ],
                    ),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top:40),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget(text: "👋 Hi, John",fontWeight: FontWeight.w800,fontSize: AppConstants.eighteen,)
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.colorFbLight,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColor.colorFb,width: 2)
                        ),
                      ),
                      height: 130,
                     // padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),

                          image:DecorationImage(
                        image: AssetImage(icImge),fit: BoxFit.cover
                      ) ),
                    )

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget commonTopView(){
    return Container(
      width: 55,
      height: 55,
      child: Center(
        child: Icon(Icons.menu,color: AppColor.colorButton,),
      ),
      decoration: AppUtils.containerDecoration(radius: AppConstants.ten,color: AppColor.colorBlue),
    );
  }
}