import 'package:api_request/api_request.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/network/baseModel.dart';
import 'package:halema/core/network/endpoint.dart';

class CancelOrderAction extends ApiRequestAction<BaseModel> {
  final int orderId;
  final String status;

  CancelOrderAction({required this.orderId, required this.status});
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.cancelOrder;

  @override
  bool get authRequired => true;

  @override
  Map<String, dynamic> get toMap => {
        "order_id": orderId,
        "status": status,
        "lang": prefs.getString("lang") ?? "ar",
      };

  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (data) => BaseModel.fromJson(data);
}
