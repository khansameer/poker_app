import 'package:flutter/material.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppUtils.sa(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(
              left: AppConstants.fourteen, right: AppConstants.fourteen),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppConstants.sixty,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonTopView(),
                    AppUtils.commonImageAssetWidget(
                        path: icLogo, width: 77, height: 53),
                    commonTopView(),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 40),
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
                        border:
                        Border.all(color: AppColor.colorWhiteLight, width: 5)),
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
                        commonBg(
                            widget: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CommonTextWidget(
                                  text: "Current Credit",
                                  textColor: AppColor.colorWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                                CommonTextWidget(
                                  text: "500",left: AppConstants.five,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonGridView(),
                    commonGridView()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonGridView(),
                    commonGridView()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonGridView(),
                    commonGridView()
                  ],
                ),

                /* Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              width:164,
                              height: 140,


                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: const DecorationImage(
                                      image: AssetImage(icImge), fit: BoxFit.cover)),

                              child: Container(

                               // padding: const EdgeInsets.only(left: 5,right: 5,top: 40,bottom: 40),
                                decoration: BoxDecoration(
                                    color: AppColor.colorFbLight,
                                    borderRadius: BorderRadius.circular(16),
                                    border:
                                    Border.all(color: AppColor.colorWhiteLight, width: 5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    commonBg(
                                      showBorder: true,
                                        widget: const Icon(Icons.ac_unit_outlined)),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        commonBg(widget: CommonTextWidget(text: "What’s On",fontWeight: FontWeight.w700,fontSize: 16,)),
                                        commonBg(widget: Icon(Icons.arrow_forward_ios_outlined,color: AppColor.colorWhite,size: 15,))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container(
                            width:164,
                            height: 140,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: const DecorationImage(
                                    image: AssetImage(icImge), fit: BoxFit.cover)),

                            child: Container(

                              // padding: const EdgeInsets.only(left: 5,right: 5,top: 40,bottom: 40),
                              decoration: BoxDecoration(
                                  color: AppColor.colorFbLight,
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                  Border.all(color: AppColor.colorWhiteLight, width: 5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  commonBg(
                                      showBorder: true,
                                      widget: const Icon(Icons.ac_unit_outlined)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      commonBg(widget: CommonTextWidget(text: "What’s On",fontWeight: FontWeight.w700,fontSize: 16,)),
                                      commonBg(widget: Icon(Icons.arrow_forward_ios_outlined,color: AppColor.colorWhite,size: 15,))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))


                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width:164,
                              height: 140,


                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: const DecorationImage(
                                      image: AssetImage(icImge), fit: BoxFit.cover)),

                              child: Container(

                                // padding: const EdgeInsets.only(left: 5,right: 5,top: 40,bottom: 40),
                                decoration: BoxDecoration(
                                    color: AppColor.colorFbLight,
                                    borderRadius: BorderRadius.circular(16),
                                    border:
                                    Border.all(color: AppColor.colorWhiteLight, width: 5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    commonBg(
                                        showBorder: true,
                                        widget: const Icon(Icons.ac_unit_outlined)),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        commonBg(widget: CommonTextWidget(text: "What’s On",fontWeight: FontWeight.w700,fontSize: 16,)),
                                        commonBg(widget: Icon(Icons.arrow_forward_ios_outlined,color: AppColor.colorWhite,size: 15,))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container(
                            width:164,
                            height: 140,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: const DecorationImage(
                                    image: AssetImage(icImge), fit: BoxFit.cover)),

                            child: Container(

                              // padding: const EdgeInsets.only(left: 5,right: 5,top: 40,bottom: 40),
                              decoration: BoxDecoration(
                                  color: AppColor.colorFbLight,
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                  Border.all(color: AppColor.colorWhiteLight, width: 5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  commonBg(
                                      showBorder: true,
                                      widget: const Icon(Icons.ac_unit_outlined)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      commonBg(widget: CommonTextWidget(text: "What’s On",fontWeight: FontWeight.w700,fontSize: 16,)),
                                      commonBg(widget: Icon(Icons.arrow_forward_ios_outlined,color: AppColor.colorWhite,size: 15,))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))


                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width:164,
                              height: 140,


                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: const DecorationImage(
                                      image: AssetImage(icImge), fit: BoxFit.cover)),

                              child: Container(

                                // padding: const EdgeInsets.only(left: 5,right: 5,top: 40,bottom: 40),
                                decoration: BoxDecoration(
                                    color: AppColor.colorFbLight,
                                    borderRadius: BorderRadius.circular(16),
                                    border:
                                    Border.all(color: AppColor.colorWhiteLight, width: 5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    commonBg(
                                        showBorder: true,
                                        widget: const Icon(Icons.ac_unit_outlined)),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        commonBg(widget: CommonTextWidget(text: "What’s On",fontWeight: FontWeight.w700,fontSize: 16,)),
                                        commonBg(widget: Icon(Icons.arrow_forward_ios_outlined,color: AppColor.colorWhite,size: 15,))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container(
                            width:164,
                            height: 140,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: const DecorationImage(
                                    image: AssetImage(icImge), fit: BoxFit.cover)),

                            child: Container(

                              // padding: const EdgeInsets.only(left: 5,right: 5,top: 40,bottom: 40),
                              decoration: BoxDecoration(
                                  color: AppColor.colorFbLight,
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                  Border.all(color: AppColor.colorWhiteLight, width: 5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  commonBg(
                                      showBorder: true,
                                      widget: const Icon(Icons.ac_unit_outlined)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      commonBg(widget: CommonTextWidget(text: "What’s On",fontWeight: FontWeight.w700,fontSize: 16,)),
                                      commonBg(widget: Icon(Icons.arrow_forward_ios_outlined,color: AppColor.colorWhite,size: 15,))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))


                        ],
                      )*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonTopView() {
    return Container(
      width: 55,
      height: 55,
      decoration: AppUtils.containerDecoration(
          radius: AppConstants.ten, color: AppColor.colorBlue),
      child: const Center(
        child: Icon(
          Icons.menu,
          color: AppColor.colorButton,
        ),
      ),
    );
  }

  Widget commonBg({Widget? widget,bool? showBorder,Color? color}) {
    return Container(
      margin: const EdgeInsets.only(left: 16,top: 10),

      padding: const EdgeInsets.all(10),
      decoration: AppUtils.containerDecoration(
          isBorder:showBorder?? false,
          radius: 8, color: color??AppColor.colorWhiteLight),
      child: widget,
    );
  }
  Widget commonGridView(){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 10),
      width:178,
      height: 140,


      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
              image: AssetImage(icGrid), fit: BoxFit.cover)),

      child: Container(

        decoration: BoxDecoration(
            color: Color.fromRGBO(215, 91, 74, 0.54),
            borderRadius: BorderRadius.circular(16),
            border:
            Border.all(color: AppColor.colorWhiteLight, width: 3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            commonBg(
                color: Color.fromRGBO(0, 0, 0, 0.32),
                showBorder: true,
                widget: const Icon(Icons.ac_unit_outlined)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                commonBg(
                    color: Color.fromRGBO(0, 0, 0, 0.32),
                    widget: CommonTextWidget(text: "What’s On",fontWeight: FontWeight.w700,fontSize: 14,)),
                commonBg(
                    color: Color.fromRGBO(0, 0, 0, 0.32),
                    widget: const Icon(Icons.arrow_forward_ios_outlined,color: AppColor.colorWhite,size: 15,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
