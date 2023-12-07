import 'package:api_request/api_request.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/endpoint.dart';
import '../model/amount.dart';

class TotalAmountAction extends ApiRequestAction<TotalAmountModel> {
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.totalAmount;

  @override
  bool get authRequired => true;

  @override
  Map<String, dynamic> get toMap => {
        "user_id": prefs.getInt("user_id")!,
        "type": "setter",
      };
  @override
  ResponseBuilder<TotalAmountModel> get responseBuilder =>
      (json) => TotalAmountModel.fromJson(json);
}
