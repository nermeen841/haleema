import 'package:api_request/api_request.dart';
import 'package:dio/dio.dart';
import 'package:halema/core/network/baseModel.dart';
import 'package:halema/core/network/endpoint.dart';

class EditChildAction extends ApiRequestAction<BaseModel> {
  final MultipartFile? image;
  final String? gender;
  final String? birthdate;
  final String? hopy;
  final String? disease;
  final String? note;
  final String? name;
  final int? havedisease;
  final int id;

  EditChildAction({
    this.image,
    this.gender,
    this.birthdate,
    this.hopy,
    this.disease,
    this.note,
    this.name,
    this.havedisease,
    required this.id,
  });
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.editChildren;

  @override
  Map<String, dynamic> get toMap => {
        "name": name,
        "image": image,
        "gender": gender,
        "date_of_birth": birthdate,
        "hobby": hopy,
        "is_diseased": havedisease,
        "disease": disease,
        "note": note,
        "id": id,
      }..removeWhere((key, value) => value == null);

  @override
  bool get authRequired => true;
  @override
  ContentDataType? get contentDataType => ContentDataType.formData;

  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (data) => BaseModel.fromJson(data);
}
