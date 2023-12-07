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
import 'package:halema/presentation/screens/support/cubit/support_cubit.dart';
import 'package:halema/presentation/screens/support/widget/body.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget(
      {super.key,
      required this.options,
      required this.message,
      required this.problem});
  final List<String> options;

  final TextEditingController message;
  final TextEditingController problem;
  @override
  State<SupportWidget> createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth(context) * 0.02,
          horizontal: screenWidth(context) * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              translateString("Reason", "سبب المشكله"),
              style: headingStyle1(context: context, color: colorBlack),
            ),
            const VerticalSpace(value: 1),
            CustomDropDown(
              fillColor: Colors.white,
              borderColor: textBorderColor,
              text: "",
              items: widget.options,
            ),
            const VerticalSpace(value: 2),
            OrderSetterSelection(
              fillColor: Colors.white,
              borderColor: textBorderColor,
              text: translateString("Select babysitter", "اختر المربية"),
            ),
            const VerticalSpace(value: 4),
            Text(
              translateString("problem", "المشكله"),
              style: headingStyle1(context: context, color: colorBlack),
            ),
            const VerticalSpace(value: 1),
            CustomTextFormField(
              controller: widget.problem,
              fillColor: Colors.white,
              borderColor: textFormFieldColor,
              maxLines: 1,
              hint: "",
              validator: (value) => validate(value!),
            ),
            const VerticalSpace(value: 2),
            Text(
              translateString("Description", "وصف المشكله"),
              style: headingStyle1(context: context, color: colorBlack),
            ),
            const VerticalSpace(value: 1),
            CustomTextFormField(
              controller: widget.message,
              fillColor: Colors.white,
              borderColor: textFormFieldColor,
              maxLines: 7,
              hint: translateString(
                  "Add your description here", "أضف وصف مشكلتك هنا"),
              validator: (value) => validate(value!),
            ),
            const VerticalSpace(value: 4),
            BlocConsumer<SupportCubit, SupportState>(
              listener: (context, state) {
                if (state is MakeTicketErrorState ||
                    state is MakeTicketSuccessState) {
                  showSupport = false;
                }
              },
              bloc: GetIt.I<SupportCubit>(),
              builder: (context, state) {
                return (state is! MakeTicketLoadingState)
                    ? CustomGeneralButton(
                        text: LocaleKeys.SEND.tr(),
                        onTap: () => GetIt.I<SupportCubit>().makeTicket(
                          problem: widget.problem.text,
                          description: widget.message.text,
                          setterId: OrderSetterSelection.selectedSetter,
                        ),
                      )
                    : loading();
              },
            ),
            const VerticalSpace(value: 4),
          ],
        ),
      ),
    );
  }
}
