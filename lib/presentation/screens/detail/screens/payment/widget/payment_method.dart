import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

class PaymentMethodItem extends StatefulWidget {
  const PaymentMethodItem({super.key});

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  bool iscash = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // InkWell(
        //   onTap: () {
        //     setState(() {
        //       iscash = true;
        //     });
        //   },
        //   child: BlocConsumer<WalletCubit, WalletState>(
        //     listener: (context, state) {},
        //     bloc: GetIt.I<WalletCubit>(),
        //     builder: (context, state) {
        //       return Container(
        //         width: double.infinity,
        //         height: screenHeight(context) * 0.1,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(
        //             screenWidth(context) * 0.03,
        //           ),
        //           border: Border.all(
        //             color: (iscash == true) ? kMainColor : Colors.transparent,
        //           ),
        //         ),
        //         padding: EdgeInsets.symmetric(
        //           vertical: screenHeight(context) * 0.015,
        //           horizontal: screenWidth(context) * 0.02,
        //         ),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(
        //               children: [
        //                 SvgPicture.asset(
        //                   AppIcons.walletBlackIcon,
        //                 ),
        //                 const HorizontalSpace(value: 1),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Text(
        //                       translateString("Wallet", "المحفظه"),
        //                       style: headingStyle2(
        //                         context: context,
        //                         color: colorBlack,
        //                       ),
        //                     ),
        //                     const VerticalSpace(value: 0.7),
        //                     RichText(
        //                       text: TextSpan(
        //                         children: [
        //                           TextSpan(
        //                             text: translateString(
        //                                 "  your balance ", " رصيدك الحالي "),
        //                             style: bodyStryle(
        //                               context: context,
        //                               color: colorLightGrey,
        //                             ),
        //                           ),
        //                           TextSpan(
        //                             text: (GetIt.I<WalletCubit>()
        //                                         .totalAmountModel !=
        //                                     null)
        //                                 ? GetIt.I<WalletCubit>()
        //                                     .totalAmountModel!
        //                                     .totalAmount
        //                                     .toString()
        //                                 : "0.0",
        //                             style: bodyStryle(
        //                               context: context,
        //                               color: kMainColor,
        //                             ),
        //                           ),
        //                           TextSpan(
        //                             text: translateString("R.s", "ر.س"),
        //                             style: bodyStryle(
        //                               context: context,
        //                               color: colorLightGrey,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //             Icon(
        //               Icons.check_circle,
        //               color: (iscash == true) ? kMainColor : Colors.white,
        //               size: screenWidth(context) * 0.08,
        //             ),
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ),
        // const VerticalSpace(value: 2),
        InkWell(
          onTap: () {
            setState(() {
              iscash = false;
            });
          },
          child: Container(
            width: double.infinity,
            height: screenHeight(context) * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                screenWidth(context) * 0.03,
              ),
              border: Border.all(
                color: (iscash == false) ? kMainColor : Colors.transparent,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(context) * 0.015,
              horizontal: screenWidth(context) * 0.02,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: kMainColor,
                    ),
                    const HorizontalSpace(value: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translateString("online paymnet", "أونلاين"),
                          style: headingStyle2(
                            context: context,
                            color: colorBlack,
                          ),
                        ),
                        const VerticalSpace(value: 0.7),
                        Text(
                          translateString("select payment method",
                              "اختر طريقة الدفع التي تناسبك "),
                          style: bodyStryle(
                            context: context,
                            color: colorLightGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.check_circle,
                  color: (iscash == false) ? kMainColor : Colors.white,
                  size: screenWidth(context) * 0.08,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
