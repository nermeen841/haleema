import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';

class AuthCustomBody extends StatefulWidget {
  final Widget child;
  const AuthCustomBody({super.key, required this.child});

  @override
  State<AuthCustomBody> createState() => _AuthCustomBodyState();
}

class _AuthCustomBodyState extends State<AuthCustomBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight(context),
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.03,
          ),
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth(context) * 0.05),
              topRight: Radius.circular(screenWidth(context) * 0.05),
            ),
          ),
        ),
        Container(
          height: screenHeight(context),
          width: double.infinity,
          margin: EdgeInsets.only(
            top: screenHeight(context) * 0.02,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth(context) * 0.05),
              topRight: Radius.circular(screenWidth(context) * 0.05),
            ),
          ),
          child: widget.child,
        ),
      ],
    );
  }
}
