import 'package:api_request/api_request.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/endpoint.dart';
import '../model/user_model.dart';

class RegisterActions extends ApiRequestAction<UserModel> {
  final String email;
  final String phone;
  MultipartFile? image;
  final String name;
  final String nationality;
  final String phoneCode;

  RegisterActions({
    required this.email,
    required this.phone,
    required this.image,
    required this.name,
    required this.nationality,
    required this.phoneCode,
  });
  @override
  RequestMethod get method => RequestMethod.POST;
  @override
  ContentDataType? get contentDataType => ContentDataType.formData;
  @override
  Map<String, dynamic> get toMap => (image != null)
      ? {
          "email": email,
          "phone": phone,
          "image": image,
          "name": name,
          "nationality": nationality,
          "phone_code": phoneCode,
          "fcm_key": prefs.getString("firebase_token") ?? "",
        }
      : {
          "email": email,
          "phone": phone,
          // "image": image,
          "name": name,
          "nationality": nationality,
          "phone_code": phoneCode,
          "fcm_key": prefs.getString("firebase_token") ?? "",
        };
  @override
  String get path => EndPoint.REGISTER;

  @override
  ResponseBuilder<UserModel> get responseBuilder =>
      (json) => UserModel.fromJson(json);
}
