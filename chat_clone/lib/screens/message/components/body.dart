import 'package:chat_clone/screens/message/components/message.dart';
import 'package:flutter/material.dart';
import 'package:chat_clone/constants.dart';
import 'package:chat_clone/models/chat_message.dart';
import './chart_input_field.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        const ChartInputField()
      ],
    );
  }
}
