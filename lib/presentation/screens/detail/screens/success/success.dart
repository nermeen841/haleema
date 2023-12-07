import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/layout/layout.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';
import 'package:halema/presentation/screens/order/screens/order_detail/order_detail.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final int orderId;
  const PaymentSuccessScreen({super.key, required this.orderId});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNoTitle(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight(context) * 0.02,
          horizontal: screenWidth(context) * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.inviteVector,
            ),
            const VerticalSpace(value: 2),
            Text(
              translateString(
                  "Your request has been sent, wait for it to be accepted by the nanny",
                  "تم إرسال طلبك ، أنتظر حتي يتم قبوله من قبل المربيه"),
            ),
            const VerticalSpace(value: 4),
            BlocConsumer<OrdersCubit, OrdersState>(
              listener: (context, state) {},
              bloc: GetIt.I<OrdersCubit>(),
              builder: (context, state) {
                return CustomGeneralButton(
                  text:
                      translateString("Go to order page", "الذهاب لصفحه الطلب"),
                  onTap: () => GetIt.I<OrdersCubit>()
                      .getOrderDetail(widget.orderId)
                      .then(
                        (value) => MagicRouter.navigateAndPopAll(
                          OrderDetailScreen(
                              statuse: "new",
                              color: colorYellow,
                              orderId: widget.orderId),
                        ),
                      ),
                );
              },
            ),
            const VerticalSpace(value: 3),
            CustomGeneralButton(
              color: Colors.transparent,
              textColor: kMainColor,
              text: translateString("Back to home", "الرجوع الي الرئيسه"),
              onTap: () => MagicRouter.navigateAndPopAll(const LayoutScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
