import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import '../../../../core/constants/constants.dart';
import '../model/profile_model.dart';

class GetProfileActions extends ApiRequestAction<ProfileModel> {
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.getProfile;

  @override
  Map<String, dynamic> get toMap => {
        "id": prefs.getInt("user_id")!,
        "type": 'parent',
      };
  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<ProfileModel> get responseBuilder =>
      (json) => ProfileModel.fromJson(json);
}
