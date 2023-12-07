import 'package:flutter/material.dart';
import 'package:haleema/core/constants/colors.dart';
import 'package:haleema/core/constants/constants.dart';

import 'widget/body.dart';

class EstablishmentScreen extends StatefulWidget {
  const EstablishmentScreen({super.key});

  @override
  State<EstablishmentScreen> createState() => _EstablishmentScreenState();
}

class _EstablishmentScreenState extends State<EstablishmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarNoTitle(),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Scaffold(
            appBar: customAppbar(title: "", context: context),
            body: const EstablishmentBody(),
          ),
          SizedBox(
            height: screenHeight(context) * 0.17,
            width: screenWidth(context) * 0.4,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: screenWidth(context) * 0.15,
                    backgroundColor: kMainColor,
                    backgroundImage: const NetworkImage(
                        "https://img.freepik.com/free-photo/young-muslim-woman-drinking-coffee_1303-27599.jpg?w=360&t=st=1690628276~exp=1690628876~hmac=ea472ca912066f53400468f44c23882e71f4a312d20467741fa22ad8eeffd5f5"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: screenWidth(context) * 0.05,
                      backgroundColor: kMainColor,
                      child: const Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
