import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:halema/core/network/endpoint.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/screens/home/action/add_review.dart';
import 'package:halema/presentation/screens/home/action/get_review.dart';
import 'package:halema/presentation/screens/home/model/filter_setter.dart';
import 'package:halema/presentation/screens/home/model/get_setter_detail_model.dart';
import 'package:halema/presentation/screens/home/model/get_setters_model.dart';
// import 'dart:ui' as ui;
import '../../favourite/cubit/favourite_cubit.dart';
import '../action/get_setters.dart';
import '../action/setter_detail.dart';
import '../model/get_review_model.dart';
// import 'package:http/http.dart' as http;
part 'setter_state.dart';

class SetterCubit extends Cubit<SetterState> {
  SetterCubit() : super(SetterInitial());

  GetSettersModel? getSettersModel;
  Set<Marker> markers = {};
  Future getSetters(String search) async {
    getSettersModel = null;
    markers.clear();
    emit(GetSettersLoadingState());
    await GetSettersActions(search).run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              debugPrint(
                l.message,
              );
              emit(GetSettersErrorState());
            },
            (r) {
              getSettersModel = r;
              for (var element in r!.setters!.data!) {
                // var request =
                //     await http.get(Uri.parse(element.user!.imageUrl!));
                // var bytes = request.bodyBytes;
                // ui.Codec codec = await ui.instantiateImageCodec(
                //   bytes.buffer.asUint8List(),
                //   targetWidth: 150,
                // );
                // ui.FrameInfo fi = await codec.getNextFrame();
                // var image =
                //     (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
                //         .buffer
                //         .asUint8List();
                markers.add(Marker(
                  // draggable: false,
                  markerId: MarkerId(element.id!.toString()),
                  position: LatLng(
                    double.parse(element.lat ?? "0.0"),
                    double.parse(element.long ?? "0.0"),
                  ),
                  infoWindow: InfoWindow(
                    title: element.user!.name!,
                  ),
                  icon: mapicon!,
                ));
              }
              emit(GetSettersSuccessState());
              return getSettersModel;
            },
          ),
        );
  }

  GetSetterDetailModel? getSetterDetailModel;
  Future getSetterDetail(int id) async {
    emit(GetSetterDetailLoadingState());
    await GetSetterDetailActions(id).run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              debugPrint(
                l.message,
              );
              emit(GetSetterDetailErrorState());
            },
            (r) {
              getSetterDetailModel = r;
              emit(GetSetterDetailSuccessState());
              if (r!.setter!.isFavourite! == true) {
                GetIt.I<FavouriteCubit>().isFavourite[id] = true;
              } else {
                GetIt.I<FavouriteCubit>().isFavourite[id] = false;
              }
              return getSetterDetailModel;
            },
          ),
        );
  }

  GetReviewModel? getReviewModel;
  Future getReview(int id) async {
    emit(GetReviewsLoadingState());
    await GetReviewActions(id).run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              showToast(
                state: ToastStates.ERROR,
                msg: l.message,
              );
              emit(GetReviewsErrorState());
            },
            (r) {
              getReviewModel = r;
              emit(GetReviewsSuccessState());
              return getReviewModel;
            },
          ),
        );
  }

  ////////////////////////////////////////////////////////////////////////
  addReview({
    required int id,
    required int numOfStars,
    required String review,
  }) async {
    emit(AddReviewsLoadingState());
    await AddReviewAction(id: id, numOfStars: numOfStars, review: review)
        .run()
        .then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(AddReviewsErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(AddReviewsSuccessState());
              getReview(id);
              MagicRouter.pop();
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////////////////
  // List<dynamic> filterModel = [];
  List<FilterSetterModel> filterSetterModel = [];
  filterSetters({
    String? highestOrders,
    String? minHourPrice,
    String? maxHourPrice,
    String? highestRate,
  }) async {
    // filterModel.clear();
    filterSetterModel.clear();
    emit(FilterSetterLoadingState());

    try {
      FormData formData = FormData.fromMap(
        {
          "highest_orders": highestOrders,
          "min_hour_price": minHourPrice,
          "max_hour_price": maxHourPrice,
          "highest_rate": highestRate,
        }..removeWhere((key, value) => value == null),
      );
      Response response = await Dio().post(
        'http://api.haleemh.sa/api${EndPoint.filterSetter}',
        options: Options(
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: {
            "Authorization": "Bearer ${prefs.getString('token').toString()}",
            "Accept": "application/json",
          },
        ),
        data: formData,
      );

      debugPrint(formData.fields.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        // filterModel = response.data;
        for (var element in response.data) {
          filterSetterModel.add(FilterSetterModel.fromJson(element));
        }
        emit(FilterSetterSuccessState());
        return filterSetterModel;
      } else {
        showToast(msg: response.data, state: ToastStates.ERROR);
        debugPrint("error");
        emit(FilterSetterErrorState());
      }
      if (response.statusCode == 401) {
        prefs.setBool("login", false);
      }
    } catch (e) {
      showToast(msg: e.toString(), state: ToastStates.ERROR);
      debugPrint(e.toString());
      emit(FilterSetterErrorState());
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  bool isFilterring = false;
  void filterOption(bool filter) {
    isFilterring = filter;
    emit(FilterOptionState());
  }
}
