import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';

class OnBoardingContent extends StatefulWidget {
  final String text, image, title;

  const OnBoardingContent(
      {Key? key, required this.text, required this.image, required this.title})
      : super(key: key);

  @override
  State<OnBoardingContent> createState() => _OnBoardingContentState();
}

class _OnBoardingContentState extends State<OnBoardingContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(screenWidth(context) * 0.03),
          height: screenHeight(context) * 0.5,
          width: screenWidth(context) * 2,
          child: SvgPicture.asset(widget.image, fit: BoxFit.fitHeight),
        ),
        SizedBox(
          height: screenHeight(context) * 0.02,
        ),
        SizedBox(
          width: screenWidth(context) * 0.85,
          child: Text(
            widget.title,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: headingStyle1(
              color: colorBlack,
              context: context,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight(context) * 0.02,
        ),
        SizedBox(
          width: screenWidth(context) * 0.85,
          child: Text(
            widget.text,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: bodyStryle2(color: colorGrey, context: context)
                .copyWith(height: 1.5),
          ),
        ),
      ],
    );
  }
}
