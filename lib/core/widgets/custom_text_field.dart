// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halema/core/constants/text_theme.dart';
import '../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.isPassword,
    this.borderColor,
    this.borderRaduis,
    this.inputFormatters,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.onEditingComplete,
    this.maxLines,
    this.label,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.hint,
    this.validator,
    this.isLTR,
    this.readOnly,
    this.fillColor,
    this.ontap,
  }) : super(key: key);
  final TextEditingController? controller;

  final TextInputType? inputType;
  final double? borderRaduis;
  final ValueSetter? onChanged;
  final Color? fillColor;
  final Color? borderColor;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? label;
  final String? hint;
  final bool? isPassword;
  final bool? readOnly;
  final VoidCallback? ontap;
  final Widget? suffix;
  final Widget? prefix;
  final bool? isLTR;
  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final Function? suffixPressed;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      readOnly: readOnly ?? false,
      onTap: ontap,
      inputFormatters: inputFormatters ?? [],
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        // labelStyle: headingStyle.copyWith(color: kMainColor),
        hintText: hint,
        hintStyle: bodyStryle(color: colorLightGrey, context: context),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 10),
          borderSide: BorderSide(color: kMainColor),
        ),
        suffixIcon: suffix ?? null,
        prefixIcon: prefix,
        filled: true,
        fillColor: fillColor ?? textFormFieldColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 10),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 10),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),
    );
  }
}
