import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:halema/core/helper/validation.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:halema/presentation/screens/children/cubit/children_cubit.dart';
import 'package:halema/presentation/screens/children/screen/add_child/add_child.dart';
import 'package:halema/presentation/screens/my_acconut/widget/edit_data_item.dart';
import 'package:easy_localization/easy_localization.dart';

class AddChildBody extends StatefulWidget {
  const AddChildBody({super.key});

  @override
  State<AddChildBody> createState() => _AddChildBodyState();
}

class _AddChildBodyState extends State<AddChildBody> {
  TextEditingController name = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController disease = TextEditingController();
  TextEditingController hobby = TextEditingController();
  int? haveDisease;
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
                inputType: TextInputType.name,
                hint:
                    translateString("Name of the child", "اسم الطفل / الطفله"),
                prefix: SvgPicture.asset(
                  AppIcons.profileIcon,
                  width: 7,
                  height: 7,
                  fit: BoxFit.scaleDown,
                ),
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
                          setState(() {
                            birthdate.text =
                                "${dates[0]!.year}-${dates[0]!.month}-${dates[0]!.day}";
                          });
                        }
                      },
                    ),
                    ontap: () {
                      MagicRouter.pop();
                    },
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
              const VerticalSpace(value: 2),
              CustomTextFormField(
                hint: translateString("Hobby", "الهوايه"),
                controller: hobby,
                validator: (value) => validate(value!),
                prefix: SvgPicture.asset(
                  AppIcons.hoppyIcon,
                  width: 50,
                  height: 50,
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
                        SvgPicture.asset(AppIcons.covidIcon),
                        const HorizontalSpace(value: 1),
                        Text(
                          translateString("He has diseases?", "لديه أمراض ؟"),
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
                                  haveDisease = 1;
                                });
                              },
                              child: Icon(
                                Icons.radio_button_checked,
                                color: (haveDisease == 1)
                                    ? kMainColor
                                    : kMainColor.withOpacity(0.3),
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
                              onTap: () {
                                setState(() {
                                  haveDisease = 0;
                                });
                              },
                              child: Icon(
                                Icons.radio_button_checked,
                                color: (haveDisease == 0)
                                    ? kMainColor
                                    : kMainColor.withOpacity(0.3),
                              ),
                            ),
                            const HorizontalSpace(value: 1),
                            Text(
                              translateString("No", "لا"),
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
              (haveDisease == 1)
                  ? CustomTextFormField(
                      hint: translateString("disease ", "اكتب الامراض"),
                      controller: disease,
                      // validator: (value) => validate(value!),
                    )
                  : const SizedBox(),
              (haveDisease == 1)
                  ? const VerticalSpace(value: 2)
                  : const SizedBox(),
              CustomTextFormField(
                controller: note,
                inputType: TextInputType.text,
                hint: translateString("note", "ملاحظات"),
                prefix: SvgPicture.asset(
                  AppIcons.noteIcon,
                  width: 15,
                  height: 15,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpace(value: 4),
              BlocConsumer<ChildrenCubit, ChildrenState>(
                listener: (context, state) {},
                bloc: GetIt.I<ChildrenCubit>(),
                builder: (context, state) {
                  return (state is! AddChildrenLoadingState)
                      ? CustomGeneralButton(
                          text: translateString("Add", "أضافه"),
                          onTap: () {
                            debugPrint(AddChildScreen.childImageApi);
                            if (formkey.currentState!.validate()) {
                              if (AddChildScreen.childImageApi != null) {
                                if (gender != null && haveDisease != null) {
                                  GetIt.I<ChildrenCubit>().addChild(
                                    image: MultipartFile.fromFileSync(
                                        AddChildScreen.childImageApi!),
                                    gender: gender!,
                                    birthdate: birthdate.text,
                                    hopy: hobby.text,
                                    disease: disease.text,
                                    note: note.text,
                                    name: name.text,
                                    havedisease: haveDisease!,
                                  );
                                } else {
                                  showToast(
                                    msg: translateString(
                                        "gender and have disease or not must be selected",
                                        "يجب تحديد الجنس واذا كان الطفل لديه امراض"),
                                    state: ToastStates.ERROR,
                                  );
                                }
                              } else {
                                showToast(
                                  msg: translateString("Image is required",
                                      "يجب اختيار صورة الطفل"),
                                  state: ToastStates.ERROR,
                                );
                              }
                            }
                          },
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
