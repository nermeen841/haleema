import 'package:flutter/material.dart';
import 'package:halema/presentation/screens/notifications/widget/body.dart';
import 'package:halema/core/constants/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Notifications", "الإشعارات"),
          context: context),
      body: const NotificationBody(),
    );
  }
}
