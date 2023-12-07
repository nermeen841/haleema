import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/presentation/screens/chnage_phone/cubit/change_phone_cubit.dart';
import 'package:halema/presentation/screens/chnage_phone/screens/code_screen.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/text_theme.dart';
import '../../../../core/helper/validation.dart';
import '../../../../core/widgets/custom_drop_down.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../../generator/locale_keys.dart';

class ChangePhoneBody extends StatefulWidget {
  final String title;
  final VoidCallback ontap;
  const ChangePhoneBody({super.key, required this.title, required this.ontap});

  @override
  State<ChangePhoneBody> createState() => _ChangePhoneBodyState();
}

class _ChangePhoneBodyState extends State<ChangePhoneBody> {
  TextEditingController phone = TextEditingController();
  FocusNode nameFocuse = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.04,
        vertical: screenHeight(context) * 0.02,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/Calling-amico 1.svg"),
            const VerticalSpace(value: 4),
            Text(
              widget.title,
              style: headingStyle1(
                context: context,
                color: colorBlack,
              ),
            ),
            const VerticalSpace(value: 4),
            CustomTextFormField(
              controller: phone,
              inputType: TextInputType.phone,
              fillColor: Colors.white,
              borderColor: textBorderColor,
              validator: (value) => validate(value!),
              focusNode: nameFocuse,
              onEditingComplete: () => nameFocuse.unfocus(),
              hint: LocaleKeys.PHONE.tr(),
              suffix: SizedBox(
                width: screenWidth(context) * 0.2,
                height: screenHeight(context) * 0.03,
                child: const CountryDropDownSelection(
                  fillColor: Colors.transparent,
                ),
              ),
              // suffix: Container(
              //   width: screenWidth(context) * 0.2,
              //   height: screenHeight(context) * 0.03,
              //   margin: const EdgeInsets.all(7),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(
              //       screenWidth(context) * 0.015,
              //     ),
              //     border: Border.all(color: textBorderColor),
              //     color: Colors.transparent,
              //   ),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Icon(
              //         Icons.keyboard_arrow_down_rounded,
              //         color: colorGrey,
              //       ),
              //       Image.asset(AppIcons.saudiFlag),
              //     ],
              //   ),
              // ),
            ),
            const VerticalSpace(value: 5),
            BlocConsumer<ChangePhoneCubit, ChangePhoneState>(
              bloc: GetIt.I<ChangePhoneCubit>(),
              listener: (context, state) {
                if (state is SendVerificationCodeSuccess) {
                  MagicRouter.navigateTo(CodeWhiteScreen(
                    ontap: widget.ontap,
                    countryCode: CountryDropDownSelection.selectedCountry,
                    phone: phone.text,
                  ));
                }
              },
              builder: (context, state) {
                return (state is! SendVerificationCodeLoading)
                    ? CustomGeneralButton(
                        text: LocaleKeys.NEXT.tr(),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            GetIt.I<ChangePhoneCubit>().sendVerificationCode();
                          }
                        },
                        color: kMainColor,
                        textColor: Colors.white,
                      )
                    : loading();
              },
            ),
          ],
        ),
      ),
    );
  }
}
