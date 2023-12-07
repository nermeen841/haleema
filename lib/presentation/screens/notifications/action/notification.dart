import 'package:api_request/api_request.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/presentation/screens/notifications/model/notifications.dart';

class AllNotificationAction extends ApiRequestAction<NotificationModel> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => EndPoint.notification;

  @override
  bool get authRequired => true;

  @override
  ResponseBuilder<NotificationModel> get responseBuilder =>
      (json) => NotificationModel.fromJson(json);
}
