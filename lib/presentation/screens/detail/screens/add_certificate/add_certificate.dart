import 'package:flutter/material.dart';
import 'package:haleema/core/constants/constants.dart';

import 'widget/body.dart';

class AddCertificateScreen extends StatefulWidget {
  final bool edit;
  const AddCertificateScreen({super.key, required this.edit});

  @override
  State<AddCertificateScreen> createState() => _AddCertificateScreenState();
}

class _AddCertificateScreenState extends State<AddCertificateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: (widget.edit)
              ? translateString("Edit certificate", "تعديل الشهاده ")
              : translateString("Add new certificate", "أضافه شهاده جديده"),
          context: context),
      body: AddCertificateBody(
        edit: widget.edit,
      ),
    );
  }
}
