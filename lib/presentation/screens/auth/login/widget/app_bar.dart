import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';

PreferredSize loginAppbar(
    {required context, required String title, bool? fromLogin}) {
  return PreferredSize(
    preferredSize: Size(
      double.infinity,
      (fromLogin == true)
          ? screenHeight(context) * 0.25
          : screenHeight(context) * 0.15,
    ),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kMainColor,
            gradientColor,
            gradientColor2,
          ],
        ),
      ),
      child: (fromLogin == true)
          ? Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/icons/Ellipse 511.png",
                    width: screenWidth(context) * 0.7,
                    height: screenHeight(context) * 0.5,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Image.asset(
                    AppIcons.logo,
                    width: screenWidth(context) * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : Padding(
              padding: EdgeInsets.only(
                top: screenHeight(context) * 0.065,
                left: screenWidth(context) * 0.03,
                right: screenWidth(context) * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      MagicRouter.pop();
                      // GetIt.I<AppCubit>().changetoggleRegister();
                      // GetIt.I<AppCubit>().changetoggle();
                      // GetIt.I<AppCubit>().toggle = false;
                      // GetIt.I<AppCubit>().toggleRegister = false;
                    },
                    child: SvgPicture.asset(AppIcons.arrowBack),
                  ),
                  const VerticalSpace(value: 2),
                  Text(
                    title,
                    style: headingStyle2(color: Colors.white, context: context),
                  ),
                ],
              ),
            ),
    ),
  );
}
