import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';

import 'widget/body.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(
          title: translateString("Driver", "السائق"), context: context),
      body: const DriverBody(),
    );
  }
}
