import 'package:chat_clone/components/filled_outiline_button.dart';
import 'package:chat_clone/constants.dart';
import 'package:chat_clone/screens/message/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_clone/models/chat.dart';
import './chat_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              const SizedBox(width: kDefaultPadding),
              FillOutlineButton(press: () {}, text: "Active", isFilled: true),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessageScreen(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
