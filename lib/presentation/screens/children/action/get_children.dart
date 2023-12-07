import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/children/model/all_children.dart';

class GetChildrenAction extends ApiRequestAction<AllChildrenModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => EndPoint.getChildren;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<AllChildrenModel> get responseBuilder =>
      (data) => AllChildrenModel.fromJson(data);
}
