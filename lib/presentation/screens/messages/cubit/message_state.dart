part of 'message_cubit.dart';

@immutable
class MessageState {}

class MessageInitial extends MessageState {}

class GetConversationLoadingState extends MessageState {}

class GetConversationErrorState extends MessageState {}

class GetConversationSuccessState extends MessageState {}

class MessagesLoadingState extends MessageState {}

class MessagesErrorState extends MessageState {}

class MessagesSuccessState extends MessageState {}

class SendMessageLoadingState extends MessageState {}

class SendMessagesErrorState extends MessageState {}

class SendMessagesSuccessState extends MessageState {}

class DeleteChatLoadingState extends MessageState {}

class DeleteChatsErrorState extends MessageState {}

class DeleteChatsSuccessState extends MessageState {}
