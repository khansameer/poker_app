import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
class CommonBgPage extends StatelessWidget {

   String?  imagePath;
   Widget? widget;
   double ? margin;
   Alignment? alignment;
   String? backImagePath;
   bool? isLogin;


   CommonBgPage({super.key,
    this.imagePath,
     this.widget,
     this.alignment,
     this.margin,
     this.backImagePath,
     this.isLogin,
});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.antiAlias,
      fit: StackFit.passthrough,
      children: [
        Container(

          width: double.infinity,
          height: double.infinity,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath!), fit: BoxFit.cover)),
        ),
        Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backImagePath??icLoginBg), fit: BoxFit.fill)),
        ),
        Container(

          alignment: alignment??Alignment.center,
            margin: isLogin??false?AppUtils.commonAllEdgeInsets():EdgeInsets.symmetric(horizontal:margin?? AppConstants.twenty),
            child: widget),
      ],
    );
  }
}
