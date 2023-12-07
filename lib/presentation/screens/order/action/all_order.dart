import 'package:api_request/api_request.dart';
import 'package:halema/presentation/screens/order/model/all_orders.dart';

import '../../../../core/network/endpoint.dart';

class AllOrdersAction extends ApiRequestAction<AllOrdersModel> {
  final String orderActivity;

  AllOrdersAction(this.orderActivity);
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.getOrder;

  @override
  Map<String, dynamic> get toMap => {
        "order_activity": orderActivity,
        "type": "parent",
      };
  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<AllOrdersModel> get responseBuilder =>
      (json) => AllOrdersModel.fromJson(json);
}
