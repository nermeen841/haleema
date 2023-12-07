import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haleema/core/constants/app_icons.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/constants/text_theme.dart';
import 'package:haleema/core/helper/validation.dart';
import 'package:haleema/core/widgets/custom_buttons_widget.dart';
import 'package:haleema/core/widgets/custom_text_field.dart';
import 'package:haleema/core/widgets/space_widget.dart';

class AddRoomBody extends StatefulWidget {
  final bool edit;
  const AddRoomBody({super.key, required this.edit});

  @override
  State<AddRoomBody> createState() => _AddRoomBodyState();
}

class _AddRoomBodyState extends State<AddRoomBody> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            translateString("Room name", "أسم الغرفة"),
            style: headingStyle2(
              context: context,
              color: colorBlack,
            ),
          ),
          const VerticalSpace(value: 2),
          CustomTextFormField(
            controller: name,
            validator: (value) => validate(value!),
            hint: translateString("Room name", "أسم الغرفة"),
            fillColor: Colors.white,
            borderColor: textBorderColor,
          ),
          const VerticalSpace(value: 4),
          Text(
            translateString("Room image", "صوره الغرفة"),
            style: headingStyle2(
              context: context,
              color: colorBlack,
            ),
          ),
          const VerticalSpace(value: 1),
          Text(
            translateString(
                "Upload room photos, with a maximum of 5 photos per room",
                "قم بتحميل صور الغرفه بحد اقصي 5 صور للغرفه الواحده"),
            style: bodyStryle(
              context: context,
              color: colorLightGrey,
            ),
          ),
          const VerticalSpace(value: 3),
          (!widget.edit)
              ? InkWell(
                  onTap: () => uploadImage(context),
                  child: DottedBorder(
                    color: kMainColor,
                    strokeWidth: 1,
                    child: Container(
                      width: double.infinity,
                      height: screenHeight(context) * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          screenWidth(context) * 0.05,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppIcons.addImage,
                            ),
                            const VerticalSpace(value: 1),
                            Text(
                              translateString(
                                  "Add photo room", "أضف صوره الغرفة"),
                              style: bodyStryle(
                                context: context,
                                color: colorGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => uploadImage(context),
                        child: DottedBorder(
                          color: kMainColor,
                          strokeWidth: 1,
                          child: Container(
                            width: screenWidth(context) * 0.35,
                            height: screenHeight(context) * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                screenWidth(context) * 0.05,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppIcons.addImage,
                                  ),
                                  const VerticalSpace(value: 1),
                                  Text(
                                    translateString(
                                        "Add photo room", "أضف صوره الغرفة"),
                                    style: bodyStryle(
                                      context: context,
                                      color: colorGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const HorizontalSpace(value: 1),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SizedBox(
                              width: screenWidth(context) * 0.35,
                              height: screenHeight(context) * 0.2,
                              child: Stack(
                                alignment: AlignmentDirectional.topStart,
                                children: [
                                  SizedBox(
                                    width: screenWidth(context) * 0.35,
                                    height: screenHeight(context) * 0.2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth(context) * 0.03),
                                      child: Image.asset(
                                        AppIcons.roomImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        CupertinoIcons.clear_circled_solid,
                                        color: kMainColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          const VerticalSpace(value: 2),
          Text(
            translateString(". upload image with extension .png or .jpj",
                ". قم برفع الصوره بأمتداد Png or jpj"),
            style: bodyStryle(
              context: context,
              color: colorLightGrey,
            ),
          ),
          const VerticalSpace(value: 1),
          Text(
            translateString(
                "- maximum 5M for image", "- حد اقصي 5 ميجا للصوره"),
            style: bodyStryle(
              context: context,
              color: colorLightGrey,
            ),
          ),
          const VerticalSpace(value: 4),
          CustomGeneralButton(
            text: translateString("Save", "حفظ"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
