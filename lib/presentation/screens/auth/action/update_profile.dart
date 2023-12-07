import 'package:api_request/api_request.dart';
import '../../../../core/network/endpoint.dart';
import '../model/profile_model.dart';

class UpdateProfileActions extends ApiRequestAction<ProfileModel> {
  final String? email;
  final dynamic image;
  final String? name;
  final String? nationality;
  final String? nationalId;
  final String? dateOfBirth;
  final String? address;
  final double? long;
  final double? lat;
  final String? gender;

  UpdateProfileActions({
    this.email,
    this.name,
    this.image,
    this.nationality,
    this.nationalId,
    this.dateOfBirth,
    this.address,
    this.long,
    this.lat,
    this.gender,
  });

  @override
  bool get authRequired => true;
  @override
  RequestMethod get method => RequestMethod.POST;
  @override
  ContentDataType? get contentDataType => ContentDataType.formData;
  @override
  Map<String, dynamic> get toMap => {
        "email": email,
        "image": image,
        "name": name,
        "nationality": nationality,
        "national_id": nationalId,
        "address": address,
        "nationalId": nationalId,
        "date_of_birth": dateOfBirth,
        "long": long,
        "lat": lat,
        "gender": gender,
      }..removeWhere((key, value) => value == null);

  @override
  String get path => EndPoint.updateProfile;

  @override
  ResponseBuilder<ProfileModel> get responseBuilder =>
      (json) => ProfileModel.fromJson(json);
}
