import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';

import '../../../../core/constants/colors.dart';

class ChatMyMessageItem extends StatefulWidget {
  final String message;
  const ChatMyMessageItem({super.key, required this.message});

  @override
  State<ChatMyMessageItem> createState() => _ChatMyMessageItemState();
}

class _ChatMyMessageItemState extends State<ChatMyMessageItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: SizedBox(
                width: screenWidth(context) * 0.6,
                child: Text(
                  widget.message,
                  style: bodyStryle(
                    context: context,
                    color: Colors.white,
                  ).copyWith(
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
