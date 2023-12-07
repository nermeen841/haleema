import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';

import '../model/order_detail.dart';

class OrderDetailAction extends ApiRequestAction<OrderDetailModel> {
  final int orderId;

  OrderDetailAction(this.orderId);
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.orderDetail;

  @override
  Map<String, dynamic> get toMap => {
        "order_id": orderId,
        "type": "parent",
      };

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<OrderDetailModel> get responseBuilder =>
      (data) => OrderDetailModel.fromJson(data);
}
