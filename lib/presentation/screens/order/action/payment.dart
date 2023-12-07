import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/order/model/payment_model.dart';

class PaymentAction extends ApiRequestAction<PaymentModel> {
  final int orderId;

  PaymentAction({required this.orderId});
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "${EndPoint.payment}$orderId";

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<PaymentModel> get responseBuilder =>
      (data) => PaymentModel.fromJson(data);
}
