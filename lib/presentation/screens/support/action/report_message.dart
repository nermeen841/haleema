import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/support/model/report_message.dart';

class ReportMessageAction extends ApiRequestAction<ReportMessageModel> {
  final int threadId;

  ReportMessageAction(this.threadId);
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.threadMessages;

  @override
  bool get authRequired => true;

  @override
  Map<String, dynamic> get toMap => {
        "ticket_id": threadId,
      };

  @override
  ResponseBuilder<ReportMessageModel> get responseBuilder =>
      (json) => ReportMessageModel.fromJson(json);
}
