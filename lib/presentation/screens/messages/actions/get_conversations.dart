import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/messages/model/conversations.dart';

class GetConversationAction extends ApiRequestAction<ConversationModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => EndPoint.getconversation;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<ConversationModel> get responseBuilder =>
      (data) => ConversationModel.fromJson(data);
}
