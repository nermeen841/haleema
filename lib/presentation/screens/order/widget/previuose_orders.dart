import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';
import 'package:halema/presentation/screens/order/screens/order_detail/order_detail.dart';
import 'package:halema/presentation/widget/empty_item.dart';
import 'package:halema/presentation/widget/order_card.dart';

class PreviouseOrdersItem extends StatefulWidget {
  const PreviouseOrdersItem({super.key});

  @override
  State<PreviouseOrdersItem> createState() => _PreviouseOrdersItemState();
}

class _PreviouseOrdersItemState extends State<PreviouseOrdersItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},
      bloc: GetIt.I<OrdersCubit>(),
      builder: (context, state) {
        return (GetIt.I<OrdersCubit>().allOrdersModel == null)
            ? loading()
            : (GetIt.I<OrdersCubit>().allOrdersModel!.order!.data!.isEmpty)
                ? EmptyItem(
                    image: AppIcons.emptyOrdersIcon,
                    title: translateString(
                        "There is no request yet", "لا يوجد طلب حتى الآن"),
                    content: translateString(
                        "When you have requests, you will find them here",
                        "عندما يكون لديك طلبات ، سوف تجدها هنا"),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        GetIt.I<OrdersCubit>().getOrderDetail(
                            GetIt.I<OrdersCubit>()
                                .allOrdersModel!
                                .order!
                                .data![index]
                                .id!);
                        MagicRouter.navigateTo(OrderDetailScreen(
                          orderId: GetIt.I<OrdersCubit>()
                              .allOrdersModel!
                              .order!
                              .data![index]
                              .id!,
                          statuse: GetIt.I<OrdersCubit>()
                                  .allOrdersModel!
                                  .order!
                                  .data![index]
                                  .status ??
                              "",
                          color: (GetIt.I<OrdersCubit>()
                                      .allOrdersModel!
                                      .order!
                                      .data![index]
                                      .status ==
                                  "completed")
                              ? Colors.grey
                              : (GetIt.I<OrdersCubit>()
                                          .allOrdersModel!
                                          .order!
                                          .data![index]
                                          .status ==
                                      "refused")
                                  ? colorOrange
                                  : colorRed,
                        ));
                      },
                      child: OrderCardItem(
                        orderStatuse: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .status!,
                        orderColor: (GetIt.I<OrdersCubit>()
                                    .allOrdersModel!
                                    .order!
                                    .data![index]
                                    .status ==
                                "completed")
                            ? Colors.grey
                            : (GetIt.I<OrdersCubit>()
                                        .allOrdersModel!
                                        .order!
                                        .data![index]
                                        .status ==
                                    "refused")
                                ? colorOrange
                                : colorRed,
                        childCount: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .children!
                            .length
                            .toString(),
                        hours: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .hours!
                            .toString(),
                        date: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .date!,
                        days: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .days!
                            .toString(),
                        hourPrice: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .setter!
                            .hourPrice!,
                        rate: (GetIt.I<OrdersCubit>()
                                    .allOrdersModel!
                                    .order!
                                    .data![index]
                                    .setter!
                                    .user!
                                    .avgNumOfStars !=
                                null)
                            ? GetIt.I<OrdersCubit>()
                                .allOrdersModel!
                                .order!
                                .data![index]
                                .setter!
                                .user!
                                .avgNumOfStars
                                .toString()
                            : "0.0",
                        image: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .setter!
                            .user!
                            .imageUrl!,
                        name: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .setter!
                            .user!
                            .name!,
                        time: GetIt.I<OrdersCubit>()
                            .allOrdersModel!
                            .order!
                            .data![index]
                            .time!,
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const VerticalSpace(value: 1),
                    itemCount: GetIt.I<OrdersCubit>()
                        .allOrdersModel!
                        .order!
                        .data!
                        .length,
                  );
      },
    );
  }
}
