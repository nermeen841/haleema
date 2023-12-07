import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:meta/meta.dart';

import '../action/add_to_favourite.dart';
import '../action/delete_from_favourite.dart';
import '../action/get_favourite.dart';
import '../model/favourite.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  removeFavourite({
    required int setterId,
  }) async {
    emit(RemoveFromFavouriteLoadingState());
    await DeleteFromFavouriteAction(setterId).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(RemoveFromFavouriteErrorState());
            },
            (r) {
              // SnackBar
              isFavourite[setterId] = false;

              emit(RemoveFromFavouriteSuccessState());
              getFavourite();

              // MagicRouter.navigateAndPopAll(const LayoutScreen());
            },
          ),
        );
  }

///////////////////////////////////////////////////////////////
  ///
  Map<int, bool> isFavourite = {};
  addFavourite({
    required int setterId,
  }) async {
    emit(AddtoFavouriteLoadingState());
    await AddtoFavouriteAction(setterId: setterId).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(AddtoFavouriteErrorState());
            },
            (r) {
              isFavourite[setterId] = true;
              emit(AddtoFavouriteSuccessState());
              getFavourite();

              // MagicRouter.pop();
            },
          ),
        );
  }

  ///////////////////////////////////////////////////////////////
  ///
  FavouriteModel? favouriteModel;
  getFavourite() async {
    emit(GetFavouriteLoadingState());
    await GetFavouriteAction().run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(GetFavouriteErrorState());
            },
            (r) {
              favouriteModel = r;
              emit(GetFavouriteSuccessState());
              for (var element in r!.favourites!) {
                isFavourite[element.setterId!] = true;
              }
              return favouriteModel;
              // getDrivers();
              // MagicRouter.pop();
            },
          ),
        );
  }
}
