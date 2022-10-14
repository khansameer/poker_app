import 'package:flutter/cupertino.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/image_path.dart';
class CommonBgPage extends StatelessWidget {

   String?  imagePath;
   Widget? widget;
   Alignment? alignment;
   CommonBgPage({super.key,
    this.imagePath,
     this.widget,
     this.alignment,
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
                  image: AssetImage(icLoginBg!), fit: BoxFit.fill)
              /*gradient: LinearGradient(
                  stops: [0.0, 0.7],
                  tileMode: TileMode.clamp,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.colorBlueLight.withOpacity(0.2),
                    AppColor.colorBlue.withOpacity(1),
                  ])*/),
        ),
        Container(
          alignment: alignment??Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: AppConstants.twenty),
            child: widget!),
      ],
    );
  }
}
