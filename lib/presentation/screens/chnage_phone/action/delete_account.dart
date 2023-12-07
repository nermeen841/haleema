import 'package:api_request/api_request.dart';

import '../../../../core/network/baseModel.dart';
import '../../../../core/network/endpoint.dart';

class DeleteAccountAction extends ApiRequestAction<BaseModel> {
  final String code;

  DeleteAccountAction({required this.code});
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.deleteAccount;

  @override
  Map<String, dynamic> get toMap => {
        "code": code,
      };

  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (json) => BaseModel.fromJson(json);
}
