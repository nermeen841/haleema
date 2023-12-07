import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/widgets/custom_text_field.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';

class SearchButton extends StatelessWidget {
  final String title;
  final bool? fromHome;
  final ValueSetter? onChanged;

  const SearchButton({
    super.key,
    required this.title,
    this.fromHome,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth(context) * 0.06),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: BlocConsumer<SetterCubit, SetterState>(
        listener: (context, state) {},
        bloc: GetIt.I<SetterCubit>(),
        builder: (context, state) {
          return CustomTextFormField(
            hint: title,
            fillColor: Colors.white,
            borderRaduis: screenWidth(context) * 0.06,
            onChanged: onChanged,
            prefix: SvgPicture.asset(
              AppIcons.searchNormalIcon,
              width: 10,
              height: 10,
              fit: BoxFit.scaleDown,
            ),
          );
        },
      ),
    );
  }
}
