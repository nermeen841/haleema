import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/screens/layout/layout.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';
import 'package:halema/presentation/screens/order/screens/order_detail/widget/body.dart';
import 'package:halema/presentation/screens/order/screens/order_detail/widget/bottom_nav.dart';
import 'widget/image.dart';

class OrderDetailScreen extends StatefulWidget {
  final String statuse;
  final Color color;
  final int orderId;
  const OrderDetailScreen(
      {super.key,
      required this.statuse,
      required this.color,
      required this.orderId});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNoTitle(),
      bottomNavigationBar: OrderDetailBottomNavitem(
        statuse: widget.statuse,
        orderId: widget.orderId,
      ),
      body: BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) {},
        bloc: GetIt.I<OrdersCubit>(),
        builder: (context, state) {
          return (GetIt.I<OrdersCubit>().orderDetailModel != null)
              ? SingleChildScrollView(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      SizedBox(
                        height: screenHeight(context),
                        child: Scaffold(
                          appBar: customAppbar(
                            title: "",
                            context: context,
                            press: () => MagicRouter.navigateAndPopAll(
                              const LayoutScreen(
                                index: 1,
                              ),
                            ),
                          ),
                          body: OrderDetailBody(
                            statuse: widget.statuse,
                            color: widget.color,
                          ),
                        ),
                      ),
                      BbbySitterInfo(
                        id: GetIt.I<OrdersCubit>()
                            .orderDetailModel!
                            .order!
                            .setter!
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
                        raet: GetIt.I<OrdersCubit>()
                                .orderDetailModel!
                                .order!
                                .setter!
                                .user!
                                .avgNumOfStars ??
                            "0",
                      ),
                    ],
                  ),
                )
              : loading();
        },
      ),
    );
  }
}
