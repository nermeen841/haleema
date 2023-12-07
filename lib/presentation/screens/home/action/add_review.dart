import 'package:api_request/api_request.dart';
import 'package:halema/core/network/baseModel.dart';
import 'package:halema/core/network/endpoint.dart';

class AddReviewAction extends ApiRequestAction<BaseModel> {
  final int id;
  final int numOfStars;
  final String review;

  AddReviewAction(
      {required this.id, required this.numOfStars, required this.review});

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  Map<String, dynamic> get toMap => {
        "id": id,
        "num_of_stars": numOfStars,
        "review": review,
        "type": "setter"
      };

  @override
  bool get authRequired => true;

  @override
  String get path => EndPoint.addRate;

  @override
  ResponseBuilder<BaseModel> get responseBuilder =>
      (data) => BaseModel.fromJson(data);
}
