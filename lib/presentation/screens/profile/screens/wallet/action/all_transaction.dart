import 'package:api_request/api_request.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/endpoint.dart';
import '../model/all_transaction.dart';

class AllTransactionAction extends ApiRequestAction<AllTransactionModel> {
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.AllTransaction;

  @override
  bool get authRequired => true;

  @override
  Map<String, dynamic> get toMap => {
        "user_id": prefs.getInt("user_id")!,
      };
  @override
  ResponseBuilder<AllTransactionModel> get responseBuilder =>
      (json) => AllTransactionModel.fromJson(json);
}
