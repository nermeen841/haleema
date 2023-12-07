import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../action/all_transaction.dart';
import '../action/latest_transaction.dart';
import '../action/total_amount.dart';
import '../model/all_transaction.dart';
import '../model/amount.dart';
import '../model/latest_transaction.dart';
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());

  AllTransactionModel? allTransactionModel;
  allTransaction() async {
    emit(AllTransactionLoading());
    await AllTransactionAction().run().then(
          (value) => value.fold(
            (l) {
              debugPrint(l.message);
              emit(AllTransactionError());
            },
            (r) {
              allTransactionModel = r;
              emit(AllTransactionSuccess());
              return allTransactionModel;
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////////
  LatestTransactionModel? latestTransactionModel;
  latestTransaction() async {
    emit(LatestTransactionLoading());
    await LatestTransactionAction().run().then(
          (value) => value.fold(
            (l) {
              debugPrint(l.message);
              emit(LatestTransactionError());
            },
            (r) {
              latestTransactionModel = r;
              emit(LatestTransactionSuccess());
              return latestTransactionModel;
            },
          ),
        );
  }

  ///////////////////////////////////////////////////////////////////////////
  TotalAmountModel? totalAmountModel;
  totalAmount() async {
    emit(TotalAmountLoading());
    await TotalAmountAction().run().then(
          (value) => value.fold(
            (l) {
              debugPrint(l.message);
              emit(TotalAmountError());
            },
            (r) {
              totalAmountModel = r;
              emit(TotalAmountSuccess());
              return totalAmountModel;
            },
          ),
        );
  }
}
