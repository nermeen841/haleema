import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/support/model/make_ticket.dart';

class MakeTicketAction extends ApiRequestAction<MakeTicketModel> {
  final int? setterId;
  final String problem;
  final String description;

  MakeTicketAction({
    this.setterId,
    required this.problem,
    required this.description,
  });
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.makeAticket;

  @override
  bool get authRequired => true;

  @override
  Map<String, dynamic> get toMap => (setterId != null)
      ? {
          "setter_id": setterId,
          "problem": problem,
          "description": description,
        }
      : {
          "problem": problem,
          "description": description,
        };

  @override
  ResponseBuilder<MakeTicketModel> get responseBuilder =>
      (json) => MakeTicketModel.fromJson(json);
}
