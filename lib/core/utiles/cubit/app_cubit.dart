import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  bool toggle = false;
  changetoggle() {
    toggle = !toggle;
    emit(ToggleExchangeState());
  }

  /////////////////////////////////////////////////////
  bool toggleRegister = false;
  changetoggleRegister() {
    toggleRegister = !toggleRegister;
    emit(ToggleRegisterState());
  }

  //////////////////////////////////////////////////
  int? switchFilter;
  changefilter(int value) {
    switchFilter = value;
    emit(FilterState());
  }

  ////////////////////////////////////////////////////////////////////////////
  double ratting = 0.0;
  changeRatting(double value) {
    ratting = value;
    emit(RattingState());
  }

  /////////////////////////////////////////////////
  String? selectedGender;
  changeGender(String gender) {
    selectedGender = gender;
    emit(ChangeGenderState());
  }
  ///////////////////////////////////////////////////////////

  bool? isMale;
  changeGender1(bool selected) {
    isMale = selected;
    emit(GenderSelection());
  }

  ///////////////////////////////////////////////////////////
  int? haveDisease;
  changeDisease(int isDisease) {
    haveDisease = isDisease;
    emit(ChangeDiseaseState());
  }
}
