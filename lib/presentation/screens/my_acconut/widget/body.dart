import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_drop_down.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:halema/presentation/screens/chnage_phone/screens/change_phone.dart';
import 'package:halema/presentation/screens/chnage_phone/screens/success.dart';
import 'package:halema/presentation/screens/map/change_address.dart';
import 'package:halema/presentation/screens/my_acconut/widget/data_item.dart';
import 'package:halema/presentation/screens/my_acconut/widget/edit_data_item.dart';

import '../../../../core/utiles/cubit/app_cubit.dart';
import '../../auth/cubit/auth_cubit.dart';

class MyAccountBody extends StatefulWidget {
  const MyAccountBody({super.key});

  @override
  State<MyAccountBody> createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  TextEditingController name = TextEditingController();
  TextEditingController idcard = TextEditingController();
  TextEditingController email = TextEditingController();
  String? birthDate;

  @override
  void initState() {
    if (GetIt.I<AuthCubit>().profileModel != null) {
      name.text = GetIt.I<AuthCubit>().profileModel!.user!.name!;
      idcard.text = GetIt.I<AuthCubit>().profileModel!.user!.nationalId ?? "";
      email.text = GetIt.I<AuthCubit>().profileModel!.user!.email!;
      birthDate = GetIt.I<AuthCubit>().profileModel!.user!.dateOfBirth ?? "";
      if (GetIt.I<AuthCubit>().profileModel!.user!.gender == "male") {
        GetIt.I<AppCubit>().isMale = true;
      } else if (GetIt.I<AuthCubit>().profileModel!.user!.gender == "female") {
        GetIt.I<AppCubit>().isMale = false;
      } else {
        GetIt.I<AppCubit>().isMale = null;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: GetIt.I<AuthCubit>(),
      listener: (context, state) {},
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
                const VerticalSpace(value: 6),
                DataInfoItem(
                  title: translateString("Name", "الاسم"),
                  data: GetIt.I<AuthCubit>().profileModel!.user!.name!,
                  icon: AppIcons.personSolidIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Name", "الاسم"),
                      ontap: () {
                        GetIt.I<AuthCubit>().updateProfile(name: name.text);
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
                  data: GetIt.I<AuthCubit>().profileModel!.user!.phone!,
                  icon: AppIcons.phoneRingingIcon,
                  color: colorGrey,
                  ontap: () => MagicRouter.navigateTo(
                    ChangePhoneScreen(
                        title: translateString("Enter the new mobile number",
                            "أدخل رقم الجوال الجديد"),
                        ontap: () => MagicRouter.navigateAndPReplacement(
                            const SuccessScreen())),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: LocaleKeys.EMAIL.tr(),
                  data: GetIt.I<AuthCubit>().profileModel!.user!.email!,
                  icon: AppIcons.mailIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: LocaleKeys.EMAIL.tr(),
                      ontap: () {
                        GetIt.I<AuthCubit>().updateProfile(email: email.text);
                        Navigator.pop(context);
                      },
                      icon: AppIcons.mailIcon,
                      textField: CustomTextFormField(
                        inputType: TextInputType.emailAddress,
                        hint: "",
                        controller: email,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString(
                      "Identity number / Iqama", "الرقم الهويه/ الأقامة"),
                  data:
                      GetIt.I<AuthCubit>().profileModel!.user!.nationalId ?? "",
                  icon: AppIcons.idCardIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString(
                          "Identity number / Iqama", "الرقم الهويه/ الأقامة"),
                      ontap: () {
                        GetIt.I<AuthCubit>()
                            .updateProfile(nationalId: idcard.text);
                        Navigator.pop(context);
                      }, /////////
                      icon: AppIcons.idCardIcon,
                      textField: CustomTextFormField(
                        inputType: TextInputType.number,
                        hint: "",
                        controller: idcard,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("Nationality", "الجنسيه"),
                  data: GetIt.I<AuthCubit>().profileModel!.user!.nationality!,
                  icon: AppIcons.publicIcon,
                  color: colorGrey,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Nationality", "الجنسيه"),
                      ontap: () {
                        GetIt.I<AuthCubit>().updateProfile(
                            nationality:
                                NationalityDropDown.selectedNationality);
                        Navigator.pop(context);
                      },
                      icon: AppIcons.publicIcon,
                      textField: const NationalityDropDown(),
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("national address", "العنوان الوطني"),
                  data: GetIt.I<AuthCubit>().profileModel!.user!.address ?? "",
                  icon: AppIcons.homeAddressIcon,
                  ontap: () => MagicRouter.navigateTo(const ChangeAddressScreen(
                    fomUpdateprofile: true,
                  )),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("Birth date", "تاريخ الميلاد"),
                  data: birthDate.toString(),
                  icon: AppIcons.birthdayIcon,
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
                          setState(() {
                            birthDate = DateFormat.yMd().format(dates[0]!);
                          });
                        },
                      ),
                      ontap: () {
                        GetIt.I<AuthCubit>()
                            .updateProfile(dateOfBirth: birthDate);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("Gender", "الجنس"),
                  data: (GetIt.I<AuthCubit>().profileModel!.user!.gender ==
                          "male")
                      ? translateString("male", "ذكر")
                      : (GetIt.I<AuthCubit>().profileModel!.user!.gender ==
                              "female")
                          ? translateString("female", "أنثي")
                          : '',
                  icon: "assets/icons/transgender-symbol-icon 1.svg",
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Gender", "الجنس"),
                      ontap: () {
                        if (GetIt.I<AppCubit>().isMale == true) {
                          GetIt.I<AuthCubit>().updateProfile(gender: "male");
                        } else if (GetIt.I<AppCubit>().isMale == false) {
                          GetIt.I<AuthCubit>().updateProfile(gender: "female");
                        }
                        Navigator.pop(context);
                      },
                      icon: "assets/icons/transgender-symbol-icon 1.svg",
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
                                      onTap: () {
                                        GetIt.I<AppCubit>().changeGender1(true);
                                      },
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        color:
                                            (GetIt.I<AppCubit>().isMale == true)
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
                                        GetIt.I<AppCubit>()
                                            .changeGender1(false);
                                      },
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        color: (GetIt.I<AppCubit>().isMale ==
                                                false)
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
