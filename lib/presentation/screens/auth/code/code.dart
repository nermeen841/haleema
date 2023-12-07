import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/auth/code/widget/body.dart';
import 'package:halema/presentation/screens/auth/login/widget/app_bar.dart';

class CodeScreen extends StatefulWidget {
  final String phone;
  const CodeScreen({super.key, required this.phone});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: loginAppbar(
        context: context,
        title: translateString("Check phone number", "التحقق من رقم الجوال"),
      ),
      body: CodeBody(
        phone: widget.phone,
      ),
    );
  }
}
