import 'package:api_request/api_request.dart';
import 'package:halema/core/network/baseModel.dart';
import 'package:halema/core/network/endpoint.dart';

class MakeTicketThreadAction extends ApiRequestAction<BaseModel> {
  final int ticketId;
  final String message;

  MakeTicketThreadAction(this.ticketId, this.message);
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.makeAticketThread;

  @override
  Map<String, dynamic> get toMap => {
        "ticket_id": ticketId,
        "message": message,
      };
  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (json) => BaseModel.fromJson(json);
}
