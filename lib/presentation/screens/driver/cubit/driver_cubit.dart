import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/screens/driver/action/add_driver.dart';
import 'package:halema/presentation/screens/driver/action/delete_driver.dart';
import 'package:halema/presentation/screens/driver/action/driver_detail.dart';
import 'package:halema/presentation/screens/driver/action/get_drivers.dart';
import 'package:halema/presentation/screens/driver/model/driver_detail.dart';
import 'package:halema/presentation/screens/driver/model/drivers.dart';
import 'package:halema/presentation/screens/layout/layout.dart';

import '../action/edit_driver.dart';

part 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverInitial());

  DriversModel? driversModel;
  getDrivers() async {
    emit(GetDriverLoadingState());
    await GetDriversAction().run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              debugPrint(l.message);
              emit(GetDriverErrorState());
            },
            (r) {
              driversModel = r;
              emit(GetDriverSuccessState());
              return driversModel;
            },
          ),
        );
  }

  ////////////////////////////////////////////////////////////////////////
  addDriver({
    required MultipartFile image,
    required String gender,
    required String birthdate,
    required String nationality,
    required String email,
    required String phone,
    required String name,
    required String phoneCode,
  }) async {
    emit(AddDriverLoadingState());
    await AddDriverAction(
            image: image,
            gender: gender,
            birthdate: birthdate,
            nationality: nationality,
            email: email,
            phone: phone,
            name: name,
            phoneCode: phoneCode)
        .run()
        .then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(AddDriverErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(AddDriverSuccessState());
              getDrivers();
              MagicRouter.pop();
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////////
  editDriver({
    MultipartFile? image,
    String? gender,
    String? birthdate,
    String? nationality,
    String? email,
    String? phone,
    String? name,
    String? phoneCode,
    required int id,
  }) async {
    emit(EditDriverLoadingState());
    await EditDriverAction(
      image: image,
      gender: gender,
      birthdate: birthdate,
      nationality: nationality,
      email: email,
      phone: phone,
      name: name,
      phoneCode: phoneCode,
      id: id,
    ).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(EditDriverErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(EditDriverSuccessState());
              getDriverDetail(id);
              getDrivers();
            },
          ),
        );
  }

  ///////////////////////////////////////////////////////////////////////////////
  deleteDriver(int id) async {
    emit(DeleteDriverLoadingState());
    await DeleteDriverAction(id).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(DeleteDriverErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(DeleteDriverSuccessState());
              getDrivers();
              MagicRouter.navigateAndPopAll(const LayoutScreen(
                index: 3,
              ));
            },
          ),
        );
  }

  String? drivername;
  String? driverimage;
  void selectedDriverData({
    required String name,
    required String image,
  }) {
    driverimage = image;
    drivername = name;
    emit(DriverSelectedState());
  }

  ///////////////////////////////////////////////////////////
  int? driverId;
  void selectDriver(int id) {
    driverId = id;
    emit(DriverSelectedState());
  }

  ////////////////////////////////////////////////////////////////////
  DriverDetailModel? driverDetailModel;
  getDriverDetail(int driverId) async {
    emit(DriverDetailLoadingState());
    await DriverDetailAction(driverId).run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              debugPrint(l.message);
              emit(DriverDetailErrorState());
            },
            (r) {
              driverDetailModel = r;
              emit(DriverDetailSuccessState());
              return driverDetailModel;
            },
          ),
        );
  }
}
