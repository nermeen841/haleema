import 'package:api_request/api_request.dart';
import 'package:halema/core/constants/constants.dart';
import '../../../../core/network/endpoint.dart';
import '../model/user_model.dart';

class LoginActions extends ApiRequestAction<UserModel> {
  final String phone;
  LoginActions({
    required this.phone,
  });
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  Map<String, dynamic> get toMap => {
        "phone": phone,
        "fcm_key": prefs.getString("firebase_token") ?? "",
        "type": "parent",
      };
  @override
  String get path => EndPoint.LOGIN;

  @override
  ResponseBuilder<UserModel> get responseBuilder =>
      (json) => UserModel.fromJson(json);
}
