import 'package:api_request/api_request.dart';
import 'package:halema/core/network/baseModel.dart';
import 'package:halema/core/network/endpoint.dart';

class SendMessageAction extends ApiRequestAction<BaseModel> {
  final int conversationId;
  final String message;

  SendMessageAction({required this.conversationId, required this.message});
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.sendMessage;

  @override
  Map<String, dynamic> get toMap => {
        "conversation_id": conversationId,
        "text": message,
      };
  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (data) => BaseModel.fromJson(data);
}
