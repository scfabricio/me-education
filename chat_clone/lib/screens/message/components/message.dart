import 'package:chat_clone/constants.dart';
import 'package:chat_clone/models/chat_message.dart';
import 'package:chat_clone/screens/message/components/audio_message.dart';
import 'package:chat_clone/screens/message/components/message_status_dot.dart';
import 'package:chat_clone/screens/message/components/text_message.dart';
import 'package:chat_clone/screens/message/components/video_message.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  Widget messageContainer(ChatMessage message) {
    switch (message.messageType) {
      case ChatMessageType.text:
        return TextMessage(message: message);
      case ChatMessageType.audio:
        return AudioMessage(message: message);
      case ChatMessageType.video:
        return VideoMessage(message: message);
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/images/user_2.png'),
            ),
            const SizedBox(width: kDefaultPadding / 2),
          ],
          messageContainer(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus),
        ],
      ),
    );
  }
}