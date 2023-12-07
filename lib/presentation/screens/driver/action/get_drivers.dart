import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/driver/model/drivers.dart';

class GetDriversAction extends ApiRequestAction<DriversModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => EndPoint.getdriver;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<DriversModel> get responseBuilder =>
      (data) => DriversModel.fromJson(data);
}
