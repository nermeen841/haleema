import 'package:api_request/api_request.dart';
import 'package:halema/core/network/baseModel.dart';
import 'package:halema/core/network/endpoint.dart';

class AddtoFavouriteAction extends ApiRequestAction<BaseModel> {
  final int setterId;

  AddtoFavouriteAction({required this.setterId});
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.addtofavourite;

  @override
  bool get authRequired => true;

  @override
  Map<String, dynamic> get toMap => {
        "setter_id": setterId,
      };
  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (data) => BaseModel.fromJson(data);
}
