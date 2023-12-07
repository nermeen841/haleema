import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/helper/validation.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_drop_down.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:halema/presentation/screens/auth/register/widget/body.dart';
import 'package:halema/presentation/widget/auth_custom_body.dart';

import '../../../../../core/router/router.dart';
import '../../../../../core/utiles/cubit/app_cubit.dart';
import '../../cubit/auth_cubit.dart';
import '../../register/register.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController phone = TextEditingController();
  FocusNode nameFocuse = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthCustomBody(
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        bloc: GetIt.I<AppCubit>(),
        builder: (context, state) {
          return AnimatedSizeAndFade(
            fadeDuration: const Duration(milliseconds: 300),
            sizeDuration: const Duration(milliseconds: 600),
            child: GetIt.I<AppCubit>().toggleRegister
                ? const RegisterBody()
                : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(context) * 0.04),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const VerticalSpace(value: 6),
                          Text(
                            LocaleKeys.WELCOME_MESSAGE.tr(),
                            style: headingStyle1(
                                color: colorBlack, context: context),
                          ),
                          const VerticalSpace(value: 1),
                          Text(
                            LocaleKeys.LOGIN_TITLE.tr(),
                            style:
                                bodyStryle(color: colorBlack, context: context),
                          ),
                          const VerticalSpace(value: 7),
                          CustomTextFormField(
                            controller: phone,
                            inputType: TextInputType.phone,
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
                            // Container(
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
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       Image.asset(AppIcons.saudiFlag),
                            //       Icon(
                            //         Icons.keyboard_arrow_down_rounded,
                            //         color: colorGrey,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ),
                          const VerticalSpace(value: 5),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {},
                            bloc: GetIt.I<AuthCubit>(),
                            builder: (context, state) {
                              return (state is! LoginLoadingState)
                                  ? CustomGeneralButton(
                                      text: LocaleKeys.LOG.tr(),
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          GetIt.I<AuthCubit>().postLogin(
                                            phone: phone.text,
                                          );
                                        }
                                      },
                                      color: kMainColor,
                                      textColor: Colors.white,
                                    )
                                  : Center(
                                      child: loading(),
                                    );
                            },
                          ),
                          const VerticalSpace(value: 3),
                          InkWell(
                            onTap: () =>
                                // GetIt.I<AppCubit>().changetoggleRegister(),
                                MagicRouter.navigateTo(const RegisterScreen()),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: LocaleKeys.NOT_HAVE_ACCOUNT.tr(),
                                    style: bodyStryle(
                                      color: colorBlack,
                                      context: context,
                                    ),
                                  ),
                                  TextSpan(
                                    text: LocaleKeys.JOIN.tr(),
                                    style: bodyStryle(
                                      color: kMainColor,
                                      context: context,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
