import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';

class RecieptItem extends StatelessWidget {
  final String days;
  final String hours;
  final String children;
  final String hourPrice;

  const RecieptItem(
      {super.key,
      required this.days,
      required this.hours,
      required this.children,
      required this.hourPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.02,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    translateString("Children count", "عدد الاطفال"),
                    style: bodyStryle(
                      context: context,
                      color: colorGrey,
                    ),
                  ),
                  const VerticalSpace(value: 1),
                  Text(
                    children,
                    style: headingStyle2(
                      context: context,
                      color: colorGrey,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    translateString("Days count", "عدد الايام"),
                    style: bodyStryle(
                      context: context,
                      color: colorGrey,
                    ),
                  ),
                  const VerticalSpace(value: 1),
                  Text(
                    days,
                    style: headingStyle2(
                      context: context,
                      color: colorGrey,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    translateString("Hours count", "عدد الساعات"),
                    style: bodyStryle(
                      context: context,
                      color: colorGrey,
                    ),
                  ),
                  const VerticalSpace(value: 1),
                  Text(
                    hours,
                    style: headingStyle2(
                      context: context,
                      color: colorGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const VerticalSpace(value: 2),
          Divider(
            color: colorGrey.withOpacity(0.2),
          ),
          const VerticalSpace(value: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translateString("Total Hours", "أجمالي عدد الساعات"),
                style: bodyStryle(
                  context: context,
                  color: colorGreyLight,
                ),
              ),
              Text(
                translateString("$hours Hours", "$hours ساعه"),
                style: bodyStryle(
                  context: context,
                  color: colorBlack,
                ),
              ),
            ],
          ),
          const VerticalSpace(value: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translateString("Hour price", "سعر الساعة"),
                style: bodyStryle(
                  context: context,
                  color: colorGreyLight,
                ),
              ),
              Text(
                translateString("$hourPrice R.S", "$hourPrice ر.س"),
                style: bodyStryle(
                  context: context,
                  color: colorBlack,
                ),
              ),
            ],
          ),
          const VerticalSpace(value: 1),
          BlocConsumer<OrdersCubit, OrdersState>(
            listener: (context, state) {},
            bloc: GetIt.I<OrdersCubit>(),
            builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translateString("Discount", "الخصم"),
                    style: bodyStryle(
                      context: context,
                      color: kMainColor,
                    ),
                  ),
                  Text(
                    (GetIt.I<OrdersCubit>().discountValue != null)
                        ? translateString(
                            "${GetIt.I<OrdersCubit>().discountValue} R.S",
                            "${GetIt.I<OrdersCubit>().discountValue} ر.س")
                        : translateString("0.0 R.S", "0.0 ر.س"),
                    style: bodyStryle(
                      context: context,
                      color: kMainColor,
                    ),
                  ),
                ],
              );
            },
          ),
          const VerticalSpace(value: 2),
          Divider(
            color: colorGrey.withOpacity(0.2),
          ),
          const VerticalSpace(value: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translateString("Total price : ", "إجمالي المبلغ : "),
                style: headingStyle3(
                  context: context,
                  color: colorBlack,
                ),
              ),
              BlocConsumer<OrdersCubit, OrdersState>(
                listener: (context, state) {},
                bloc: GetIt.I<OrdersCubit>(),
                builder: (context, state) {
                  return Text(
                    (GetIt.I<OrdersCubit>().discountValue != null)
                        ? translateString(
                            "${getOrderPrice(hours: int.parse(hours), hoursPrice: num.parse(hourPrice), discount: num.parse(GetIt.I<OrdersCubit>().discountValue!))} R.S",
                            "${getOrderPrice(hours: int.parse(hours), hoursPrice: num.parse(hourPrice), discount: num.parse(GetIt.I<OrdersCubit>().discountValue!))} ريال سعودي")
                        : translateString(
                            "${getOrderPrice(hours: int.parse(hours), hoursPrice: num.parse(hourPrice), discount: 0)} R.S",
                            "${getOrderPrice(hours: int.parse(hours), hoursPrice: num.parse(hourPrice), discount: 0)} ريال سعودي"),
                    style: headingStyle3(
                      context: context,
                      color: colorBlack,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
