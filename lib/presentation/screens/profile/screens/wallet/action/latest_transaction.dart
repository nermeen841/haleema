import 'package:api_request/api_request.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/endpoint.dart';
import '../model/latest_transaction.dart';

class LatestTransactionAction extends ApiRequestAction<LatestTransactionModel> {
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.latestTransaction;

  @override
  bool get authRequired => true;

  @override
  Map<String, dynamic> get toMap => {
        "user_id": prefs.getInt("user_id")!,
      };
  @override
  ResponseBuilder<LatestTransactionModel> get responseBuilder =>
      (json) => LatestTransactionModel.fromJson(json);
}
