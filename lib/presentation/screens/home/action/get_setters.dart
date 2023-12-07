import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/home/model/get_setters_model.dart';

class GetSettersActions extends ApiRequestAction<GetSettersModel> {
  final String search;

  GetSettersActions(this.search);
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.getSetters;

  @override
  bool get authRequired => true;

  @override
  Map<String, dynamic> get toMap => {
        "search": search,
      };
  @override
  ResponseBuilder<GetSettersModel> get responseBuilder =>
      (json) => GetSettersModel.fromJson(json);
}
