part of 'driver_cubit.dart';

@immutable
class DriverState {}

class DriverInitial extends DriverState {}

class GetDriverLoadingState extends DriverState {}

class GetDriverSuccessState extends DriverState {}

class GetDriverErrorState extends DriverState {}

class AddDriverLoadingState extends DriverState {}

class AddDriverSuccessState extends DriverState {}

class AddDriverErrorState extends DriverState {}

class EditDriverLoadingState extends DriverState {}

class EditDriverSuccessState extends DriverState {}

class EditDriverErrorState extends DriverState {}

class DeleteDriverLoadingState extends DriverState {}

class DeleteDriverSuccessState extends DriverState {}

class DeleteDriverErrorState extends DriverState {}

class DriverSelectedState extends DriverState {}

class DriverDetailSuccessState extends DriverState {}

class DriverDetailErrorState extends DriverState {}

class DriverDetailLoadingState extends DriverState {}
