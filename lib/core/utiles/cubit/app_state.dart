part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ToggleExchangeState extends AppState {}

class ToggleRegisterState extends AppState {}

class FilterState extends AppState {}

class RattingState extends AppState {}

class ChangeGenderState extends AppState {}

class ChangeDiseaseState extends AppState {} //GenderSelection

class GenderSelection extends AppState {}//

