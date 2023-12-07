import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/profile/screens/wallet/widget/body.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: customAppbar(
        title: translateString("Wallet", "المحفظة"),
        context: context,
      ),
      body: const WalletBody(),
    );
  }
}
