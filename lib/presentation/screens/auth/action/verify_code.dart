import 'package:api_request/api_request.dart';
import '../../../../core/network/endpoint.dart';
import '../model/verify_code_model.dart';

class VerifyActions extends ApiRequestAction<VerifyCodeModel> {
  final String code;
  final String phone;

  VerifyActions({
    required this.code,
    required this.phone,
  });
  @override
  RequestMethod get method => RequestMethod.POST;
  @override
  Map<String, dynamic> get toMap => {
        "code": code,
        "phone": phone,
      };
  @override
  String get path => EndPoint.VerifyCode;

  @override
  ResponseBuilder<VerifyCodeModel> get responseBuilder =>
      (json) => VerifyCodeModel.fromJson(json);
}
