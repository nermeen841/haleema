part of 'orders_cubit.dart';

@immutable
class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrderDetailsLoadingState extends OrdersState {}

class OrderDetailsSuccessState extends OrdersState {}

class OrderDetailsErrorState extends OrdersState {}

class MakeOrderLoadingState extends OrdersState {}

class MakeOrderSuccessState extends OrdersState {}

class MakeOrderErrorState extends OrdersState {}

class GetOrderLoadingState extends OrdersState {}

class GetOrderSuccessState extends OrdersState {}

class GetOrderErrorState extends OrdersState {}

class CancelOrderLoadingState extends OrdersState {}

class CancelOrderSuccessState extends OrdersState {}

class CancelOrderErrorState extends OrdersState {}

class SettingLoadingState extends OrdersState {}

class SettingErrorState extends OrdersState {}

class SettingSuccessState extends OrdersState {}

class DiscountLoadingState extends OrdersState {}

class DiscountErrorState extends OrdersState {}

class DiscountSuccessState extends OrdersState {}

class PaymentLoadingState extends OrdersState {}

class PaymentErrorState extends OrdersState {}

class PaymentSuccessState extends OrdersState {}
