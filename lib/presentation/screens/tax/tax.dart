import 'package:flutter/material.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/router/router.dart';
import 'package:haleema/presentation/widget/empty_certificate.dart';

import 'add_tax/add_tax.dart';
import 'widget/body.dart';

class TaxScreen extends StatefulWidget {
  const TaxScreen({super.key});

  @override
  State<TaxScreen> createState() => _TaxScreenState();
}

class _TaxScreenState extends State<TaxScreen> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(
          title:
              translateString("A copy of the tax number", "صوره الرقم الضريبي"),
          context: context),
      body: (show)
          ? const TaxBody()
          : InkWell(
              onTap: () => setState(() {
                show = true;
              }),
              child: EmptyCertificateItem(
                title: translateString("There are no photos of your tax number",
                    "لا يوجد صور للرقم الضريبي الخاص بك"),
                buttonTitle: translateString("Add a copy of the lease contract",
                    "أضف صوره عقد الايجار "),
                ontap: () => MagicRouter.navigateTo(const AddTaxScreen()),
              ),
            ),
    );
  }
}
