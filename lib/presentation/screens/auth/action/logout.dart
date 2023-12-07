import 'package:api_request/api_request.dart';

import '../../../../core/network/endpoint.dart';
import '../model/logout_model.dart';

class LogoutActions extends ApiRequestAction<LogoutModel> {
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.logout;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<LogoutModel> get responseBuilder =>
      (json) => LogoutModel.fromJson(json);
}
