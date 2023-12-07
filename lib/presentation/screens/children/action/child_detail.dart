import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/children/model/child_detail.dart';

class ChildDetailAction extends ApiRequestAction<ChildDetailModel> {
  final int childId;

  ChildDetailAction(this.childId);
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "${EndPoint.childDetail}$childId";

  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<ChildDetailModel> get responseBuilder =>
      (json) => ChildDetailModel.fromJson(json);
}
