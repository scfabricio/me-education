import 'package:chat_clone/constants.dart';
import 'package:chat_clone/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({
    super.key,
    required this.status,
  });

  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch(status) {
        case MessageStatus.notSent: return kErrorColor;
        case MessageStatus.notView: return Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.1);
        case MessageStatus.viewed: return kPrimaryColor;
        default: return Colors.transparent;
      }
    }
    
    return Container(
      margin: const EdgeInsets.only(left: kDefaultPadding / 2),
      width: 12,
      height: 12,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.notSent ? Icons.close : Icons.done,
        size: 8,
        color: dotColor(status),
      ),
    );
  }
}
