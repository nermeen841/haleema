import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/constants/text_theme.dart';
import 'package:haleema/core/router/router.dart';
import 'package:haleema/core/widgets/custom_text_field.dart';
import 'package:haleema/core/widgets/space_widget.dart';
import 'package:haleema/presentation/screens/contract/contract.dart';
import 'package:haleema/presentation/screens/detail/screens/rooms/room.dart';
import 'package:haleema/presentation/screens/my_acconut/widget/data_item.dart';
import 'package:haleema/presentation/screens/my_acconut/widget/edit_data_item.dart';
import 'package:haleema/presentation/screens/tax/tax.dart';

class EstablishmentBody extends StatefulWidget {
  const EstablishmentBody({super.key});

  @override
  State<EstablishmentBody> createState() => _EstablishmentBodyState();
}

class _EstablishmentBodyState extends State<EstablishmentBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context),
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.03,
        vertical: screenHeight(context) * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(value: 10),
          DataInfoItem(
            title: translateString("The area of ​​the place", "مساحه المكان"),
            data: "145م",
            icon: "assets/icons/place_size.svg",
            ontap: () => homeBottomSheet(
              context: context,
              child: EditDataItem(
                title:
                    translateString("The area of ​​the place", "مساحه المكان"),
                ontap: () {},
                icon: "assets/icons/place_size.svg",
                textField: CustomTextFormField(
                  fillColor: textFormFieldColor,
                  borderColor: Colors.transparent,
                  hint: "145م",
                ),
              ),
            ),
          ),
          const VerticalSpace(value: 4),
          DataInfoItem(
            title: translateString("rooms number", "عدد الغرف "),
            data: "4 غرف",
            icon: "assets/icons/home-hashtag.svg",
            ontap: () => homeBottomSheet(
              context: context,
              child: EditDataItem(
                title: translateString("rooms number", "عدد الغرف "),
                ontap: () {},
                icon: "assets/icons/home-hashtag.svg",
                textField: CustomTextFormField(
                  fillColor: textFormFieldColor,
                  borderColor: Colors.transparent,
                  hint: "4 غرف",
                ),
              ),
            ),
          ),
          const VerticalSpace(value: 4),
          InkWell(
            onTap: () => MagicRouter.navigateTo(const TaxScreen()),
            child: Container(
              width: double.infinity,
              height: screenHeight(context) * 0.08,
              decoration: BoxDecoration(
                color: textFormFieldColor,
                borderRadius: BorderRadius.circular(
                  screenWidth(context) * 0.03,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/tax.svg"),
                      const HorizontalSpace(value: 1),
                      Text(
                        translateString(
                            "A copy of the tax number", "صوره الرقم الضريبي"),
                        style: bodyStryle(
                          context: context,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/warning-2.svg"),
                      const HorizontalSpace(value: 0.7),
                      Icon(
                        Icons.arrow_forward,
                        color: colorBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const VerticalSpace(value: 2),
          InkWell(
            onTap: () => MagicRouter.navigateTo(const ContractScreen()),
            child: Container(
              width: double.infinity,
              height: screenHeight(context) * 0.08,
              decoration: BoxDecoration(
                color: textFormFieldColor,
                borderRadius: BorderRadius.circular(
                  screenWidth(context) * 0.03,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/contract.svg"),
                      const HorizontalSpace(value: 1),
                      Text(
                        translateString(
                            "A copy of the lease contract", "صوره عقد الايجار"),
                        style: bodyStryle(
                          context: context,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/warning-2.svg"),
                      const HorizontalSpace(value: 0.7),
                      Icon(
                        Icons.arrow_forward,
                        color: colorBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const VerticalSpace(value: 2),
          InkWell(
            onTap: () => MagicRouter.navigateTo(const RoomScreen()),
            child: Container(
              width: double.infinity,
              height: screenHeight(context) * 0.08,
              decoration: BoxDecoration(
                color: textFormFieldColor,
                borderRadius: BorderRadius.circular(
                  screenWidth(context) * 0.03,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/home-hashtag.svg"),
                      const HorizontalSpace(value: 1),
                      Text(
                        translateString("Rooms", "الغرف"),
                        style: bodyStryle(
                          context: context,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: colorBlack,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
