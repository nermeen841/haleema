import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';
import 'widget/body.dart';

class CheckoutScreen extends StatefulWidget {
  final List<int> childIds;
  final int setterId;
  final String hourPrice;
  final String date;
  final String time;
  final int days;
  final double long;
  final double lat;
  final int hours;
  final num discount;
  final int driverId;
  const CheckoutScreen({
    super.key,
    required this.childIds,
    required this.setterId,
    required this.hourPrice,
    required this.date,
    required this.time,
    required this.days,
    required this.long,
    required this.lat,
    required this.hours,
    required this.discount,
    required this.driverId,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Checkout", "الدفع"), context: context),
      body: CheckoutBody(
        days: widget.days.toString(),
        hours: widget.hours.toString(),
        children: widget.childIds.length.toString(),
        hourPrice: widget.hourPrice,
      ),
      bottomNavigationBar: Container(
        height: screenHeight(context) * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth(context) * 0.07),
            topRight: Radius.circular(screenWidth(context) * 0.07),
          ),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocConsumer<OrdersCubit, OrdersState>(
              listener: (context, state) {},
              bloc: GetIt.I<OrdersCubit>(),
              builder: (context, state) {
                return SizedBox(
                  width: screenWidth(context) * 0.4,
                  child: (state is! MakeOrderLoadingState)
                      ? CustomGeneralButton(
                          onTap: () => GetIt.I<OrdersCubit>().makeOrder(
                            context: context,
                            hourPrice: widget.hourPrice,
                            childIds: widget.childIds,
                            setterId: widget.setterId,
                            date: widget.date,
                            time: widget.time,
                            days: widget.days,
                            long: widget.long,
                            lat: widget.lat,
                            hours: widget.hours,
                            discount:
                                (GetIt.I<OrdersCubit>().discountValue != null)
                                    ? num.parse(
                                        GetIt.I<OrdersCubit>().discountValue!)
                                    : 0.0,
                            driverId: widget.driverId,
                          ),
                          text: translateString("Done", "موافق"),
                        )
                      : loading(),
                );
              },
            ),
            SizedBox(
              width: screenWidth(context) * 0.4,
              child: CustomGeneralButton(
                color: Colors.transparent,
                textColor: kMainColor,
                onTap: () => MagicRouter.pop(),
                text: translateString("Previuose", "السابق"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
