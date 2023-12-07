import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

import '../../core/constants/custom_paint.dart';

class UploadImageWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback ontap;
  final File? selectedImage;
  const UploadImageWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.ontap,
      this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: CustomPaint(
        painter: DotedBorder(numberOfStories: 40, spaceLength: 4),
        child: (selectedImage != null)
            ? CircleAvatar(
                radius: screenWidth(context) * 0.18,
                backgroundColor: textFormFieldColor,
                backgroundImage: FileImage(selectedImage!),
              )
            : CircleAvatar(
                radius: screenWidth(context) * 0.18,
                backgroundColor: textFormFieldColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      image,
                      color: kMainColor,
                    ),
                    const VerticalSpace(value: 1),
                    Text(
                      title,
                      style: bodyStryle2(
                        color: colorGrey,
                        context: context,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
