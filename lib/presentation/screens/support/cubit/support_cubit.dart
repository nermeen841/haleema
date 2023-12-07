import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:halema/presentation/screens/support/action/make_ticket.dart';
import 'package:halema/presentation/screens/support/action/make_ticket_thread.dart';
import 'package:halema/presentation/screens/support/action/my_tickets.dart';
import 'package:halema/presentation/screens/support/action/order_setter.dart';
import 'package:halema/presentation/screens/support/model/make_ticket.dart';
import 'package:halema/presentation/screens/support/model/order_setter.dart';
import 'package:halema/presentation/screens/support/model/ticket_with_thread.dart';

import '../action/report_message.dart';
import '../model/report_message.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit() : super(SupportInitial());

  MakeTicketModel? makeTicketModel;
  makeTicket({
    int? setterId,
    required String problem,
    required String description,
  }) async {
    emit(MakeTicketLoadingState());
    await MakeTicketAction(
            setterId: setterId, problem: problem, description: description)
        .run()
        .then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(MakeTicketErrorState());
            },
            (r) {
              makeTicketModel = r;
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(MakeTicketSuccessState());
              getMytickets();
            },
          ),
        );
  }

  ////////////////////////////////////////////////////
  OrderSetterModel? orderSetterModel;
  getOrderSetters() async {
    emit(OrderSetterLoadingState());
    await OrderSetterAction().run().then(
          (value) => value.fold(
            (l) {
              debugPrint(l.message);
              emit(OrderSetterErrorState());
            },
            (r) {
              orderSetterModel = r;
              emit(OrderSetterSuccessState());
              return orderSetterModel;
            },
          ),
        );
  }

  //////////////////////////////////////////////////////////////////////////
  makeTicketThread(int ticketId, String message) async {
    emit(MakeTicketThreadLoadingState());
    await MakeTicketThreadAction(ticketId, message).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(MakeTicketThreadErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(MakeTicketThreadSuccessState());
              getReportMessages(ticketId);
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////////
  TicketWithThreadModel? ticketWithThreadModel;
  getMytickets() async {
    emit(MyTicketsLoadingState());
    await MyTicketsAction().run().then(
          (value) => value.fold(
            (l) {
              debugPrint(l.message);
              emit(MakeTicketErrorState());
            },
            (r) {
              ticketWithThreadModel = r;
              emit(MakeTicketSuccessState());
              return ticketWithThreadModel;
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////////
  ReportMessageModel? reportMessageModel;
  getReportMessages(int id) async {
    emit(ReportMessageErrorState());
    await ReportMessageAction(id).run().then(
          (value) => value.fold(
            (l) {
              debugPrint(l.message);
              emit(ReportMessageErrorState());
            },
            (r) {
              reportMessageModel = r;
              emit(ReportMessageSuccessState());
              return reportMessageModel;
            },
          ),
        );
  }
}
