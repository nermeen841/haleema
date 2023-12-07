import 'package:api_request/api_request.dart';
import 'package:dio/dio.dart';
import 'package:halema/core/network/endpoint.dart';

import '../../children/model/add_child.dart';

class AddDriverAction extends ApiRequestAction<AddChildModel> {
  final MultipartFile image;
  final String gender;
  final String birthdate;
  final String nationality;
  final String email;
  final String phone;
  final String name;
  final String phoneCode;

  AddDriverAction({
    required this.image,
    required this.gender,
    required this.birthdate,
    required this.nationality,
    required this.email,
    required this.phone,
    required this.name,
    required this.phoneCode,
  });
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.adddriver;

  @override
  Map<String, dynamic> get toMap => {
        "name": name,
        "image": image,
        "gender": gender,
        "date_of_birth": birthdate,
        "nationality": nationality,
        "phone_code": phoneCode,
        "email": email,
        "phone": phone,
      };
  @override
  bool get authRequired => true;

  @override
  ContentDataType? get contentDataType => ContentDataType.formData;

  @override
  ResponseBuilder<AddChildModel> get responseBuilder =>
      (data) => AddChildModel.fromJson(data);
}
