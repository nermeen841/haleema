import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';

import 'previuose_orders.dart';
import 'recent_orders.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({super.key});

  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  int currentIndex = 0;
  List<String> text = [
    translateString("current orders", "الطلبات الحاليه"),
    translateString("Previous orders", "الطلبات السابقه"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.03,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight(context) * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth(context) * 0.04),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  text.length, (index) => buildOptions(index: index)),
            ),
          ),
          const VerticalSpace(value: 3),
          (currentIndex == 0)
              ? const RecentOrdersItem()
              : const PreviouseOrdersItem(),
        ],
      ),
    );
  }

  AnimatedContainer buildOptions({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: screenWidth(context) * 0.45,
      height: screenHeight(context) * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth(context) * 0.03),
        color: currentIndex == index ? kMainColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
          if (index == 1) {
            GetIt.I<OrdersCubit>().getOrders("finished");
          } else {
            GetIt.I<OrdersCubit>().getOrders("new");
          }
        },
        child: Center(
          child: Text(
            text[index],
            style: bodyStryle(
              context: context,
              color: currentIndex == index ? Colors.white : colorBlack,
            ),
          ),
        ),
      ),
    );
  }
}
