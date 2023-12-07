import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/auth/login/widget/app_bar.dart';
import 'package:halema/presentation/screens/auth/register/widget/body.dart';
import '../../../../core/constants/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: loginAppbar(
        context: context,
        title: translateString("Create new account", "انشاء حساب جديد"),
      ),
      body: const RegisterBody(),
    );
  }
}
