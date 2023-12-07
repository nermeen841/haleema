import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/widgets/custom_drop_down.dart';
// import 'package:meta/meta.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helper/functions/show_toast.dart';
import '../../../../core/router/router.dart';
import '../../layout/layout.dart';
import '../../splash/splash.dart';
import '../action/country.dart';
import '../action/delete_account.dart';
import '../action/get_profile.dart';
import '../action/login.dart';
import '../action/logout.dart';
import '../action/register.dart';
import '../action/resend_code.dart';
import '../action/update_profile.dart';
import '../action/verify_code.dart';
import '../model/country.dart';
import '../model/profile_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  postRegister({
    required String name,
    required String phone,
    required String email,
    MultipartFile? image,
    required String nationality,
    required String phoneCode,
  }) async {
    emit(RegisterLoadingState());

    await RegisterActions(
            email: email,
            phone: phone,
            image: image,
            name: name,
            nationality: nationality,
            phoneCode: phoneCode)
        .run()
        .then((value) => value.fold((l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(RegisterErrorState());
            }, (r) {
              prefs.setString("token", r!.user!.token!);
              prefs.setInt("user_id", r.user!.id!);
              showToast(
                  msg: "User created successfully", state: ToastStates.SUCCESS);
              emit(RegisterSuccessState());
            }));
  }

////////////////////////////////////////////////////////////////////
  postLogin({
    required String phone,
  }) async {
    emit(LoginLoadingState());
    await LoginActions(
      phone: phone,
    ).run().then((value) => value.fold((l) {
          showToast(msg: l.message, state: ToastStates.ERROR);
          emit(LoginErrorState());
        }, (r) {
          prefs.setString('token', r!.user!.token!);
          prefs.setBool("login", true);
          prefs.setInt("user_id", r.user!.id!);
          emit(LoginSuccessState());
          MagicRouter.navigateAndPopAll(const LayoutScreen());
        }));
  }
////////////////////////////////////////////////////////////////////

  verifyCode({
    required String code,
    required String phone,
  }) async {
    emit(VerifyCodeLoadingState());
    await VerifyActions(code: code, phone: phone)
        .run()
        .then((value) => value.fold((l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(VerifyCodeErrorState());
            }, (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              prefs.setBool("login", true);
              prefs.setInt("user_id", r.user!.id!);
              emit(VerifyCodeSuccessState());
              MagicRouter.navigateAndPopAll(const LayoutScreen());
            }));
  }

////////////////////////////////////////////////////////////////////
  ProfileModel? profileModel;
  Future getProfileData() async {
    emit(GetProfileLoadingState());
    await GetProfileActions().run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(GetProfileErrorState());
            },
            (r) {
              profileModel = r;
              emit(GetProfileSuccessState());
              return profileModel;
            },
          ),
        );
  }
/////////////////////////////////////////////////////////////////

  updateProfile({
    String? name,
    String? email,
    dynamic image,
    String? dateOfBirth,
    String? nationality,
    String? address,
    String? nationalId,
    double? long,
    double? lat,
    String? gender,
  }) async {
    emit(UpdateProfileLoadingState());
    await UpdateProfileActions(
            address: address,
            nationalId: nationalId,
            email: email,
            name: name,
            image: image,
            nationality: nationality,
            dateOfBirth: dateOfBirth,
            long: long,
            lat: lat,
            gender: gender)
        .run()
        .then((value) => value.fold((l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(UpdateProfileErrorState());
            }, (r) {
              showToast(
                  msg: 'Profile Updated Successflly',
                  state: ToastStates.SUCCESS);

              emit(UpdateProfileSuccessState());
              getProfileData();
            }));
  }
//////////////////////////////////////////////////////////////////////////////////////////

  postLogout(context) async {
    dialog(context);
    emit(LogOutLoadingState());
    await LogoutActions().run().then((value) => value.fold((l) {
          Navigator.pop(context);
          emit(LogOutErrorState());
        }, (r) {
          prefs.clear();
          emit(LogOutSuccessState());
          MagicRouter.navigateAndPopAll(const SplashScreen());
        }));
  }

/////////////////////////////////////////////////////////////////
  deleteAccount() async {
    emit(DeleteAccountLoadingState());
    await DeleteAccountActions().run().then((value) => value.fold((l) {
          emit(DeleteAccountErrorState());
        }, (r) {
          prefs.clear();
          emit(DeleteAccountSuccessState());
          MagicRouter.navigateAndPopAll(const SplashScreen());
        }));
  }

  ////////////////////////////////////////////////////////////////////
  CountryModel? countryModel;
  getCountry() async {
    emit(CountryLoadingState());
    await CountryAction().run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              debugPrint(l.message);
            },
            (r) {
              countryModel = r;
              emit(CountrySuccessState());
              lookupUserCountry();
              return countryModel;
            },
          ),
        );
  }

  ////////////////////////////////////////////////////////////////////////////
  resendCode(String phone) async {
    emit(ResendCodeLoadingState());
    await ResendcodeAction(phone).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(ResendCodeErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(ResendCodeSuccessState());
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////
  String? countryCode;
  String? nationality;
  Future lookupUserCountry() async {
    emit(DefaultCountryLoadingState());
    try {
      final response = await Dio().get(
        'https://api.country.is',
      );
      if (response.statusCode == 200) {
        var data = response.data;
        if (GetIt.I<AuthCubit>().countryModel != null) {
          for (var element in GetIt.I<AuthCubit>().countryModel!.contries!) {
            if (element.codeIso == data['country']) {
              CountryDropDownSelection.selectedCountry = element.code!;
              countryCode = element.code!;
              NationalityDropDown.selectedNationality = element.nationality!;
              nationality = element.nationality!;
            }
            emit(DefaultCountrySuccessState());
          }
        }
        emit(DefaultCountrySuccessState());
      }
    } catch (e) {
      debugPrint("error optain user country :  ${e.toString()}");
      emit(DefaultCountryErrorState());
    }
  }
}
