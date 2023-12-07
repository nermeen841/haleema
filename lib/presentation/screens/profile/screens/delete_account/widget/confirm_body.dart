import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/custom_buttons_widget.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/chnage_phone/cubit/change_phone_cubit.dart';
import 'package:halema/presentation/screens/layout/layout.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class ConfirmDeleteBody extends StatefulWidget {
  const ConfirmDeleteBody({super.key, required this.code});

  final String code;

  @override
  State<ConfirmDeleteBody> createState() => _ConfirmDeleteBodyState();
}

class _ConfirmDeleteBodyState extends State<ConfirmDeleteBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const VerticalSpace(value: 3),
          RippleAnimation(
            color: kMainColor,
            delay: const Duration(milliseconds: 300),
            repeat: true,
            minRadius: 75,
            ripplesCount: 6,
            duration: const Duration(milliseconds: 6 * 300),
            child: Icon(
              Icons.info,
              color: colorRed,
              size: screenWidth(context) * 0.5,
            ),
          ),
          const VerticalSpace(value: 3),
          Center(
            child: SizedBox(
              width: screenWidth(context) * 0.8,
              child: Text(
                translateString(
                    "Confirm account deletion ?", "تأكيد حذف الحساب ؟"),
                textAlign: TextAlign.center,
                style: headingStyle2(
                  context: context,
                  color: colorBlack,
                ).copyWith(height: 1.5),
              ),
            ),
          ),
          const VerticalSpace(value: 1),
          Center(
            child: SizedBox(
              width: screenWidth(context) * 0.8,
              child: Text(
                translateString(
                    "The account will be permanently deleted and you will not be able to recover it again",
                    "سيتم حذف الحساب نهائيًا و لن تتمكن من أستعادته مره اخري"),
                textAlign: TextAlign.center,
                style: bodyStryle(
                  context: context,
                  color: colorGrey,
                ).copyWith(height: 1.5),
              ),
            ),
          ),
          const VerticalSpace(value: 4),
          CustomGeneralButton(
            text: translateString("to retreat", "تراجع"),
            onTap: () => MagicRouter.navigateAndPopAll(const LayoutScreen()),
          ),
          const VerticalSpace(value: 4),
          BlocConsumer<ChangePhoneCubit, ChangePhoneState>(
            bloc: GetIt.I<ChangePhoneCubit>(),
            listener: (context, state) {},
            builder: (context, state) {
              return (state is! DeleteAccountLoading)
                  ? CustomGeneralButton(
                      text: translateString("Confirm deletion", "تأكيد الحذف"),
                      textColor: kMainColor,
                      color: kMainColor.withOpacity(0.3),
                      onTap: () {
                        GetIt.I<ChangePhoneCubit>()
                            .deleteAccount(code: widget.code);
                      },
                    )
                  : loading();
            },
          ),
        ],
      ),
    );
  }
}
