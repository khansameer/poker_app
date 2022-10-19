import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poker/core/common/OwnMessageCard.dart';
import 'package:poker/core/common/ReplyCard.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/custom_chat_picker.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/features/chat_room/chat_message.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatRoomPageState();
  }
}

class ChatRoomPageState extends State<ChatRoomPage> {
  List<ChatMessage> messages = [];
  ScrollController controller = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  bool sendButton = false;

  void loadChat() {
    messages.add(ChatMessage(
        messageContent:
            "Let's get lunch. How about pizza?Let's get lunch. How about pizza?Let's get lunch. How about pizza?",
        isCurrentUser: true,
        time: "9:20 PM "));
    messages.add(ChatMessage(
        // messageContent: "Let's get lunch. How about pizza?",
        messageContent: "h",
        isCurrentUser: false,
        time: "9:20 PM "));
    messages.add(ChatMessage(
        messageContent: "Let's get lunch. How about pizza?",
        isCurrentUser: false,
        time: "9:20 PM "));
    messages.add(ChatMessage(
        messageContent: "Let's get lunch. How about pizza?",
        isCurrentUser: false,
        time: "9:20 PM "));
  }

  @override
  void initState() {
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
          messageContent: textEditingController.text,
          isCurrentUser: true,
          time: convertToTime),
    );
    Timer(const Duration(milliseconds: 100),
        () => controller.jumpTo(controller.position.maxScrollExtent));
  }

  @override
  Widget build(BuildContext context) {
    return CommonBgPage(
      backImagePath: icDashboardBg,
      margin: AppConstants.zero,
      alignment: Alignment.topCenter,
      imagePath: icDashboardimg,
      widget: Scaffold(
        appBar: AppUtils.commonAppBar(
            context: context,
            title: StringUtils.chatRoom,
            isShowEdit: false,
            actionTitle: StringUtils.edit),
        body: Container(
          decoration: AppUtils.containerDecoration(
              color: AppColor.colorDarkBlue, radius: AppConstants.zero),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: AppConstants.ninety),
                child: ListView.builder(
                  controller: controller,
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      top: AppConstants.ten, bottom: AppConstants.ten),
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
                    } else {
                      return ReplyCard(
                        message: messages[index].messageContent,
                        time: messages[index].time,
                      );
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: AppConstants.ninety,
                  alignment: Alignment.topCenter,
                  color: AppColor.colorToolBar,
                  child: Container(
                    margin: EdgeInsets.only(top: AppConstants.fourteen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: AppConstants.ten,
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor:
                                Colors.transparent,
                                context: context,
                                builder: (builder) =>
                                const CustomChatPicker());
                          },
                          icon: Icon(Icons.add,
                              size: AppConstants.thirty,
                              color: AppColor.colorButton),
                        ),
                        SizedBox(
                          width: AppConstants.eight,
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppConstants.fourteen),
                            child: Container(
                              color: Colors.white,
                              child: TextField(
                                textCapitalization: TextCapitalization.sentences,
                                controller: textEditingController,
                                maxLines: AppConstants.five.toInt(),
                                minLines: AppConstants.one.toInt(),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      sendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                onTap: () {
                                  setState(() {
                                    controller.animateTo(
                                        controller.position
                                            .maxScrollExtent,
                                        duration: const Duration(
                                            milliseconds: 300),
                                        curve: Curves.easeInOut);
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: AppConstants.fourteen),
                                  hintText: 'Type a message',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            if (sendButton) {
                              addItemToList();

                              textEditingController.clear();
                              setState(() {
                                sendButton = false;
                              });
                            }
                          },
                          child: AppUtils.commonBg(
                              color: AppColor.colorButton,
                              radius: AppConstants.sixteen,
                              padding: AppConstants.fourteen,
                              right: AppConstants.eight,
                              top: AppConstants.zero,
                              widget: AppUtils.commonImageSVGWidget(
                                  path: icSend,
                                  boxFit: BoxFit.scaleDown,
                                  height: AppConstants.twentyFour,
                                  width: AppConstants.twentyFour)),
                        )
                      ],
                    ),
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
