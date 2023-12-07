import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/helper/validation.dart';
import 'package:halema/core/utiles/cubit/app_cubit.dart';
import 'package:halema/core/widgets/custom_drop_down.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:halema/presentation/screens/driver/cubit/driver_cubit.dart';
import 'package:halema/presentation/screens/my_acconut/widget/data_item.dart';
import 'package:halema/presentation/screens/my_acconut/widget/edit_data_item.dart';

class DriverDetailBody extends StatefulWidget {
  const DriverDetailBody({super.key});

  @override
  State<DriverDetailBody> createState() => _DriverDetailBodyState();
}

class _DriverDetailBodyState extends State<DriverDetailBody> {
  TextEditingController name = TextEditingController();
  TextEditingController idcard = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  void initState() {
    if (GetIt.I<DriverCubit>().driverDetailModel != null) {
      name.text =
          GetIt.I<DriverCubit>().driverDetailModel!.driverDetails!.name!;
      email.text =
          GetIt.I<DriverCubit>().driverDetailModel!.driverDetails!.email ?? "";
      idcard.text =
          GetIt.I<DriverCubit>().driverDetailModel!.driverDetails!.phone ?? "";
      GetIt.I<AppCubit>().selectedGender =
          GetIt.I<DriverCubit>().driverDetailModel!.driverDetails!.gender ?? "";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverState>(
      listener: (context, state) {},
      bloc: GetIt.I<DriverCubit>(),
      builder: (context, state) {
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
              children: [
                const VerticalSpace(value: 10),
                DataInfoItem(
                  title: translateString("Name", "الاسم"),
                  data: GetIt.I<DriverCubit>()
                      .driverDetailModel!
                      .driverDetails!
                      .name!,
                  icon: AppIcons.personSolidIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Name", "الاسم"),
                      ontap: () {
                        GetIt.I<DriverCubit>().editDriver(
                          id: GetIt.I<DriverCubit>()
                              .driverDetailModel!
                              .driverDetails!
                              .id!,
                          name: name.text,
                        );
                        Navigator.pop(context);
                      },
                      icon: AppIcons.personSolidIcon,
                      textField: CustomTextFormField(
                        inputType: TextInputType.name,
                        hint: "",
                        controller: name,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: LocaleKeys.PHONE.tr(),
                  data: GetIt.I<DriverCubit>()
                      .driverDetailModel!
                      .driverDetails!
                      .phone!,
                  icon: AppIcons.phoneRingingIcon,
                  color: colorGrey,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: LocaleKeys.PHONE.tr(),
                      icon: AppIcons.phoneRingingIcon,
                      textField: CustomTextFormField(
                        controller: idcard,
                        inputType: TextInputType.phone,
                        validator: (value) => validate(value!),
                        hint: "",
                        suffix: SizedBox(
                          width: screenWidth(context) * 0.2,
                          height: screenHeight(context) * 0.03,
                          child: CountryDropDownSelection(
                            text: GetIt.I<DriverCubit>()
                                .driverDetailModel!
                                .driverDetails!
                                .phoneCode,
                          ),
                        ),
                      ),
                      ontap: () {
                        GetIt.I<DriverCubit>().editDriver(
                          id: GetIt.I<DriverCubit>()
                              .driverDetailModel!
                              .driverDetails!
                              .id!,
                          phone: idcard.text,
                          phoneCode: CountryDropDownSelection.selectedCountry,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: LocaleKeys.EMAIL.tr(),
                  data: GetIt.I<DriverCubit>()
                      .driverDetailModel!
                      .driverDetails!
                      .email!,
                  icon: AppIcons.mailIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: LocaleKeys.EMAIL.tr(),
                      ontap: () {
                        GetIt.I<DriverCubit>().editDriver(
                          id: GetIt.I<DriverCubit>()
                              .driverDetailModel!
                              .driverDetails!
                              .id!,
                          email: email.text,
                        );
                        Navigator.pop(context);
                      },
                      icon: AppIcons.mailIcon,
                      textField: CustomTextFormField(
                        inputType: TextInputType.emailAddress,
                        controller: email,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("Nationality", "الجنسيه"),
                  data: GetIt.I<DriverCubit>()
                      .driverDetailModel!
                      .driverDetails!
                      .nationality!,
                  icon: AppIcons.publicIcon,
                  color: colorGrey,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Nationality", "الجنسيه"),
                      ontap: () {
                        GetIt.I<DriverCubit>().editDriver(
                          id: GetIt.I<DriverCubit>()
                              .driverDetailModel!
                              .driverDetails!
                              .id!,
                          nationality: NationalityDropDown.selectedNationality,
                        );
                        Navigator.pop(context);
                      },
                      icon: AppIcons.publicIcon,
                      textField: NationalityDropDown(
                        text: GetIt.I<DriverCubit>()
                            .driverDetailModel!
                            .driverDetails!
                            .nationality!,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("Birth date", "تاريخ الميلاد"),
                  data: GetIt.I<DriverCubit>()
                      .driverDetailModel!
                      .driverDetails!
                      .dateOfBirth!,
                  icon: AppIcons.birthdayIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: BlocConsumer<DriverCubit, DriverState>(
                      listener: (context, state) {},
                      bloc: GetIt.I<DriverCubit>(),
                      builder: (context, state) {
                        return EditDataItem(
                          title: translateString("Birth date", "تاريخ الميلاد"),
                          icon: AppIcons.birthdayIcon,
                          textField: CalendarDatePicker2(
                            config: CalendarDatePicker2Config(
                              calendarType: CalendarDatePicker2Type.single,
                            ),
                            value: [
                              DateTime.now(),
                            ],
                            onValueChanged: (dates) {
                              if (dates[0]!.isBefore(DateTime.now())) {
                                GetIt.I<DriverCubit>().editDriver(
                                  id: GetIt.I<DriverCubit>()
                                      .driverDetailModel!
                                      .driverDetails!
                                      .id!,
                                  birthdate:
                                      "${dates[0]!.year}-${dates[0]!.month}-${dates[0]!.day}",
                                );
                                Navigator.pop(context);
                              }
                            },
                          ),
                          ontap: () => Navigator.pop(context),
                        );
                      },
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("Gender", "الجنس"),
                  data: (GetIt.I<AppCubit>().selectedGender == "female")
                      ? translateString("female", "أنثي")
                      : (GetIt.I<AppCubit>().selectedGender == "male")
                          ? translateString("Male", "ذكر")
                          : "",
                  icon: AppIcons.genderIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Gender", "الجنس"),
                      ontap: () {
                        GetIt.I<DriverCubit>().editDriver(
                          id: GetIt.I<DriverCubit>()
                              .driverDetailModel!
                              .driverDetails!
                              .id!,
                          gender: GetIt.I<AppCubit>().selectedGender,
                        );
                        Navigator.pop(context);
                      },
                      icon: AppIcons.genderIcon,
                      textField: Container(
                        width: double.infinity,
                        height: screenHeight(context) * 0.1,
                        decoration: BoxDecoration(
                          color: textFormFieldColor,
                          borderRadius: BorderRadius.circular(
                            screenWidth(context) * 0.03,
                          ),
                        ),
                        child: BlocConsumer<AppCubit, AppState>(
                          listener: (context, state) {},
                          bloc: GetIt.I<AppCubit>(),
                          builder: (context, state) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => GetIt.I<AppCubit>()
                                          .changeGender("male"),
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        color: (GetIt.I<AppCubit>()
                                                    .selectedGender ==
                                                "male")
                                            ? kMainColor
                                            : kMainColor.withOpacity(0.3),
                                      ),
                                    ),
                                    const HorizontalSpace(value: 1),
                                    Text(
                                      LocaleKeys.MALE.tr(),
                                      style: bodyStryle(
                                        context: context,
                                        color: colorGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                const HorizontalSpace(value: 3),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => GetIt.I<AppCubit>()
                                          .changeGender("female"),
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        color: (GetIt.I<AppCubit>()
                                                    .selectedGender ==
                                                "female")
                                            ? kMainColor
                                            : kMainColor.withOpacity(0.3),
                                      ),
                                    ),
                                    const HorizontalSpace(value: 1),
                                    Text(
                                      LocaleKeys.FEMALE.tr(),
                                      style: bodyStryle(
                                        context: context,
                                        color: colorGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
