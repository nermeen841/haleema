import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/utiles/cubit/app_cubit.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:halema/presentation/screens/children/cubit/children_cubit.dart';
import 'package:halema/presentation/screens/my_acconut/widget/data_item.dart';
import 'package:halema/presentation/screens/my_acconut/widget/edit_data_item.dart';

class ChildDetailBody extends StatefulWidget {
  const ChildDetailBody({
    super.key,
  });

  @override
  State<ChildDetailBody> createState() => _ChildDetailBodyState();
}

class _ChildDetailBodyState extends State<ChildDetailBody> {
  TextEditingController name = TextEditingController();
  TextEditingController idcard = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController hoppy = TextEditingController();
  TextEditingController birthdate = TextEditingController();

  @override
  void initState() {
    if (GetIt.I<ChildrenCubit>().childDetailModel != null) {
      name.text =
          GetIt.I<ChildrenCubit>().childDetailModel!.childrenDetails!.name!;
      hoppy.text =
          GetIt.I<ChildrenCubit>().childDetailModel!.childrenDetails!.hobby!;
      birthdate.text = GetIt.I<ChildrenCubit>()
          .childDetailModel!
          .childrenDetails!
          .dateOfBirth!;
      idcard.text =
          GetIt.I<ChildrenCubit>().childDetailModel!.childrenDetails!.disease ??
              "";
      note.text =
          GetIt.I<ChildrenCubit>().childDetailModel!.childrenDetails!.note ??
              "";
      GetIt.I<AppCubit>().selectedGender =
          GetIt.I<ChildrenCubit>().childDetailModel!.childrenDetails!.gender!;
      GetIt.I<AppCubit>().haveDisease = GetIt.I<ChildrenCubit>()
          .childDetailModel!
          .childrenDetails!
          .isDiseased!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChildrenCubit, ChildrenState>(
      listener: (context, state) {},
      bloc: GetIt.I<ChildrenCubit>(),
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
                  data: GetIt.I<ChildrenCubit>()
                      .childDetailModel!
                      .childrenDetails!
                      .name!,
                  icon: AppIcons.profileIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Name", "الاسم"),
                      ontap: () {
                        GetIt.I<ChildrenCubit>().editChild(
                          id: GetIt.I<ChildrenCubit>()
                              .childDetailModel!
                              .childrenDetails!
                              .id!,
                          name: name.text,
                        );
                        Navigator.pop(context);
                      },
                      icon: AppIcons.profileIcon,
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
                  title: translateString("Birthdate", "تاريخ الميلاد"),
                  data: GetIt.I<ChildrenCubit>()
                      .childDetailModel!
                      .childrenDetails!
                      .dateOfBirth!,
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
                          if (dates[0]!.isBefore(DateTime.now())) {
                            GetIt.I<ChildrenCubit>().editChild(
                              id: GetIt.I<ChildrenCubit>()
                                  .childDetailModel!
                                  .childrenDetails!
                                  .id!,
                              birthdate:
                                  "${dates[0]!.year}-${dates[0]!.month}-${dates[0]!.day}",
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                      ontap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("Gender", "الجنس"),
                  data: (GetIt.I<AppCubit>().selectedGender == "female")
                      ? translateString("Female", "أنثي")
                      : (GetIt.I<AppCubit>().selectedGender == "male")
                          ? translateString("Male", "ذكر")
                          : "",
                  icon: AppIcons.genderIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Gender", "الجنس"),
                      ontap: () {
                        GetIt.I<ChildrenCubit>().editChild(
                          id: GetIt.I<ChildrenCubit>()
                              .childDetailModel!
                              .childrenDetails!
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
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("Hobby", "الهوايه"),
                  data: GetIt.I<ChildrenCubit>()
                      .childDetailModel!
                      .childrenDetails!
                      .hobby!,
                  icon: AppIcons.hoppyIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("Hobby", "الهوايه"),
                      ontap: () {
                        GetIt.I<ChildrenCubit>().editChild(
                          id: GetIt.I<ChildrenCubit>()
                              .childDetailModel!
                              .childrenDetails!
                              .id!,
                          hopy: hoppy.text,
                        );
                        Navigator.pop(context);
                      },
                      icon: AppIcons.hoppyIcon,
                      textField: CustomTextFormField(
                        hint: "",
                        controller: hoppy,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("illnesses", "أمراض"),
                  data: (GetIt.I<AppCubit>().haveDisease == 1)
                      ? translateString("yes", "نعم")
                      : translateString("no", "لا"),
                  icon: AppIcons.covidIcon,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: BlocConsumer<AppCubit, AppState>(
                      listener: (context, state) {},
                      bloc: GetIt.I<AppCubit>(),
                      builder: (context, state) {
                        return EditDataItem(
                          title: translateString("illnesses", "أمراض"),
                          ontap: () {
                            GetIt.I<ChildrenCubit>().editChild(
                              id: GetIt.I<ChildrenCubit>()
                                  .childDetailModel!
                                  .childrenDetails!
                                  .id!,
                              havedisease: GetIt.I<AppCubit>().haveDisease,
                              disease: idcard.text,
                            );
                            Navigator.pop(context);
                          },
                          icon: AppIcons.covidIcon,
                          textField: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(translateString(
                                        "He has diseases?", "لديه امراض ؟")),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () => GetIt.I<AppCubit>()
                                                  .changeDisease(1),
                                              child: Icon(
                                                Icons.radio_button_checked,
                                                color: (GetIt.I<AppCubit>()
                                                            .haveDisease ==
                                                        1)
                                                    ? kMainColor
                                                    : kMainColor
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                            const HorizontalSpace(value: 1),
                                            Text(
                                              translateString("yes", "نعم"),
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
                                                  .changeDisease(0),
                                              child: Icon(
                                                Icons.radio_button_checked,
                                                color: (GetIt.I<AppCubit>()
                                                            .haveDisease ==
                                                        0)
                                                    ? kMainColor
                                                    : kMainColor
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                            const HorizontalSpace(value: 1),
                                            Text(
                                              translateString("no", "لا"),
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
                              const VerticalSpace(value: 2),
                              (GetIt.I<AppCubit>().haveDisease == 1)
                                  ? CustomTextFormField(
                                      controller: idcard,
                                      maxLines: 4,
                                      hint: translateString(
                                          "Write down the diseases that the child suffers from.",
                                          "أكتب الأمراض الذي يعاني منها الطفل ."),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const VerticalSpace(value: 3),
                DataInfoItem(
                  title: translateString("note", "الملاحظات"),
                  data: GetIt.I<ChildrenCubit>()
                          .childDetailModel!
                          .childrenDetails!
                          .note ??
                      "",
                  icon: AppIcons.noteIcon,
                  color: colorGrey,
                  ontap: () => homeBottomSheet(
                    context: context,
                    child: EditDataItem(
                      title: translateString("note", "الملاحظات"),
                      ontap: () {
                        GetIt.I<ChildrenCubit>().editChild(
                          id: GetIt.I<ChildrenCubit>()
                              .childDetailModel!
                              .childrenDetails!
                              .id!,
                          note: note.text,
                        );
                        Navigator.pop(context);
                      },
                      icon: AppIcons.noteIcon,
                      textField: CustomTextFormField(
                        maxLines: 4,
                        controller: note,
                        hint: "",
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
