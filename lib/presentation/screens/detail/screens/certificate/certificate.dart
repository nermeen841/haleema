import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/detail/screens/certificate/body.dart';
import 'package:halema/presentation/screens/home/model/get_setter_detail_model.dart';

class CertificateScreen extends StatefulWidget {
  final List<Certificates> certificates;
  const CertificateScreen({super.key, required this.certificates});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: "", context: context),
      body: CertificateBody(
        certificates: widget.certificates,
      ),
    );
  }
}
