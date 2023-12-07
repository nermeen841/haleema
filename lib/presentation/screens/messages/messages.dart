import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'cubit/message_cubit.dart';
import 'widget/chat_list.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    GetIt.I<MessageCubit>().getConversations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Messages", "الرسائل"), context: context),
      body: BlocConsumer<MessageCubit, MessageState>(
        listener: (context, state) {},
        bloc: GetIt.I<MessageCubit>(),
        builder: (context, state) {
          return (GetIt.I<MessageCubit>().conversationModel == null)
              ? loading()
              : const ChatList();
        },
      ),
    );
  }
}
