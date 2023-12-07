import 'package:api_request/api_request.dart';
import 'package:halema/core/constants/constants.dart';
import '../../../../core/network/endpoint.dart';
import '../model/make_order_model.dart';

class MakeOrderActions extends ApiRequestAction<MakeOrderModel> {
  final List<int> childIds;
  final int setterId;
  final String date;
  final String time;
  final int days;
  final double long;
  final double lat;
  final int hours;
  final num discount;
  final int driverId;

  MakeOrderActions(
      {required this.childIds,
      required this.setterId,
      required this.date,
      required this.time,
      required this.days,
      required this.long,
      required this.lat,
      required this.hours,
      required this.discount,
      required this.driverId});

  @override
  RequestMethod get method => RequestMethod.POST;
  @override
  Map<String, dynamic> get toMap => {
        "child_ids": childIds,
        "setter_id": setterId,
        "date": date,
        "time": time,
        "days": days,
        "long": long,
        "lat": lat,
        "hours": hours,
        "discount": discount,
        "driver_id": driverId,
        "lang": prefs.getString('lang') ?? 'ar',
      };
  @override
  String get path => EndPoint.makeOrder;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<MakeOrderModel> get responseBuilder =>
      (json) => MakeOrderModel.fromJson(json);
}
