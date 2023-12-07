import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/support/model/ticket_with_thread.dart';

class MyTicketsAction extends ApiRequestAction<TicketWithThreadModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => EndPoint.myTicketsWithThreads;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<TicketWithThreadModel> get responseBuilder =>
      (json) => TicketWithThreadModel.fromJson(json);
}
