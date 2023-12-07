import 'package:api_request/api_request.dart';

import '../../../../core/network/endpoint.dart';
import '../model/delete_account_model.dart';

class DeleteAccountActions extends ApiRequestAction<DeleteAccountModel> {
  @override
  RequestMethod get method => RequestMethod.DELETE;

  @override
  String get path => EndPoint.DeleteAccount;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<DeleteAccountModel> get responseBuilder =>
      (json) => DeleteAccountModel.fromJson(json);
}
