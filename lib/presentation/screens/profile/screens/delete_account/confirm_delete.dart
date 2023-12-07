import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/profile/screens/delete_account/widget/confirm_body.dart';

class ConfirmDelteScreen extends StatefulWidget {
  const ConfirmDelteScreen({super.key, required this.code});
  final String code;

  @override
  State<ConfirmDelteScreen> createState() => _ConfirmDelteScreenState();
}

class _ConfirmDelteScreenState extends State<ConfirmDelteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Delete account", "حذف الحساب"),
          context: context),
      body: ConfirmDeleteBody(code: widget.code),
    );
  }
}
