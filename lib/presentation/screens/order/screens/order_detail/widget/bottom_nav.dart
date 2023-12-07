import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';
import 'package:halema/presentation/screens/support/cubit/support_cubit.dart';
import 'package:halema/presentation/screens/support/support.dart';

class OrderDetailBottomNavitem extends StatelessWidget {
  final String statuse;
  final int orderId;
  const OrderDetailBottomNavitem(
      {super.key, required this.statuse, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return (statuse == "new")
        ? BlocConsumer<OrdersCubit, OrdersState>(
            listener: (context, state) {},
            bloc: GetIt.I<OrdersCubit>(),
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth(context) * 0.03),
                    topRight: Radius.circular(screenWidth(context) * 0.03),
                  ),
                ),
                width: double.infinity,
                height: screenHeight(context) * 0.1,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context) * 0.03,
                  vertical: screenHeight(context) * 0.015,
                ),
                child: (state is! CancelOrderLoadingState)
                    ? CustomGeneralButton(
                        text:
                            translateString("Cancelling order", "الغاء الطلب"),
                        onTap: () => GetIt.I<OrdersCubit>()
                            .cancelOrder(orderId: orderId, status: "refused"),
                      )
                    : loading(),
              );
            },
          )
        : (statuse == "completed")
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth(context) * 0.03),
                    topRight: Radius.circular(screenWidth(context) * 0.03),
                  ),
                ),
                width: double.infinity,
                height: screenHeight(context) * 0.1,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context) * 0.03,
                  vertical: screenHeight(context) * 0.015,
                ),
                child: CustomGeneralButton(
                  text: translateString("Report a problem", "الابلاغ عن مشكله"),
                  onTap: () {
                    GetIt.I<SupportCubit>().getMytickets();
                    GetIt.I<SupportCubit>().getOrderSetters();
                    MagicRouter.navigateTo(const SupportScreen());
                  },
                ),
              )
            : const SizedBox();
  }
}
