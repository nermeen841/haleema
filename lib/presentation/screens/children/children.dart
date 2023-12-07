import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';

import 'widget/body.dart';

class ChildrenScreen extends StatefulWidget {
  const ChildrenScreen({super.key});

  @override
  State<ChildrenScreen> createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends State<ChildrenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(
          title: translateString("Children", "الأطفال"), context: context),
      body: const ChildrenBody(),
    );
  }
}
