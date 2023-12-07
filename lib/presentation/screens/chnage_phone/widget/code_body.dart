import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/chnage_phone/cubit/change_phone_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/colors.dart';
import '../../profile/screens/delete_account/confirm_delete.dart';

class CodeWhiteBody extends StatefulWidget {
  final VoidCallback ontap;
  final String? countryCode;
  final String? phone;
  const CodeWhiteBody(
      {super.key, required this.ontap, this.countryCode, this.phone});

  @override
  State<CodeWhiteBody> createState() => _CodeWhiteBodyState();
}

class _CodeWhiteBodyState extends State<CodeWhiteBody> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.03,
        vertical: screenHeight(context) * 0.06,
      ),
      child: Column(
        children: [
          SvgPicture.asset("assets/icons/Enter OTP-bro.svg"),
          const VerticalSpace(value: 2),
          Text(
            translateString(
              "please enter code sent to your phone",
              "الرجاء إدخال رمز التحقق المرسل إليك",
            ),
            style: bodyStryle(color: colorBlack, context: context),
          ),
          const VerticalSpace(value: 2),
          PinCodeTextField(
            length: 6,
            appContext: context,
            obscureText: false,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              borderWidth: 1.5,
              fieldHeight: 55,
              fieldWidth: 50,
              inactiveColor: textBorderColor,
              activeColor: kMainColor,
              selectedColor: kMainColor,
              inactiveFillColor: Colors.white,
              selectedFillColor: Colors.white,
              activeFillColor: Colors.white,
            ),
            enableActiveFill: true,
            controller: _otpController,
            onCompleted: (v) {
              debugPrint("Completed");
            },
            onChanged: (value) {},
          ),
          // const VerticalSpace(value: 1),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Text(
          //       translateString("Didn't recive code ? ", "لم تتلقى الرمز؟ "),
          //       style: bodyStryle3(color: colorGrey, context: context),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Text(
          //         translateString("Resend", "إعادة إرسال"),
          //         style: bodyStryle2(color: kMainColor, context: context)
          //             .copyWith(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ],
          // ),
          const VerticalSpace(value: 4),
          BlocConsumer<ChangePhoneCubit, ChangePhoneState>(
            bloc: GetIt.I<ChangePhoneCubit>(),
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return CustomGeneralButton(
                text: translateString("Check", "تحقق"),
                onTap: () {
                  if (widget.phone != null && widget.countryCode != null) {
                    GetIt.I<ChangePhoneCubit>().updatePhone(
                        code: _otpController.text,
                        countryCode: widget.countryCode!,
                        phone: widget.phone!);
                  } else {
                    MagicRouter.navigateAndPReplacement(ConfirmDelteScreen(
                      code: _otpController.text,
                    ));
                  }
                },
                color: kMainColor,
                textColor: Colors.white,
              );
            },
          ),
        ],
      ),
    );
  }
}
