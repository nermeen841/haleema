part of 'support_cubit.dart';

@immutable
class SupportState {}

class SupportInitial extends SupportState {}

class MakeTicketLoadingState extends SupportState {}

class MakeTicketErrorState extends SupportState {}

class MakeTicketSuccessState extends SupportState {}

class MakeTicketThreadLoadingState extends SupportState {}

class MakeTicketThreadErrorState extends SupportState {}

class MakeTicketThreadSuccessState extends SupportState {}

class MyTicketsLoadingState extends SupportState {}

class MyTicketsErrorState extends SupportState {}

class MyTicketsSuccessState extends SupportState {}

class OrderSetterLoadingState extends SupportState {}

class OrderSetterErrorState extends SupportState {}

class OrderSetterSuccessState extends SupportState {}

class ReportMessageLoadingState extends SupportState {}

class ReportMessageErrorState extends SupportState {}

class ReportMessageSuccessState extends SupportState {}
