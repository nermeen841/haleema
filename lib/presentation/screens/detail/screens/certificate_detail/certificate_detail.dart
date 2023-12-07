import 'package:flutter/material.dart';
import 'package:haleema/core/constants/constants.dart';

import 'body.dart';

class CertificateDetailScreen extends StatefulWidget {
  const CertificateDetailScreen({super.key});

  @override
  State<CertificateDetailScreen> createState() =>
      _CertificateDetailScreenState();
}

class _CertificateDetailScreenState extends State<CertificateDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: "أسم الشهاده", context: context),
      body: const CertificateDetailBody(),
    );
  }
}
