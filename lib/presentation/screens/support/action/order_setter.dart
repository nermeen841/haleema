import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/support/model/order_setter.dart';

class OrderSetterAction extends ApiRequestAction<OrderSetterModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => EndPoint.myOrdersSetters;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<OrderSetterModel> get responseBuilder =>
      (json) => OrderSetterModel.fromJson(json);
}
