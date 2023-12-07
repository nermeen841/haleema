import 'package:flutter/material.dart';
import 'package:halema/presentation/widget/babysitter_card.dart';

class NurseryList extends StatelessWidget {
  const NurseryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          5,
          (index) => const BabbySitterCard(
            name: "الرياض",
            rate: 4,
            image:
                "https://t3.ftcdn.net/jpg/03/16/29/28/360_F_316292896_pAtIWdyJODyS3RCIQry7t2aHt79KgBlM.jpg",
            adderss: '',
            numOfSesstion: '',
            priceHour: '',
          ),
        ),
      ),
    );
  }
}
