import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/text_theme.dart';

import '../../../../core/constants/constants.dart';

class ChatReciverMessageItem extends StatefulWidget {
  final String message;
  const ChatReciverMessageItem({super.key, required this.message});

  @override
  State<ChatReciverMessageItem> createState() => _ChatReciverMessageItemState();
}

class _ChatReciverMessageItemState extends State<ChatReciverMessageItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
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
                    color: colorBlack,
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
