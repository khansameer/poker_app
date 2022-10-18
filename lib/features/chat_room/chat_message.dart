class ChatMessage {
  String messageContent;
  bool isCurrentUser =false;
  String? time;

  ChatMessage(
      {required this.messageContent, required this.isCurrentUser , this.time});
}
