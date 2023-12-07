import 'package:flutter/material.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/router/router.dart';
import 'package:haleema/presentation/screens/contract/add_contract/add_contract.dart';
import 'package:haleema/presentation/widget/empty_certificate.dart';

import 'widget/body.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(
          title: translateString(
              "A copy of the lease contract", "صوره عقد الايجار"),
          context: context),
      body: (show)
          ? const ContractBody()
          : InkWell(
              onTap: () => setState(() {
                show = true;
              }),
              child: EmptyCertificateItem(
                title: translateString("There is no picture of your lease",
                    "لا يوجد صوره لعقد الايجار الخاص بك"),
                buttonTitle: translateString("Add a copy of the lease contract",
                    "أضف صوره عقد الايجار "),
                ontap: () => MagicRouter.navigateTo(const AddContractScreen()),
              ),
            ),
    );
  }
}
