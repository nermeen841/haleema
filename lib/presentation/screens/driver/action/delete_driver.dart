import 'package:api_request/api_request.dart';
import 'package:halema/core/network/baseModel.dart';
import 'package:halema/core/network/endpoint.dart';

class DeleteDriverAction extends ApiRequestAction<BaseModel> {
  final int id;

  DeleteDriverAction(this.id);
  @override
  RequestMethod get method => RequestMethod.DELETE;

  @override
  String get path => "${EndPoint.deletedriver}$id";

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (data) => BaseModel.fromJson(data);
}
