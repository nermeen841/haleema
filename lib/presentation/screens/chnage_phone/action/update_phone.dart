import 'package:api_request/api_request.dart';

import '../../../../core/network/baseModel.dart';
import '../../../../core/network/endpoint.dart';

class UpdatePhoneAction extends ApiRequestAction<BaseModel> {
  final String code;
  final String phone;
  final String countryCode;

  UpdatePhoneAction(
      {required this.code, required this.phone, required this.countryCode});
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.updatePhone;

  @override
  Map<String, dynamic> get toMap => {
        "code": code,
        "new_phone": phone,
        "new_phone_code": countryCode,
      };

  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (json) => BaseModel.fromJson(json);
}
