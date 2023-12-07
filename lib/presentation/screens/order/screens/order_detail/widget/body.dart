import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';
import 'package:halema/presentation/screens/order/screens/order_detail/widget/child_list.dart';
import 'package:halema/presentation/screens/order/screens/order_detail/widget/contact.dart';
import 'driver.dart';
import 'time_info.dart';

class OrderDetailBody extends StatefulWidget {
  final String statuse;
  final Color color;
  const OrderDetailBody(
      {super.key, required this.statuse, required this.color});

  @override
  State<OrderDetailBody> createState() => _OrderDetailBodyState();
}

class _OrderDetailBodyState extends State<OrderDetailBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},
      bloc: GetIt.I<OrdersCubit>(),
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.02,
            horizontal: screenWidth(context) * 0.04,
          ),
          child: SizedBox(
            width: double.infinity,
            height: screenHeight(context),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight(context),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: widget.color),
                    borderRadius: BorderRadius.circular(
                      screenWidth(context) * 0.07,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight(context) * 0.02,
                    horizontal: screenWidth(context) * 0.02,
                  ),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      ContactItem(
                        userId: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .setter!
                            .user!
                            .id!,
                        name: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .setter!
                            .user!
                            .name!,
                        image: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .setter!
                            .user!
                            .imageUrl!,
                      ),
                      const VerticalSpace(value: 7),
                      DateTimeInfoOrder(
                        days: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .days!
                            .toString(),
                        hours: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .hours!
                            .toString(),
                        date: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .date!,
                        time: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .time!,
                      ),
                      ChildrenOrderList(
                        children: GetIt.I<OrdersCubit>()
                                .orderDetailModel!
                                .order!
                                .children ??
                            [],
                      ),
                      DriverOrderItem(
                        children: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .children!
                            .length
                            .toString(),
                        days: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .days!
                            .toString(),
                        hourPrice: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .setter!
                            .hourPrice!
                            .toString(),
                        hours: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .hours!
                            .toString(),
                        image: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .parent!
                            .drivers![0]
                            .imageUrl!,
                        phone: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .parent!
                            .drivers![0]
                            .phone!,
                        name: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .parent!
                            .drivers![0]
                            .name!,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth(context) * 0.25,
                  height: screenHeight(context) * 0.07,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        screenWidth(context) * 0.07,
                      ),
                      bottomRight: Radius.circular(
                        screenWidth(context) * 0.07,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.statuse,
                      style: bodyStryle(
                        context: context,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
