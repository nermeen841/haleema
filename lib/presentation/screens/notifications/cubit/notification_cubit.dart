import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../action/notification.dart';
import '../model/notifications.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  NotificationModel? notificationModel;
  Future getnotification() async {
    emit(NotificationLoadingStat());
    await AllNotificationAction().run().then(
          (value) => value.fold(
            (l) {
              debugPrint(l.message);
              emit(NotificationError());
            },
            (r) {
              notificationModel = r;
              emit(NotificationSuccess());
              return notificationModel;
            },
          ),
        );
  }
}
