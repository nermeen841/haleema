import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/detail/screens/payment/widget/payment_method.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';

import 'reciept.dart';

class CheckoutBody extends StatefulWidget {
  final String days;
  final String hours;
  final String children;
  final String hourPrice;

  const CheckoutBody({
    super.key,
    required this.days,
    required this.hours,
    required this.children,
    required this.hourPrice,
  });

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  TextEditingController copoun = TextEditingController();
  bool showButton = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * .02,
        horizontal: screenWidth(context) * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            translateString("Discount and copoun", "الخصومات واكواد الخصم"),
            style: headingStyle2(
              context: context,
              color: colorBlack,
            ),
          ),
          const VerticalSpace(value: 1.5),
          BlocConsumer<OrdersCubit, OrdersState>(
            listener: (context, state) {},
            bloc: GetIt.I<OrdersCubit>(),
            builder: (context, state) {
              return CustomTextFormField(
                controller: copoun,
                hint: translateString("Coupon", "كودخصم"),
                suffix: (showButton)
                    ? SizedBox(
                        width: screenWidth(context) * 0.3,
                        child: (state is! DiscountLoadingState)
                            ? CustomGeneralButton(
                                text: translateString(
                                    "Apply Code", "تطبيق الكود"),
                                color: kMainColor,
                                textColor: Colors.white,
                                onTap: () => GetIt.I<OrdersCubit>()
                                    .applyCoupon(copoun.text),
                              )
                            : loading(),
                      )
                    : null,
                prefix: SvgPicture.asset(
                  AppIcons.discountIcon,
                  width: 7,
                  height: 7,
                  fit: BoxFit.scaleDown,
                ),
                borderColor: textBorderColor,
                onChanged: (value) {
                  if (value != "" && value != null) {
                    setState(() {
                      showButton = true;
                    });
                  } else {
                    setState(() {
                      showButton = false;
                    });
                  }
                },
              );
            },
          ),
          const VerticalSpace(value: 2),
          Text(
            translateString("Reciept detail", "ملخص الفاتوره"),
            style: headingStyle2(context: context, color: colorBlack),
          ),
          const VerticalSpace(value: 1),
          RecieptItem(
            days: widget.days,
            hours: widget.hours,
            children: widget.children,
            hourPrice: widget.hourPrice,
          ),
          const VerticalSpace(value: 2),
          Text(
            translateString("Select payment method", "أختر وسيله الدفع"),
            style: headingStyle2(context: context, color: colorBlack),
          ),
          const VerticalSpace(value: 1),
          const PaymentMethodItem(),
        ],
      ),
    );
  }
}
