import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../widget/code_body.dart';

class CodeWhiteScreen extends StatefulWidget {
  final VoidCallback ontap;
  final String? countryCode;
  final String? phone;

  const CodeWhiteScreen(
      {super.key, required this.ontap, this.countryCode, this.phone});

  @override
  State<CodeWhiteScreen> createState() => _CodeWhiteScreenState();
}

class _CodeWhiteScreenState extends State<CodeWhiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Enter Verification code", "أدخل رمز التحقق"),
          context: context),
      body: CodeWhiteBody(
        countryCode: widget.countryCode,
        phone: widget.phone,
        ontap: widget.ontap,
      ),
    );
  }
}
