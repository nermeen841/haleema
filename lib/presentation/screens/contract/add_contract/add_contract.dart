import 'package:flutter/material.dart';
import 'package:haleema/core/constants/constants.dart';

import 'widget/body.dart';

class AddContractScreen extends StatefulWidget {
  const AddContractScreen({super.key});

  @override
  State<AddContractScreen> createState() => _AddContractScreenState();
}

class _AddContractScreenState extends State<AddContractScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(
          title: translateString(
              "A copy of the lease contract", "صوره عقد الايجار"),
          context: context),
      body: const AddContractBody(),
    );
  }
}
