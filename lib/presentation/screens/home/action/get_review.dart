import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';

import '../model/get_review_model.dart';

class GetReviewActions extends ApiRequestAction<GetReviewModel> {
  final int reviewId;

  GetReviewActions(this.reviewId);
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => "${EndPoint.getReview}/$reviewId";

  @override
  bool get authRequired => true;
  @override
  ResponseBuilder<GetReviewModel> get responseBuilder =>
      (json) => GetReviewModel.fromJson(json);
}
