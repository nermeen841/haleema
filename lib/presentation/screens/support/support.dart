import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/support/widget/body.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Support and assistance", "الدعم و المساعده"),
          context: context),
      body: const SupportBody(),
    );
  }
}
