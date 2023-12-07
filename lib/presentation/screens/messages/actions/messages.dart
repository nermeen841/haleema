import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/messages/model/message.dart';

class GetMessagesAction extends ApiRequestAction<MessageModel> {
  final int? userId;
  final int? conversationId;

  GetMessagesAction({this.userId, this.conversationId});
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => (userId != null)
      ? "${EndPoint.conversationMessage}?user_id=$userId"
      : "${EndPoint.conversationMessage}?conversation_id=$conversationId";

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<MessageModel> get responseBuilder =>
      (data) => MessageModel.fromJson(data);
}
