import 'package:api_request/api_request.dart';
import 'package:dio/dio.dart';
import 'package:halema/core/network/endpoint.dart';
import '../model/add_child.dart';

class AddChildAction extends ApiRequestAction<AddChildModel> {
  final MultipartFile image;
  final String gender;
  final String birthdate;
  final String hopy;
  final String disease;
  final String note;
  final String name;
  final int havedisease;

  AddChildAction({
    required this.image,
    required this.gender,
    required this.birthdate,
    required this.hopy,
    required this.disease,
    required this.note,
    required this.name,
    required this.havedisease,
  });
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.addChildren;

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
      };
  @override
  bool get authRequired => true;

  @override
  ContentDataType? get contentDataType => ContentDataType.formData;

  @override
  ResponseBuilder<AddChildModel> get responseBuilder =>
      (data) => AddChildModel.fromJson(data);
}
