import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/core/widgets/space_widget.dart';

import '../../../home/model/get_setter_detail_model.dart';

class CertificateBody extends StatefulWidget {
  final List<Certificates> certificates;
  const CertificateBody({super.key, required this.certificates});

  @override
  State<CertificateBody> createState() => _CertificateBodyState();
}

class _CertificateBodyState extends State<CertificateBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            screenWidth(context) * 0.08,
          ),
          topRight: Radius.circular(
            screenWidth(context) * 0.08,
          ),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight(context) * 0.02,
          horizontal: screenWidth(context) * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                translateString("Certificate", "الشهادات"),
                textAlign: TextAlign.center,
                style: headingStyle2(context: context, color: colorBlack),
              ),
            ),
            const VerticalSpace(value: 2),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: List.generate(
                widget.certificates.length,
                (index) => InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth(context) * .05),
                        ),
                        content: SizedBox(
                          width: double.infinity,
                          height: screenHeight(context) * 0.4,
                          child: customCachedNetworkImage(
                            url: widget.certificates[index].imageUrl!,
                            context: context,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: screenWidth(context) * 0.45,
                    height: screenHeight(context) * 0.25,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(screenWidth(context) * .05),
                      child: customCachedNetworkImage(
                        context: context,
                        url: widget.certificates[index].imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
