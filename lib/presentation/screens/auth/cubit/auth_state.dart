part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {}

class VerifyCodeLoadingState extends AuthState {}

class VerifyCodeSuccessState extends AuthState {}

class VerifyCodeErrorState extends AuthState {}

class LogOutLoadingState extends AuthState {}

class LogOutSuccessState extends AuthState {}

class LogOutErrorState extends AuthState {}

class DeleteAccountLoadingState extends AuthState {}

class DeleteAccountSuccessState extends AuthState {}

class DeleteAccountErrorState extends AuthState {}

class UpdateProfileLoadingState extends AuthState {}

class UpdateProfileSuccessState extends AuthState {}

class UpdateProfileErrorState extends AuthState {}

class GetProfileLoadingState extends AuthState {}

class GetProfileSuccessState extends AuthState {}

class GetProfileErrorState extends AuthState {}

class CountryLoadingState extends AuthState {}

class CountrySuccessState extends AuthState {}

class CountryErrorState extends AuthState {}

class ResendCodeLoadingState extends AuthState {}

class ResendCodeSuccessState extends AuthState {}

class ResendCodeErrorState extends AuthState {}

class DefaultCountryLoadingState extends AuthState {}

class DefaultCountrySuccessState extends AuthState {}

class DefaultCountryErrorState extends AuthState {}
