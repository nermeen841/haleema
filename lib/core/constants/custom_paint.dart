import 'dart:math';

import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';

class DotedBorder extends CustomPainter {
  final int numberOfStories;
  final int spaceLength;
  double startOfArcInDegree = 0;

  DotedBorder({required this.numberOfStories, this.spaceLength = 10});
  double inRads(double degree) {
    return (degree * pi) / 180;
  }

  @override
  bool shouldRepaint(DotedBorder oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double arcLength =
        (360 - (numberOfStories * spaceLength)) / numberOfStories;

    if (arcLength <= 0) {
      arcLength = 360 / spaceLength - 1;
    }

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    for (int i = 0; i < numberOfStories; i++) {
      canvas.drawArc(
          rect,
          inRads(startOfArcInDegree),
          inRads(arcLength),
          false,
          Paint()
            ..color = kMainColor
            // i == 0 || i == 1 ? Colors.grey : Colors.teal
            ..strokeWidth = 3.0
            ..style = PaintingStyle.stroke);

      startOfArcInDegree += arcLength + spaceLength;
    }
  }
}
