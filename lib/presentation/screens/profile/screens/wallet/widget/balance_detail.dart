// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:halema/presentation/screens/profile/screens/addbalance_success/add_balance_success.dart';
import 'package:halema/presentation/screens/profile/screens/wallet/cubit/wallet_cubit.dart';

class MybalanceDetail extends StatelessWidget {
  MybalanceDetail({super.key});
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletState>(
      bloc: GetIt.I<WalletCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return (GetIt.I<WalletCubit>().totalAmountModel != null)
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context) * 0.03,
                  horizontal: screenWidth(context) * 0.05,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    screenWidth(context) * 0.03,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorLightGrey.withOpacity(0.15),
                      offset: const Offset(0, 2),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth(context) * 0.07,
                      backgroundColor: textFormFieldColor,
                      child: Center(
                        child: Image.asset("assets/icons/wallet 1.png"
                            // AppIcons.walletColoredIcon,
                            ),
                      ),
                    ),
                    const VerticalSpace(value: 1),
                    Text(
                      translateString("your balance", "رصيدك الحالي "),
                      style: bodyStryle2(
                        context: context,
                        color: colorGrey.withOpacity(0.3),
                      ),
                    ),
                    const VerticalSpace(value: 1),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                " ${GetIt.I<WalletCubit>().totalAmountModel!.totalAmount} ",
                            style: headingStyle1(
                              context: context,
                              color: kMainColor,
                            ),
                          ),
                          TextSpan(
                            text: translateString("R.S", "ر.س"),
                            style: bodyStryle(
                              context: context,
                              color: colorGrey.withOpacity(0.4),
                            ).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpace(value: 3),
                    CustomGeneralButton(
                      text: translateString("Add credit", " أضافه رصيد"),
                      onTap: () => homeBottomSheet(
                        context: context,
                        child: Form(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              top: screenHeight(context) * 0.02,
                              left: screenWidth(context) * 0.04,
                              right: screenWidth(context) * 0.04,
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      translateString("Add credit information",
                                          "معلومات أضافه رصيد"),
                                      style: headingStyle2(
                                        context: context,
                                        color: colorBlack,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => MagicRouter.pop(),
                                      child: Icon(
                                        CupertinoIcons.clear_circled,
                                        color: colorLightGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalSpace(value: 2),
                                Divider(
                                  color: colorLightGrey,
                                ),
                                const VerticalSpace(value: 4),
                                Text(
                                  translateString(
                                      "Enter the amount to be added",
                                      "ادخل المبلغ المراد أضافته"),
                                  style: headingStyle2(
                                    context: context,
                                    color: colorBlack,
                                  ),
                                ),
                                const VerticalSpace(value: 2),
                                CustomTextFormField(
                                  hint: "",
                                  controller: amount,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  inputType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                                  ],
                                ),
                                const VerticalSpace(value: 3),
                                CustomGeneralButton(
                                  text: LocaleKeys.NEXT.tr(),
                                  onTap: () =>
                                      MagicRouter.navigateAndPReplacement(
                                          const AddBalanceSuccessScreen()),
                                ),
                                const VerticalSpace(value: 4),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : loading();
      },
    );
  }
}
