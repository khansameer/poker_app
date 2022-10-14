import 'package:flutter/material.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/utils/common_appbar_user.dart';
import 'package:poker/core/utils/image_path.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfilePageState();
  }
  
}
class ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: CommonBgPage(

        imagePath: icBackground,
        widget: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                CommonAppBarUser(txtName: "name",userIcon: icBackground,)
            ],
          ),
        ),

      ),
    );
  }
  
}