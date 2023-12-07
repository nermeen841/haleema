import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/order/model/coupon.dart';

class DiscountAction extends ApiRequestAction<CouponModel> {
  final String couponCode;

  DiscountAction(this.couponCode);
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.discount;

  @override
  Map<String, dynamic> get toMap => {
        "coupon_code": couponCode,
      };

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<CouponModel> get responseBuilder =>
      (json) => CouponModel.fromJson(json);
}
