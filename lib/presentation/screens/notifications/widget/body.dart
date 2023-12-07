import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/notifications/cubit/notification_cubit.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';
import 'package:halema/presentation/screens/order/screens/order_detail/order_detail.dart';
import 'package:halema/presentation/widget/empty_item.dart';
import 'package:halema/presentation/widget/notification_card.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({super.key});

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {},
      bloc: GetIt.I<NotificationCubit>(),
      builder: (context, state) {
        return (GetIt.I<NotificationCubit>().notificationModel != null)
            ? SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context) * 0.03,
                  horizontal: screenWidth(context) * 0.03,
                ),
                child: (GetIt.I<NotificationCubit>()
                        .notificationModel!
                        .notifications!
                        .data!
                        .isNotEmpty)
                    ? ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => GetIt.I<OrdersCubit>()
                              .getOrderDetail(GetIt.I<NotificationCubit>()
                                  .notificationModel!
                                  .notifications!
                                  .data![index]
                                  .order!
                                  .id!)
                              .then(
                                (value) => MagicRouter.navigateTo(
                                  OrderDetailScreen(
                                    statuse: GetIt.I<NotificationCubit>()
                                            .notificationModel!
                                            .notifications!
                                            .data![index]
                                            .order!
                                            .status ??
                                        "new",
                                    color: (GetIt.I<NotificationCubit>()
                                                .notificationModel!
                                                .notifications!
                                                .data![index]
                                                .order!
                                                .status ==
                                            "completed")
                                        ? Colors.grey
                                        : (GetIt.I<NotificationCubit>()
                                                    .notificationModel!
                                                    .notifications!
                                                    .data![index]
                                                    .order!
                                                    .status ==
                                                "refused")
                                            ? colorOrange
                                            : (GetIt.I<NotificationCubit>()
                                                        .notificationModel!
                                                        .notifications!
                                                        .data![index]
                                                        .order!
                                                        .status ==
                                                    "rejected")
                                                ? colorRed
                                                : colorYellow,
                                    orderId: GetIt.I<NotificationCubit>()
                                        .notificationModel!
                                        .notifications!
                                        .data![index]
                                        .order!
                                        .id!,
                                  ),
                                ),
                              ),
                          child: NotificationCardItem(
                            title: GetIt.I<NotificationCubit>()
                                .notificationModel!
                                .notifications!
                                .data![index]
                                .title!,
                            body: GetIt.I<NotificationCubit>()
                                .notificationModel!
                                .notifications!
                                .data![index]
                                .body!,
                            id: GetIt.I<NotificationCubit>()
                                .notificationModel!
                                .notifications!
                                .data![index]
                                .id!,
                            createAt: GetIt.I<NotificationCubit>()
                                .notificationModel!
                                .notifications!
                                .data![index]
                                .createdAt!,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const VerticalSpace(value: 2),
                        itemCount: GetIt.I<NotificationCubit>()
                            .notificationModel!
                            .notifications!
                            .data!
                            .length,
                      )
                    : EmptyItem(
                        image: AppIcons.noNotifIcon,
                        title: translateString(
                            "No notifications here yet", "لا أشعارات حتى الآن"),
                        content: translateString(
                            "When you receive notifications, they will appear here",
                            "عندما تتلقى إشعارات ، ستظهر هنا"),
                      ),
              )
            : loading();
      },
    );
  }
}
