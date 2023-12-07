import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_drop_down.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:halema/presentation/screens/driver/cubit/driver_cubit.dart';
import 'package:halema/presentation/screens/driver/screen/add_driver/add_driver.dart';
import 'package:halema/presentation/screens/my_acconut/widget/edit_data_item.dart';
import 'package:easy_localization/easy_localization.dart';

class AddDriverBody extends StatefulWidget {
  const AddDriverBody({super.key});

  @override
  State<AddDriverBody> createState() => _AddDriverBodyState();
}

class _AddDriverBodyState extends State<AddDriverBody> {
  TextEditingController name = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  String? gender;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context),
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
          horizontal: screenWidth(context) * 0.03,
        ),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const VerticalSpace(value: 10),
              CustomTextFormField(
                controller: name,
                inputType: TextInputType.text,
                hint: translateString("Name of the driver", "اسم السائق"),
                prefix: SvgPicture.asset(
                  AppIcons.personSolidIcon,
                  width: 7,
                  height: 7,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpace(value: 2),
              CustomTextFormField(
                controller: phone,
                inputType: TextInputType.phone,
                hint: LocaleKeys.PHONE.tr(),
                prefix: SvgPicture.asset(
                  AppIcons.phoneRingingIcon,
                  width: 7,
                  height: 7,
                  fit: BoxFit.scaleDown,
                  color: colorGrey,
                ),
                suffix: SizedBox(
                  width: screenWidth(context) * 0.2,
                  height: screenHeight(context) * 0.03,
                  child: const CountryDropDownSelection(),
                ),
              ),
              const VerticalSpace(value: 2),
              CustomTextFormField(
                controller: email,
                inputType: TextInputType.emailAddress,
                hint: LocaleKeys.EMAIL.tr(),
                prefix: SvgPicture.asset(
                  AppIcons.mailIcon,
                  width: 7,
                  height: 7,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpace(value: 2),
              NationalityDropDown(
                text: translateString("Nationality", "الجنسيه"),
                fillColor: textFormFieldColor,
              ),
              const VerticalSpace(value: 2),
              CustomTextFormField(
                controller: birthdate,
                readOnly: true,
                ontap: () => homeBottomSheet(
                  context: context,
                  child: EditDataItem(
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
                          birthdate.text =
                              "${dates[0]!.year}-${dates[0]!.month}-${dates[0]!.day}";
                        }
                      },
                    ),
                    ontap: () => Navigator.pop(context),
                  ),
                ),
                inputType: TextInputType.datetime,
                hint: translateString("Birth date", "تاريخ الميلاد"),
                prefix: SvgPicture.asset(
                  AppIcons.birthdayIcon,
                  width: 7,
                  height: 7,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpace(value: 2),
              Container(
                width: double.infinity,
                height: screenHeight(context) * 0.1,
                decoration: BoxDecoration(
                  color: textFormFieldColor,
                  borderRadius: BorderRadius.circular(
                    screenWidth(context) * 0.03,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.genderIcon),
                        const HorizontalSpace(value: 1),
                        Text(
                          translateString("Gender", "الجنس"),
                          style: bodyStryle(
                            context: context,
                            color: colorGrey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  gender = "male";
                                });
                              },
                              child: Icon(
                                Icons.radio_button_checked,
                                color: (gender == "male")
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
                              onTap: () {
                                setState(() {
                                  gender = "female";
                                });
                              },
                              child: Icon(
                                Icons.radio_button_checked,
                                color: (gender == "female")
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
                    ),
                  ],
                ),
              ),
              const VerticalSpace(value: 4),
              BlocConsumer<DriverCubit, DriverState>(
                listener: (context, state) {},
                bloc: GetIt.I<DriverCubit>(),
                builder: (context, state) {
                  return (state is! AddDriverLoadingState)
                      ? CustomGeneralButton(
                          text: translateString("Add", "أضافه"),
                          onTap: () => GetIt.I<DriverCubit>().addDriver(
                            image: MultipartFile.fromFileSync(
                              AddDriverScreen.driverImageApi!,
                            ),
                            gender: gender ?? "",
                            birthdate: birthdate.text,
                            nationality:
                                NationalityDropDown.selectedNationality!,
                            email: email.text,
                            phone: phone.text,
                            name: name.text,
                            phoneCode:
                                CountryDropDownSelection.selectedCountry!,
                          ),
                        )
                      : loading();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
