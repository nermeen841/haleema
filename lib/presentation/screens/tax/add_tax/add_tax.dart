import 'package:flutter/material.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/presentation/screens/tax/add_tax/body.dart';

class AddTaxScreen extends StatefulWidget {
  const AddTaxScreen({super.key});

  @override
  State<AddTaxScreen> createState() => _AddTaxScreenState();
}

class _AddTaxScreenState extends State<AddTaxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(
          title:
              translateString("A copy of the tax number", "صوره الرقم الضريبي"),
          context: context),
      body: const AddTaxBody(),
    );
  }
}
