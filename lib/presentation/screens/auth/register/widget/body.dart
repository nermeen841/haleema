import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/helper/validation.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/custom_drop_down.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/generator/locale_keys.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:halema/presentation/widget/auth_custom_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:halema/presentation/widget/upload_image.dart';
import 'package:image_picker/image_picker.dart';

import '../../code/code.dart';
import '../../login/login.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  FocusNode nameFocuse = FocusNode();
  FocusNode phoneFocuse = FocusNode();
  FocusNode emailFocuse = FocusNode();
  FocusNode locationFocuse = FocusNode();
  FocusNode birthDateFocuse = FocusNode();
  final formKey = GlobalKey<FormState>();
  File? profileImage;
  String? profileImageApi;

  @override
  Widget build(BuildContext context) {
    return AuthCustomBody(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.04,
            vertical: screenHeight(context) * 0.03,
          ),
          child: Column(
            children: [
              UploadImageWidget(
                title: translateString("profile image", "صورة شخصية"),
                selectedImage: profileImage,
                image: AppIcons.cameraIcon,
                ontap: () => uploadImage(
                  context: context,
                  ontapGallery: () async {
                    final ImagePicker picker = ImagePicker();

                    final image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      setState(() {
                        profileImage = File(image.path);
                        profileImageApi = image.path;
                      });
                    }
                    MagicRouter.pop();
                  },
                  ontapCamera: () async {
                    final ImagePicker picker = ImagePicker();

                    final image =
                        await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      setState(() {
                        profileImage = File(image.path);
                        profileImageApi = image.path;
                      });
                    }
                    MagicRouter.pop();
                  },
                ),
              ),
              const VerticalSpace(value: 2),
              CustomTextFormField(
                controller: name,
                inputType: TextInputType.name,
                validator: (value) => validateName(value!),
                focusNode: nameFocuse,
                onEditingComplete: () {
                  nameFocuse.unfocus();
                  FocusScope.of(context).requestFocus(phoneFocuse);
                },
                hint: LocaleKeys.NAME.tr(),
                prefix: SvgPicture.asset(
                  "assets/icons/User (1).svg",
                  height: 5,
                  width: 5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpace(value: 2),
              CustomTextFormField(
                controller: phone,
                inputType: TextInputType.phone,
                validator: (value) => validate(value!),
                focusNode: phoneFocuse,
                onEditingComplete: () {
                  phoneFocuse.unfocus();
                  FocusScope.of(context).requestFocus(emailFocuse);
                },
                hint: LocaleKeys.PHONE.tr(),
                prefix: SvgPicture.asset(
                  AppIcons.phoneRingingIcon,
                  color: colorGrey,
                  height: 5,
                  width: 5,
                  fit: BoxFit.scaleDown,
                ),
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
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              const VerticalSpace(value: 2),
              CustomTextFormField(
                controller: email,
                inputType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value!),
                focusNode: emailFocuse,
                onEditingComplete: () {
                  emailFocuse.unfocus();
                  FocusScope.of(context).requestFocus(locationFocuse);
                },
                hint: LocaleKeys.EMAIL.tr(),
                prefix: SvgPicture.asset(
                  AppIcons.mailIcon,
                  height: 5,
                  width: 5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpace(value: 2),
              NationalityDropDown(
                text: translateString("Nationality", "الجنسية"),
              ),
              // const VerticalSpace(value: 2),
              // CustomTextFormField(
              //   controller: location,
              //   readOnly: true,
              //   ontap: () =>
              //       MagicRouter.navigateTo(const ChangeAddressScreen()),
              //   inputType: TextInputType.streetAddress,
              //   validator: (value) => validate(value!),
              //   focusNode: locationFocuse,
              //   onEditingComplete: () {
              //     locationFocuse.unfocus();
              //   },
              //   hint: translateString("Location", "موقع المنزل"),
              //   prefix: SvgPicture.asset(
              //     AppIcons.locationIcon,
              //     height: 5,
              //     width: 5,
              //     fit: BoxFit.scaleDown,
              //   ),
              //   suffix: SvgPicture.asset(
              //     AppIcons.informationMarkIcon,
              //     height: 5,
              //     width: 5,
              //     fit: BoxFit.scaleDown,
              //   ),
              // ),
              // const VerticalSpace(value: 2),
              // CustomTextFormField(
              //   controller: birthDate,
              //   readOnly: true,
              //   ontap: () => showCustomDialog(
              //     context,
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         CalendarDatePicker2(
              //           config: CalendarDatePicker2Config(
              //             calendarType: CalendarDatePicker2Type.single,
              //           ),
              //           value: [
              //             DateTime.now(),
              //           ],
              //           onValueChanged: (dates) {},
              //         ),
              //         const VerticalSpace(value: 2),
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: screenWidth(context) * 0.4,
              //               child: CustomGeneralButton(
              //                 text: translateString("Done", "موافق"),
              //                 onTap: () {},
              //               ),
              //             ),
              //             SizedBox(
              //               width: screenWidth(context) * 0.4,
              //               child: CustomGeneralButton(
              //                 color: kMainColor.withOpacity(0.3),
              //                 textColor: kMainColor,
              //                 text: translateString("Cancel", "إالغاء"),
              //                 onTap: () => MagicRouter.pop(),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              //   hint: translateString("Birth date", "تاريخ الميلاد"),
              //   prefix: SvgPicture.asset(
              //     AppIcons.birthdayIcon,
              //     height: 5,
              //     width: 5,
              //     fit: BoxFit.scaleDown,
              //   ),
              // ),

              const VerticalSpace(value: 3),
              BlocConsumer<AuthCubit, AuthState>(
                bloc: GetIt.I<AuthCubit>(),
                listener: (context, state) {
                  if (state is RegisterSuccessState) {
                    MagicRouter.navigateTo(CodeScreen(
                      phone: phone.text,
                    ));
                  }
                },
                builder: (context, state) {
                  return (state is! RegisterLoadingState)
                      ? CustomGeneralButton(
                          text: LocaleKeys.JOIN.tr(),
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              GetIt.I<AuthCubit>().postRegister(
                                name: name.text,
                                phone: phone.text,
                                email: email.text,
                                image: (profileImageApi != null)
                                    ? MultipartFile.fromFileSync(
                                        profileImageApi!)
                                    : null,
                                nationality:
                                    NationalityDropDown.selectedNationality ??
                                        "",
                                phoneCode:
                                    CountryDropDownSelection.selectedCountry ??
                                        "",
                              );
                            }
                          },
                          color: kMainColor,
                          textColor: Colors.white,
                        )
                      : loading();
                },
              ),
              const VerticalSpace(value: 3),
              InkWell(
                onTap: () {
                  MagicRouter.navigateAndPopAll(const LoginScreen());
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${LocaleKeys.HAVE_ACCOUNT.tr()}  ",
                        style: bodyStryle(
                          color: colorBlack,
                          context: context,
                        ),
                      ),
                      TextSpan(
                        text: LocaleKeys.LOGIN_BUTTON.tr(),
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
  }
}
