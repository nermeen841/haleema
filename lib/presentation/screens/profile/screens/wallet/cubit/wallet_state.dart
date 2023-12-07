part of 'wallet_cubit.dart';

@immutable
class WalletState {}

class WalletInitial extends WalletState {}

class AllTransactionLoading extends WalletState {}

class AllTransactionError extends WalletState {}

class AllTransactionSuccess extends WalletState {}

class LatestTransactionLoading extends WalletState {}

class LatestTransactionError extends WalletState {}

class LatestTransactionSuccess extends WalletState {}

class TotalAmountLoading extends WalletState {}

class TotalAmountError extends WalletState {}

class TotalAmountSuccess extends WalletState {}
