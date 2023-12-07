import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/favourite/model/favourite.dart';

class GetFavouriteAction extends ApiRequestAction<FavouriteModel> {
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => EndPoint.getfavourite;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<FavouriteModel> get responseBuilder =>
      (data) => FavouriteModel.fromJson(data);
}
