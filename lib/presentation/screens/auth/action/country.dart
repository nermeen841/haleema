import 'package:api_request/api_request.dart';
import '../../../../core/network/endpoint.dart';
import '../model/country.dart';

class CountryAction extends ApiRequestAction<CountryModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => EndPoint.country;

  @override
  ResponseBuilder<CountryModel> get responseBuilder =>
      (json) => CountryModel.fromJson(json);
}
