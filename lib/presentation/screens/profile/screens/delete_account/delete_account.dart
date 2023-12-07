import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';

import 'widget/body.dart';

class DeleteAccountWarningScreen extends StatefulWidget {
  const DeleteAccountWarningScreen({super.key});

  @override
  State<DeleteAccountWarningScreen> createState() =>
      _DeleteAccountWarningScreenState();
}

class _DeleteAccountWarningScreenState
    extends State<DeleteAccountWarningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Delete account", "حذف الحساب"),
          context: context),
      body: const DeleteAccountWarningBody(),
    );
  }
}
