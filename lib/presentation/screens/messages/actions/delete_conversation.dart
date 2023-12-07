import 'package:api_request/api_request.dart';

import '../../../../core/network/baseModel.dart';
import '../../../../core/network/endpoint.dart';

class DeleteConversationAction extends ApiRequestAction<BaseModel> {
  final int conversationId;

  DeleteConversationAction(this.conversationId);
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.deleteChat;

  @override
  Map<String, dynamic> get toMap => {
        "id": conversationId,
      };

  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (data) => BaseModel.fromJson(data);
}
