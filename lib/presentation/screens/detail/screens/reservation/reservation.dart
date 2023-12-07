import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/detail/screens/reservation/widget/body.dart';
import '../../../children/cubit/children_cubit.dart';
import '../../../driver/cubit/driver_cubit.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen(
      {super.key, required this.setterId, required this.hourPrice});
  final int setterId;
  final String hourPrice;
  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  void initState() {
    GetIt.I<DriverCubit>().driverId = null;
    GetIt.I<DriverCubit>().driverimage = null;
    GetIt.I<DriverCubit>().drivername = null;
    GetIt.I<ChildrenCubit>().childrenName.clear();
    GetIt.I<ChildrenCubit>().childrenImage.clear();
    GetIt.I<ChildrenCubit>().childrenSeleted.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Reservation detail", "تفاصيل الحجز"),
          context: context),
      body: ReservationBody(
        setterId: widget.setterId,
        hourPrice: widget.hourPrice,
      ),
    );
  }
}
