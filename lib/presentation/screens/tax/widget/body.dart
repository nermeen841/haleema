import 'package:flutter/material.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/core/widgets/space_widget.dart';
import '../../detail/widget/add_item.dart';

class TaxBody extends StatefulWidget {
  const TaxBody({super.key});

  @override
  State<TaxBody> createState() => _TaxBodyState();
}

class _TaxBodyState extends State<TaxBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.02,
        horizontal: screenWidth(context) * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddItem(
            ontap: () {},
            icon: "assets/icons/pending-clock-icon 1.svg",
            title: translateString("The picture has been sent for review",
                "تم ارسال الصوره للمراجعه"),
          ),
          const VerticalSpace(value: 2),
          Wrap(
            runSpacing: 30,
            spacing: 10,
            children: List.generate(
              1,
              (index) => SizedBox(
                width: screenWidth(context) * 0.45,
                height: screenHeight(context) * 0.25,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(screenWidth(context) * .05),
                  child: Image.asset(
                    "assets/icons/contract.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
