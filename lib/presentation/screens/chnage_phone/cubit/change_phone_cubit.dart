import 'package:bloc/bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helper/functions/show_toast.dart';
import '../../../../core/router/router.dart';
import '../../splash/splash.dart';
import '../action/delete_account.dart';
import '../action/send_verification.dart';
import '../action/update_phone.dart';
import '../screens/success.dart';

part 'change_phone_state.dart';

class ChangePhoneCubit extends Cubit<ChangePhoneState> {
  ChangePhoneCubit() : super(ChangePhoneInitial());

  void sendVerificationCode() async {
    emit(SendVerificationCodeLoading());
    await SendVerificationCodeAction().run().then((value) => value.fold((l) {
          showToast(msg: l.message, state: ToastStates.ERROR);

          emit(SendVerificationCodeError());
        }, (r) {
          showToast(msg: r!.message!, state: ToastStates.SUCCESS);
          emit(SendVerificationCodeSuccess());
        }));
  }
  ///////////////////////////////////////////////////////////////

  deleteAccount({required String code}) async {
    emit(DeleteAccountLoading());
    await DeleteAccountAction(code: code).run().then((value) => value.fold((l) {
          emit(DeleteAccountError());
        }, (r) {
          prefs.clear();
          emit(DeleteAccountSuccess());
          MagicRouter.navigateAndPopAll(const SplashScreen());
        }));
  }
  ///////////////////////////////////////////////////////////////

  updatePhone(
      {required String code,
      required String countryCode,
      required String phone}) async {
    emit(UpdatePhoneLoading());
    await UpdatePhoneAction(code: code, countryCode: countryCode, phone: phone)
        .run()
        .then((value) => value.fold((l) {
              emit(UpdatePhoneError());
            }, (r) {
              emit(UpdatePhoneSuccess());
              MagicRouter.navigateAndPReplacement(const SuccessScreen());
            }));
  }
  ///////////////////////////////////////////////////////////////

}
