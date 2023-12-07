// ignore_for_file: use_build_context_synchronously

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/helper/functions/custom_dialog_function.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:halema/presentation/screens/children/cubit/children_cubit.dart';
import 'package:halema/presentation/screens/children/screen/add_child/add_child.dart';
import 'package:halema/presentation/screens/detail/screens/payment/payment.dart';
import 'package:halema/presentation/screens/driver/cubit/driver_cubit.dart';
import 'package:halema/presentation/screens/driver/screen/add_driver/add_driver.dart';
import 'package:halema/presentation/screens/map/change_address.dart';
import 'package:halema/presentation/screens/profile/screens/wallet/cubit/wallet_cubit.dart';
import 'package:halema/presentation/widget/expendables_selection.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../widget/drivers_selection.dart';

TextEditingController address = TextEditingController();

class ReservationBody extends StatefulWidget {
  const ReservationBody(
      {super.key, required this.setterId, required this.hourPrice});
  final int setterId;
  final String hourPrice;
  @override
  State<ReservationBody> createState() => _ReservationBodyState();
}

class _ReservationBodyState extends State<ReservationBody> {
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? timeApi;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            screenWidth(context) * 0.08,
          ),
          topRight: Radius.circular(
            screenWidth(context) * 0.08,
          ),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight(context) * 0.02,
          horizontal: screenWidth(context) * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ExpandableSelection(),
            const VerticalSpace(value: 1),
            BlocConsumer<ChildrenCubit, ChildrenState>(
              listener: (context, state) {},
              bloc: GetIt.I<ChildrenCubit>(),
              builder: (context, state) => (GetIt.I<ChildrenCubit>()
                      .childrenName
                      .isEmpty)
                  ? InkWell(
                      onTap: () =>
                          MagicRouter.navigateTo(const AddChildScreen()),
                      child: Text(
                        translateString("+ Add new child", "+ أضف طفل جديد "),
                        style: bodyStryle(
                          context: context,
                          color: kMainColor,
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: BlocConsumer<ChildrenCubit, ChildrenState>(
                        listener: (context, state) {},
                        bloc: GetIt.I<ChildrenCubit>(),
                        builder: (context, state) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              GetIt.I<ChildrenCubit>().childrenName.length,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth(context) * 0.02,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: screenWidth(context) * 0.2,
                                      height: screenHeight(context) * 0.1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          screenWidth(context) * 0.03,
                                        ),
                                        child: customCachedNetworkImage(
                                          url: GetIt.I<ChildrenCubit>()
                                              .childrenImage[index],
                                          context: context,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const VerticalSpace(value: 1),
                                    Text(
                                      GetIt.I<ChildrenCubit>()
                                          .childrenName[index],
                                      style: bodyStryle(
                                        context: context,
                                        color: colorBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
            const VerticalSpace(value: 3),
            const DriversSelection(),
            const VerticalSpace(value: 1),
            BlocConsumer<DriverCubit, DriverState>(
              listener: (context, state) {},
              bloc: GetIt.I<DriverCubit>(),
              builder: (context, state) {
                return (GetIt.I<DriverCubit>().driverId == null)
                    ? InkWell(
                        onTap: () =>
                            MagicRouter.navigateTo(const AddDriverScreen()),
                        child: Text(
                          translateString(
                              "+ Add new driver", "+ أضف سائق جديد "),
                          style: bodyStryle(
                            context: context,
                            color: kMainColor,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(context) * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenWidth(context) * 0.2,
                              height: screenHeight(context) * 0.1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  screenWidth(context) * 0.03,
                                ),
                                child: customCachedNetworkImage(
                                  url: GetIt.I<DriverCubit>().driverimage ?? "",
                                  context: context,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const VerticalSpace(value: 1),
                            Text(
                              GetIt.I<DriverCubit>().drivername ?? "",
                              style: bodyStryle(
                                context: context,
                                color: colorBlack,
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
            const VerticalSpace(value: 3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translateString("Hours number", "عدد الساعات"),
                      style: bodyStryle(
                        context: context,
                        color: textcolor,
                      ),
                    ),
                    const VerticalSpace(value: 1),
                    SizedBox(
                      width: screenWidth(context) * 0.45,
                      child: CustomHourSelectionDropDown(
                        items: const ["1", "2", "3", "4", "5", "6", "7"],
                        fillColor: textFormFieldColor,
                        text: translateString("Hours number", "عدد الساعات"),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translateString("Days number", "عدد الأيام"),
                      style: bodyStryle(
                        context: context,
                        color: textcolor,
                      ),
                    ),
                    const VerticalSpace(value: 1),
                    SizedBox(
                      width: screenWidth(context) * 0.4,
                      child: CustomDropDown(
                        items: const ["1", "2", "3", "4", "5", "6", "7"],
                        fillColor: textFormFieldColor,
                        text: translateString("Days number", "عدد الأيام"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const VerticalSpace(value: 3),
            CustomTextFormField(
              hint:
                  translateString("confirm child address", "تأكيد عنوان الطفل"),
              controller: address,
              inputType: TextInputType.streetAddress,
              readOnly: true,
              ontap: () => MagicRouter.navigateTo(const ChangeAddressScreen()),
              prefix: SvgPicture.asset(
                AppIcons.locationIcon,
                height: 5,
                width: 5,
                fit: BoxFit.scaleDown,
              ),
            ),
            const VerticalSpace(value: 3),
            CustomTextFormField(
              hint: translateString("Date", "التاريخ"),
              controller: date,
              inputType: TextInputType.datetime,
              readOnly: true,
              ontap: () => showCustomDialog(
                context,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.single,
                      ),
                      value: [
                        DateTime.now(),
                      ],
                      onValueChanged: (dates) {
                        if (dates[0]!.isAfter(DateTime.now())) {
                          var formatter = DateFormat('yyyy-MM-dd');
                          String formattedDate = formatter.format(dates[0]!);
                          date.text = formattedDate;
                        }
                      },
                    ),
                    const VerticalSpace(value: 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (date.text.isEmpty) {
                              var formatter = DateFormat('yyyy-MM-dd');
                              String formattedDate =
                                  formatter.format(DateTime.now());
                              date.text = formattedDate;
                            }
                            MagicRouter.pop();
                          },
                          child: Text(
                            translateString("Done", "موافق"),
                            style:
                                bodyStryle(context: context, color: kMainColor)
                                    .copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => MagicRouter.pop(),
                          child: Text(
                            translateString("Cancel", "إلغاء"),
                            style:
                                bodyStryle(context: context, color: kMainColor)
                                    .copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              suffix: SvgPicture.asset(
                AppIcons.calenderIconSelection,
                height: 5,
                width: 5,
                fit: BoxFit.scaleDown,
              ),
            ),
            const VerticalSpace(value: 3),
            CustomTextFormField(
              hint: translateString("Time", "الوقت"),
              controller: time,
              inputType: TextInputType.datetime,
              readOnly: true,
              ontap: () async {
                var time1 = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.input,
                );
                if (time1 != null) {
                  setState(() {
                    final localizations = MaterialLocalizations.of(context);
                    final formattedTimeOfDay =
                        localizations.formatTimeOfDay(TimeOfDay.now());
                    time.text = formattedTimeOfDay;
                    timeApi = '${time1.hour}:${time1.minute}';
                  });
                } else {
                  setState(() {
                    final localizations = MaterialLocalizations.of(context);
                    final formattedTimeOfDay =
                        localizations.formatTimeOfDay(TimeOfDay.now());
                    time.text = formattedTimeOfDay;
                    timeApi = '${DateTime.now().hour}:${DateTime.now().minute}';
                  });
                }
              },
              suffix: SvgPicture.asset(
                AppIcons.timeClockIcon,
                height: 5,
                width: 5,
                fit: BoxFit.scaleDown,
              ),
            ),
            const VerticalSpace(value: 4),
            CustomGeneralButton(
              text: LocaleKeys.NEXT.tr(),
              onTap: () {
                GetIt.I<WalletCubit>().totalAmount();
                MagicRouter.navigateTo(
                  CheckoutScreen(
                    hourPrice: widget.hourPrice,
                    childIds: GetIt.I<ChildrenCubit>().childrenSeleted,
                    setterId: widget.setterId,
                    date: date.text,
                    time: timeApi!,
                    days: int.parse(CustomDropDown.selectedTime!),
                    long: ChangeAddressScreen.long!,
                    lat: ChangeAddressScreen.lat!,
                    hours: int.parse(CustomHourSelectionDropDown.selectedTime!),
                    discount: 0.0,
                    driverId: GetIt.I<DriverCubit>().driverId!,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
