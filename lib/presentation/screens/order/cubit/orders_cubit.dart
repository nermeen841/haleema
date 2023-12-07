// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:halema/presentation/screens/detail/screens/success/success.dart';
import 'package:halema/presentation/screens/order/action/all_order.dart';
import 'package:halema/presentation/screens/order/action/cancel_order.dart';
import 'package:halema/presentation/screens/order/action/discount.dart';
import 'package:halema/presentation/screens/order/action/make_order.dart';
import 'package:halema/presentation/screens/order/action/order_detail.dart';
import 'package:halema/presentation/screens/order/action/payment.dart';
import 'package:halema/presentation/screens/order/model/all_orders.dart';
import 'package:halema/presentation/screens/order/model/make_order_model.dart';
import 'package:halema/presentation/screens/order/model/order_detail.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/router/router.dart';
import '../model/setting.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  MakeOrderModel? makeOrderModel;

  makeOrder({
    required List<int> childIds,
    required int setterId,
    required String hourPrice,
    required String date,
    required String time,
    required int days,
    required double long,
    required double lat,
    required int hours,
    required num discount,
    required int driverId,
    required context,
  }) async {
    dialog(context);
    emit(MakeOrderLoadingState());
    await MakeOrderActions(
            childIds: childIds,
            setterId: setterId,
            date: date,
            time: time,
            discount: discount,
            days: days,
            long: long,
            lat: lat,
            hours: hours,
            driverId: driverId)
        .run()
        .then((value) => value.fold((l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(MakeOrderErrorState());
              Navigator.pop(context);
            }, (r) async {
              await paymentGateway(r!.order!.id!);
              Navigator.pop(context);
              emit(MakeOrderSuccessState());
              MagicRouter.navigateAndPReplacement(PaymentSuccessScreen(
                orderId: r.order!.id!,
              ));
            }));
  }

////////////////////////////////////////////////////////////////////
  AllOrdersModel? allOrdersModel;
  getOrders(String orderActivity) async {
    allOrdersModel = null;
    emit(GetOrderLoadingState());
    await AllOrdersAction(orderActivity).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(GetOrderErrorState());
            },
            (r) {
              allOrdersModel = r;
              emit(GetOrderSuccessState());
              return allOrdersModel;
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////
  OrderDetailModel? orderDetailModel;
  Future getOrderDetail(int orderId) async {
    emit(OrderDetailsLoadingState());
    await OrderDetailAction(orderId).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(OrderDetailsErrorState());
            },
            (r) {
              orderDetailModel = r;
              emit(OrderDetailsSuccessState());
              return orderDetailModel;
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////
  cancelOrder({
    required int orderId,
    required String status,
  }) async {
    emit(CancelOrderLoadingState());
    await CancelOrderAction(orderId: orderId, status: status).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(CancelOrderErrorState());
            },
            (r) {
              showToast(
                  msg: r!.message ??
                      translateString("Order Canceled Successfully",
                          "تم إلغاء الطلب بنجاح"),
                  state: ToastStates.SUCCESS);
              emit(CancelOrderSuccessState());
              getOrders("new");
              MagicRouter.pop();
            },
          ),
        );
  }

  //////////////////////////////////////////////////////////////////////
  List<dynamic> settingModel = [];
  List<SettingModel> setting = [];
  getSetting() async {
    settingModel.clear();
    setting.clear();
    emit(SettingLoadingState());
    try {
      Response response = await Dio().get(
        'http://api.haleemh.sa/api/settings',
        options: Options(
          headers: {
            "Authorization": "Bearer ${prefs.getString('token').toString()}",
            "Accept": "application/atom+xml",
          },
        ),
      );

      if (response.statusCode == 200) {
        settingModel = response.data;
        setting.add(SettingModel.fromJson(settingModel[0]));
        emit(SettingSuccessState());
        return settingModel;
      } else {
        showToast(msg: response.data, state: ToastStates.ERROR);
        debugPrint("error");
        emit(SettingErrorState());
      }
    } catch (e) {
      showToast(msg: e.toString(), state: ToastStates.ERROR);
      debugPrint(e.toString());
      emit(SettingErrorState());
    }
  }

  /////////////////////////////////////////////////////////////////////////////

  String? discountValue;
  Future<String> applyCoupon(String coupon) async {
    emit(DiscountLoadingState());
    await DiscountAction(coupon).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(DiscountErrorState());
            },
            (r) {
              discountValue = r!.coupon!.value!;
              showToast(msg: r.messege!, state: ToastStates.SUCCESS);
              emit(DiscountSuccessState());
              return r.coupon!.value!;
            },
          ),
        );
    return discountValue!;
  }

  ////////////////////////////////////////////////////////////////////////////

  paymentGateway(int orderId) async {
    emit(PaymentLoadingState());
    await PaymentAction(orderId: orderId).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(PaymentErrorState());
            },
            (r) async {
              await launch(r!.result!.redirectUrl!);
              emit(PaymentSuccessState());
            },
          ),
        );
  }
}
