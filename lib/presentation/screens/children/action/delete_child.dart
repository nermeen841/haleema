import 'package:api_request/api_request.dart';
import 'package:halema/core/network/baseModel.dart';
import 'package:halema/core/network/endpoint.dart';

class DeleteChildAction extends ApiRequestAction<BaseModel> {
  final int childId;

  DeleteChildAction(this.childId);
  @override
  RequestMethod get method => RequestMethod.DELETE;

  @override
  String get path => "${EndPoint.deleteChildren}$childId";

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (data) => BaseModel.fromJson(data);
}
