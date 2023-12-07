part of 'setter_cubit.dart';

@immutable
class SetterState {}

class SetterInitial extends SetterState {}

class GetSettersLoadingState extends SetterState {}

class GetSettersSuccessState extends SetterState {}

class GetSettersErrorState extends SetterState {}

class GetSetterDetailLoadingState extends SetterState {}

class GetSetterDetailSuccessState extends SetterState {}

class GetSetterDetailErrorState extends SetterState {}

class GetReviewsLoadingState extends SetterState {}

class GetReviewsSuccessState extends SetterState {}

class GetReviewsErrorState extends SetterState {}

class AddReviewsLoadingState extends SetterState {}

class AddReviewsSuccessState extends SetterState {}

class AddReviewsErrorState extends SetterState {}

class FilterSetterLoadingState extends SetterState {}

class FilterSetterSuccessState extends SetterState {}

class FilterSetterErrorState extends SetterState {}

class FilterOptionState extends SetterState {}
