import 'package:flutter/cupertino.dart';
import 'package:poker/utils/app_color.dart';
class CommonBgPage extends StatelessWidget {

   String?  imagePath;
   Widget? widget;
   CommonBgPage({super.key,
    this.imagePath,
     this.widget,
});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath!), fit: BoxFit.cover)),
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.1, 0.7],
                  tileMode: TileMode.clamp,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.colorBlueLight,
                    AppColor.colorBlue,
                  ])),
        ),
        widget!,
      ],
    );
  }
}
