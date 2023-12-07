import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../widget/body.dart';

class ChangePhoneScreen extends StatefulWidget {
  final String title;
  final VoidCallback ontap;
  const ChangePhoneScreen(
      {super.key, required this.title, required this.ontap});

  @override
  State<ChangePhoneScreen> createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Change phone number", "تغيير رقم الجوال"),
          context: context),
      body: ChangePhoneBody(
        ontap: widget.ontap,
        title: widget.title,
      ),
    );
  }
}
