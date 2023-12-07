import 'package:flutter/material.dart';
import 'package:halema/presentation/screens/messages/widget/cht_body_appbar.dart';

import '../widget/chat_view.dart';

class ChatBodyScreen extends StatefulWidget {
  final String recieverName;
  final String recieverImage;
  const ChatBodyScreen(
      {super.key, required this.recieverName, required this.recieverImage});

  @override
  State<ChatBodyScreen> createState() => _ChatBodyScreenState();
}

class _ChatBodyScreenState extends State<ChatBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatbodyAppbar(
        title: widget.recieverName,
        context: context,
        image: widget.recieverImage,
      ),
      body: const ChatView(),
    );
  }
}
