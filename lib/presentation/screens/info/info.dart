import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/info/body.dart';

class InfoScreen extends StatefulWidget {
  final String title;
  final bool showSocial;
  const InfoScreen({super.key, required this.title, required this.showSocial});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: widget.title, context: context),
      body: InfoBody(
        showSocial: widget.showSocial,
      ),
    );
  }
}
