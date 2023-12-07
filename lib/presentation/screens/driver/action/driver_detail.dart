import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/driver/model/driver_detail.dart';

class DriverDetailAction extends ApiRequestAction<DriverDetailModel> {
  final int driverId;

  DriverDetailAction(this.driverId);

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "${EndPoint.driverDetail}$driverId";

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<DriverDetailModel> get responseBuilder =>
      (json) => DriverDetailModel.fromJson(json);
}
