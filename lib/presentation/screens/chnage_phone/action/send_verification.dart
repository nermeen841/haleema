import 'package:api_request/api_request.dart';

import '../../../../core/network/endpoint.dart';
import '../model/send_verification.dart';

class SendVerificationCodeAction
    extends ApiRequestAction<SendVerifiacationModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => EndPoint.sendVerificationCode;

  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<SendVerifiacationModel> get responseBuilder =>
      (json) => SendVerifiacationModel.fromJson(json);
}
