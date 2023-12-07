import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:halema/core/network/pusher.dart';
import 'package:halema/presentation/screens/messages/actions/delete_conversation.dart';
import 'package:halema/presentation/screens/messages/actions/get_conversations.dart';
import 'package:halema/presentation/screens/messages/actions/messages.dart';
import 'package:halema/presentation/screens/messages/actions/send_message.dart';
import 'package:halema/presentation/screens/messages/model/conversations.dart';
import 'package:halema/presentation/screens/messages/model/message.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  ConversationModel? conversationModel;
  getConversations() async {
    emit(GetConversationLoadingState());
    await GetConversationAction().run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }

              debugPrint(l.message);
              emit(GetConversationErrorState());
            },
            (r) {
              conversationModel = r;
              emit(GetConversationSuccessState());
              return conversationModel;
            },
          ),
        );
  }

  ////////////////////////////////////////////////////////////////////////////
  MessageModel? messageModel;
  getMessages({
    int? userId,
    int? conversationId,
  }) async {
    emit(MessagesLoadingState());
    await GetMessagesAction(
      conversationId: conversationId,
      userId: userId,
    ).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              debugPrint(l.message);
              emit(MessagesErrorState());
            },
            (r) {
              messageModel = r;
              emit(MessagesSuccessState());
              return messageModel;
            },
          ),
        );
  }

  ///////////////////////////////////////////////////////////////////////////
  deleteConversation(int conversationId) async {
    emit(DeleteChatLoadingState());
    await DeleteConversationAction(conversationId).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(DeleteChatsErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(DeleteChatsSuccessState());
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////
  sendMessage({
    required int conversationId,
    required String message,
  }) async {
    emit(SendMessageLoadingState());
    await SendMessageAction(conversationId: conversationId, message: message)
        .run()
        .then(
          (value) => value.fold(
            (l) {
              debugPrint(l.message);
              emit(SendMessagesErrorState());
            },
            (r) {
              emit(SendMessagesSuccessState());
              PusherServices().initPusher(conversationId);
              getMessages(conversationId: conversationId);
              getConversations();
            },
          ),
        );
  }
}
