import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';

import '../model/get_setter_detail_model.dart';

class GetSetterDetailActions extends ApiRequestAction<GetSetterDetailModel> {
  final int setterId;

  GetSetterDetailActions(this.setterId);
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "${EndPoint.getSettersDetails}/$setterId";

  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<GetSetterDetailModel> get responseBuilder =>
      (json) => GetSetterDetailModel.fromJson(json);
}
