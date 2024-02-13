import 'package:chat_clone/constants.dart';
import 'package:chat_clone/screens/message/components/body.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/user_2.png'),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kristin Watson', style: TextStyle(fontSize: 16)),
              Text('Online',  style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.local_phone)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
