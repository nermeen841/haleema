import 'package:flutter/material.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/text_theme.dart';

class RecieverMessage extends StatefulWidget {
  final String message;
  const RecieverMessage({super.key, required this.message});

  @override
  State<RecieverMessage> createState() => _RecieverMessageState();
}

class _RecieverMessageState extends State<RecieverMessage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: CircleAvatar(
            //     radius: 20,
            //     backgroundImage: NetworkImage(
            //         "https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?t=st=1654505109~exp=1654505709~hmac=a87686d930876cc7878ffd85d01efc7cc455a937939096ef763ffd612deb3e84&w=360"),
            //   ),
            // ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Text(
                widget.message,
                style: bodyStryle2(context: context, color: colorBlack),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
