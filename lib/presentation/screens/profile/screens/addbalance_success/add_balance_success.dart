import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';

import 'widget/body.dart';

class AddBalanceSuccessScreen extends StatefulWidget {
  const AddBalanceSuccessScreen({super.key});

  @override
  State<AddBalanceSuccessScreen> createState() =>
      _AddBalanceSuccessScreenState();
}

class _AddBalanceSuccessScreenState extends State<AddBalanceSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNoTitle(),
      body: const AddBalanceSuccessBody(),
    );
  }
}
