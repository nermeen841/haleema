import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/utiles/cubit/app_cubit.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';

class FilterItem extends StatefulWidget {
  const FilterItem({super.key});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  TextEditingController highPrice = TextEditingController();
  TextEditingController lowPrice = TextEditingController();
  FocusNode highFocuse = FocusNode();
  FocusNode lowFocuse = FocusNode();
  @override
  void initState() {
    highPrice.text = prefs.getString("high") ?? "";
    lowPrice.text = prefs.getString("low") ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      bloc: GetIt.I<AppCubit>(),
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context) * 0.04,
              vertical: screenHeight(context) * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      GetIt.I<AppCubit>().changefilter(-1);
                      GetIt.I<AppCubit>().switchFilter = null;
                      highPrice.clear();
                      lowPrice.clear();
                      prefs.remove("high");
                      prefs.remove("low");
                      GetIt.I<SetterCubit>().filterOption(false);
                      GetIt.I<SetterCubit>().getSetters("");
                    },
                    child: Text(
                      translateString("clear", "مسح"),
                      style: bodyStryle2(context: context, color: colorGrey),
                    ),
                  ),
                  Text(
                    translateString("Filter", "فلتر"),
                    style: headingStyle1(
                      context: context,
                      color: colorBlack,
                    ),
                  ),
                  IconButton(
                    onPressed: () => MagicRouter.pop(),
                    icon: Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: const Color(0xff3C3C43).withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              const VerticalSpace(value: 4),
              Text(
                translateString("classification", "التصنيف"),
                style: headingStyle1(
                  context: context,
                  color: colorBlack,
                ),
              ),
              const VerticalSpace(value: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => GetIt.I<AppCubit>().changefilter(0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight(context) * 0.015,
                        horizontal: screenWidth(context) * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: (GetIt.I<AppCubit>().switchFilter == 0)
                            ? kMainColor
                            : Colors.white,
                        borderRadius:
                            BorderRadius.circular(screenHeight(context) * 0.08),
                        border: Border.all(
                            color: (GetIt.I<AppCubit>().switchFilter == 0)
                                ? Colors.transparent
                                : textFormFieldColor),
                      ),
                      child: Center(
                        child: Text(
                          translateString("most booked", "الأكثر حجزا"),
                          style: bodyStryle2(
                              context: context,
                              color: (GetIt.I<AppCubit>().switchFilter == 0)
                                  ? Colors.white
                                  : colorGrey),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => GetIt.I<AppCubit>().changefilter(1),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight(context) * 0.015,
                        horizontal: screenWidth(context) * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: (GetIt.I<AppCubit>().switchFilter == 1)
                            ? kMainColor
                            : Colors.white,
                        borderRadius:
                            BorderRadius.circular(screenHeight(context) * 0.08),
                        border: Border.all(
                            color: (GetIt.I<AppCubit>().switchFilter == 1)
                                ? Colors.transparent
                                : textFormFieldColor),
                      ),
                      child: Center(
                        child: Text(
                          translateString("top ratted", "الأعلي تقيما"),
                          style: bodyStryle2(
                              context: context,
                              color: (GetIt.I<AppCubit>().switchFilter == 1)
                                  ? Colors.white
                                  : colorGrey),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => GetIt.I<AppCubit>().changefilter(2),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight(context) * 0.015,
                        horizontal: screenWidth(context) * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: (GetIt.I<AppCubit>().switchFilter == 2)
                            ? kMainColor
                            : Colors.white,
                        borderRadius:
                            BorderRadius.circular(screenHeight(context) * 0.08),
                        border: Border.all(
                            color: (GetIt.I<AppCubit>().switchFilter == 2)
                                ? Colors.transparent
                                : textFormFieldColor),
                      ),
                      child: Center(
                        child: Text(
                          translateString("All", "الكل"),
                          style: bodyStryle2(
                              context: context,
                              color: (GetIt.I<AppCubit>().switchFilter == 2)
                                  ? Colors.white
                                  : colorGrey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpace(value: 4),
              Text(
                translateString("price", "السعر"),
                style: headingStyle1(
                  context: context,
                  color: colorBlack,
                ),
              ),
              const VerticalSpace(value: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(context) * 0.04,
                        ),
                        child: Text(
                          translateString("From", "من"),
                          style: bodyStryle(
                            context: context,
                            color: textcolor,
                          ).copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const VerticalSpace(value: 0.7),
                      SizedBox(
                        width: screenWidth(context) * 0.4,
                        height: screenHeight(context) * 0.06,
                        child: CustomTextFormField(
                          hint: "",
                          controller: highPrice,
                          focusNode: highFocuse,
                          inputType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?\.?\d{0,2}'))
                          ],
                          onEditingComplete: () => highFocuse.unfocus(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(context) * 0.04,
                        ),
                        child: Text(
                          translateString("To", "إلي"),
                          style: bodyStryle(
                            context: context,
                            color: textcolor,
                          ).copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const VerticalSpace(value: 0.7),
                      SizedBox(
                        width: screenWidth(context) * 0.4,
                        height: screenHeight(context) * 0.06,
                        child: CustomTextFormField(
                          hint: "",
                          controller: lowPrice,
                          focusNode: lowFocuse,
                          inputType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?\.?\d{0,2}'))
                          ],
                          onEditingComplete: () => lowFocuse.unfocus(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const VerticalSpace(value: 4),
              BlocConsumer<SetterCubit, SetterState>(
                listener: (context, state) {},
                bloc: GetIt.I<SetterCubit>(),
                builder: (context, state) {
                  return CustomGeneralButton(
                    text: translateString("Show Result", "أعرض النتيجة"),
                    onTap: () {
                      prefs.setString("high", highPrice.text);
                      prefs.setString("low", lowPrice.text);
                      GetIt.I<SetterCubit>().filterOption(true);
                      GetIt.I<SetterCubit>().filterSetters(
                        maxHourPrice:
                            (highPrice.text.isNotEmpty) ? highPrice.text : null,
                        minHourPrice:
                            (lowPrice.text.isNotEmpty) ? lowPrice.text : null,
                        highestOrders:
                            (GetIt.I<AppCubit>().switchFilter == 0) ? "" : null,
                        highestRate:
                            (GetIt.I<AppCubit>().switchFilter == 1) ? "" : null,
                      );
                      MagicRouter.pop();
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
