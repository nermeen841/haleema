import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:halema/presentation/widget/auth_custom_body.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeBody extends StatefulWidget {
  final String phone;
  const CodeBody({super.key, required this.phone});

  @override
  State<CodeBody> createState() => _CodeBodyState();
}

class _CodeBodyState extends State<CodeBody> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AuthCustomBody(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.03,
          vertical: screenHeight(context) * 0.03,
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
                inactiveFillColor: textFormFieldColor,
                selectedFillColor: textFormFieldColor,
                activeFillColor: textFormFieldColor,
              ),
              enableActiveFill: true,
              controller: _otpController,
              onCompleted: (v) {
                debugPrint("Completed");
              },
              onChanged: (value) {},
            ),
            const VerticalSpace(value: 1),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  translateString("Didn't recive code ? ", "لم تتلقى الرمز؟ "),
                  style: bodyStryle3(color: colorGrey, context: context),
                ),
                InkWell(
                  onTap: () => GetIt.I<AuthCubit>().resendCode(widget.phone),
                  child: Text(
                    translateString("Resend", "إعادة إرسال"),
                    style: bodyStryle2(color: kMainColor, context: context)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const VerticalSpace(value: 4),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {},
              bloc: GetIt.I<AuthCubit>(),
              builder: (context, state) {
                return (state is! VerifyCodeLoadingState)
                    ? CustomGeneralButton(
                        text: translateString("Check", "تحقق"),
                        onTap: () {
                          if (_otpController.text.isNotEmpty &&
                              _otpController.text.length == 6) {
                            GetIt.I<AuthCubit>().verifyCode(
                                code: _otpController.text, phone: widget.phone);
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
          ],
        ),
      ),
    );
  }
}
