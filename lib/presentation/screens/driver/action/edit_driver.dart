import 'package:api_request/api_request.dart';
import 'package:dio/dio.dart';
import 'package:halema/core/network/endpoint.dart';

import '../../children/model/add_child.dart';

class EditDriverAction extends ApiRequestAction<AddChildModel> {
  final MultipartFile? image;
  final String? gender;
  final String? birthdate;
  final String? nationality;
  final String? email;
  final String? phone;
  final String? name;
  final String? phoneCode;
  final int id;

  EditDriverAction({
    this.image,
    this.gender,
    this.birthdate,
    this.nationality,
    this.email,
    this.phone,
    this.name,
    this.phoneCode,
    required this.id,
  });
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.editdriver;

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
        "id": id,
      }..removeWhere((key, value) => value == null);
  @override
  bool get authRequired => true;

  @override
  ContentDataType? get contentDataType => ContentDataType.formData;

  @override
  ResponseBuilder<AddChildModel> get responseBuilder =>
      (data) => AddChildModel.fromJson(data);
}
