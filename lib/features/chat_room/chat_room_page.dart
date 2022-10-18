import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poker/core/common/OwnMessageCard.dart';
import 'package:poker/core/common/ReplyCard.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/chat_room/chat_message.dart';

class ChatRoomPage extends StatefulWidget{
  const ChatRoomPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatRoomPageState();
  }
  
}
class ChatRoomPageState extends State<ChatRoomPage>{
  List<ChatMessage> messages = [];
  ScrollController controller = ScrollController();
  TextEditingController nameController = TextEditingController();
  void loadChat(){
    messages.add( ChatMessage(
        messageContent: "Let's get lunch. How about pizza?Let's get lunch. How about pizza?Let's get lunch. How about pizza?",
        isCurrentUser : true,
        time: "9:20 PM "));
    messages.add( ChatMessage(
        // messageContent: "Let's get lunch. How about pizza?",
        messageContent: "h",
        isCurrentUser: false,
        time: "9:20 PM "));
    messages.add( ChatMessage(
        messageContent: "Let's get lunch. How about pizza?",
        isCurrentUser: false,
        time: "9:20 PM "));
    messages.add( ChatMessage(
        messageContent: "Let's get lunch. How about pizza?",
        isCurrentUser: false,
        time: "9:20 PM "));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadChat();

  }

  Future scrollToItem(BuildContext context) async {
    await Scrollable.ensureVisible(context);
  }

  String convertToTime = DateFormat("HH:mm a ").format(DateTime.now());

  void addItemToList() {
    messages.insert(
      messages.length,
      ChatMessage(
          messageContent: nameController.text,
          isCurrentUser:true,
          time: convertToTime),
    );
    Timer(const Duration(milliseconds: 100),
            () => controller.jumpTo(controller.position.maxScrollExtent));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppUtils.commonAppBar(
          context: context,
          title: StringUtils.chatRoom,
          isShowEdit: false,
          actionTitle: StringUtils.edit),
      body: Container(
        decoration: AppUtils.containerDecoration(
            color: AppColor.colorDarkBlue, radius: AppConstants.zero),
        child: CommonBgPage(
          backImagePath: icDashboardBg,
          margin: AppConstants.zero,
          alignment: Alignment.topCenter,
          imagePath: icDashboardimg,
          widget: Stack(

            children: [
              ListView.builder(
                controller: controller,
                itemCount:messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    top: AppConstants.ten,
                    bottom: AppConstants.ten),
                itemBuilder: (context, index) {
                  if (index == messages.length) {
                    return Container(
                      height: 70,
                    );
                  }
                  if (messages[index].isCurrentUser) {
                    return OwnMessageCard(
                      message: messages[index].messageContent,
                      time: messages[index].time,
                    );
                  }
                  else {
                    return ReplyCard(
                      message: messages[index].messageContent,
                      time: messages[index].time,
                    );
                  }

                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: AppConstants.oneHundred,
                  alignment: Alignment.topCenter,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}