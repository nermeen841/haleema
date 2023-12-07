import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/home/model/get_setter_detail_model.dart';
import 'body.dart';

class RoomScreen extends StatefulWidget {
  final List<Rooms> rooms;
  const RoomScreen({super.key, required this.rooms});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: "", context: context),
      body: RoomBody(
        rooms: widget.rooms,
      ),
    );
  }
}
