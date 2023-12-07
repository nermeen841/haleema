import 'package:api_request/api_request.dart';

import '../../../../core/network/baseModel.dart';
import '../../../../core/network/endpoint.dart';

class ResendcodeAction extends ApiRequestAction<BaseModel> {
  final String phone;

  ResendcodeAction(this.phone);
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.resendCode;

  @override
  Map<String, dynamic> get toMap => {
        "phone": phone,
      };

  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (json) => BaseModel.fromJson(json);
}
