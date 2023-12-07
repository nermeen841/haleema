import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/text_theme.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';
import '../utiles/size_config.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color,
      this.borderColor,
      this.isActive,
      this.textColor,
      this.iconImage,
      this.withBorder,
      this.size,
      this.fontSize})
      : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final bool? isActive;
  final String? iconImage;
  final Color? textColor;
  final Color? borderColor;
  final bool? withBorder;
  final double? size;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: isActive != false ? onTap : null,
      child: Container(
        height: h * 0.07,
        width: w,
        decoration: BoxDecoration(
          color: color,
          gradient: (color != null)
              ? null
              : LinearGradient(
                  colors: [
                    kMainColor,
                    gradientColor,
                    gradientColor2,
                  ],
                ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              spreadRadius: 2,
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.1),
            )
          ],
          borderRadius: BorderRadius.circular(screenWidth(context) * 0.05),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (iconImage != null)
                  ? SvgPicture.asset(
                      iconImage!,
                      color: textColor ?? Colors.white,
                    )
                  : const SizedBox(),
              (iconImage != null)
                  ? SizedBox(
                      width: w * 0.03,
                    )
                  : const SizedBox(),
              Center(
                child: Text(
                  text,
                  style: headingStyle2(
                    color: textColor ?? Colors.white,
                    context: context,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomStrockButton extends StatelessWidget {
  const CustomStrockButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.08,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: kMainColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: kMainColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {Key? key,
      this.color,
      required this.textColor,
      required this.icon,
      required this.text,
      required this.borderColor,
      required this.onTap})
      : super(key: key);
  final Color? color;
  final String icon;
  final String text;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.08,
        width: w,
        padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.02),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                icon,
                color: color,
              ),
            ),
            SizedBox(
              width: w * 0.02,
            ),
            Text(
              text,
              // style: headingStyle.copyWith(color: textColor),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.size,
      this.color,
      this.isUnderLine})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final double? size;
  final Color? color;
  final bool? isUnderLine;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return isUnderLine == true
        ? TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: color,
                fontSize: size ?? SizeConfig.defaultSize! * 5.5,
              ),
            ),
          )
        : TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              // style: headingStyle.copyWith(
              //   color: color,
              //   fontWeight: FontWeight.bold,
              //   fontSize: size ?? SizeConfig.defaultSize! * 1.8,
              // ),
            ),
          );
  }
}
