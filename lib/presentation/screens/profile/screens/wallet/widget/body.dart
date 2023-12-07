import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/profile/screens/wallet/cubit/wallet_cubit.dart';
import 'package:halema/presentation/screens/profile/screens/wallet/widget/finance_operation_item.dart';

import 'balance_detail.dart';

class WalletBody extends StatefulWidget {
  const WalletBody({super.key});

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletState>(
      bloc: GetIt.I<WalletCubit>(),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.02,
            horizontal: screenWidth(context) * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MybalanceDetail(),
              const VerticalSpace(value: 2),
              Text(
                translateString("Recent transactions", "المعاملات الأخيره"),
                style: headingStyle1(
                  context: context,
                  color: colorBlack,
                ),
              ),
              const VerticalSpace(value: 2),
              (GetIt.I<WalletCubit>().allTransactionModel == null)
                  ? loading()
                  : (GetIt.I<WalletCubit>()
                          .allTransactionModel!
                          .transactions!
                          .data!
                          .isNotEmpty)
                      ? ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) => FinanceOperationItem(
                              id: GetIt.I<WalletCubit>()
                                  .allTransactionModel!
                                  .transactions!
                                  .data![index]
                                  .id!,
                              type: GetIt.I<WalletCubit>()
                                  .allTransactionModel!
                                  .transactions!
                                  .data![index]
                                  .type
                                  .toString(),
                              amount: GetIt.I<WalletCubit>()
                                  .allTransactionModel!
                                  .transactions!
                                  .data![index]
                                  .amount
                                  .toString(),
                              createAt: GetIt.I<WalletCubit>()
                                  .allTransactionModel!
                                  .transactions!
                                  .data![index]
                                  .createdAt
                                  .toString()),
                          separatorBuilder: (context, index) =>
                              const VerticalSpace(value: 3),
                          itemCount: GetIt.I<WalletCubit>()
                              .allTransactionModel!
                              .transactions!
                              .data!
                              .length,
                        )
                      : Center(
                          child: Padding(
                          padding:
                              EdgeInsets.only(top: screenHeight(context) * 0.1),
                          child: Text(
                            translateString(
                                'No Transactions Here', 'لا توجد معاملات'),
                            style:
                                bodyStryle(context: context, color: kMainColor),
                          ),
                        )),
            ],
          ),
        );
      },
    );
  }
}
