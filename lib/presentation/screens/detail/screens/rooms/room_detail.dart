import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/detail/screens/rooms/room_detail_body.dart';
import 'package:halema/presentation/screens/home/model/get_setter_detail_model.dart';

class RommDetailScreen extends StatefulWidget {
  final Rooms rooms;
  const RommDetailScreen({super.key, required this.rooms});

  @override
  State<RommDetailScreen> createState() => _RommDetailScreenState();
}

class _RommDetailScreenState extends State<RommDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: "", context: context),
      body: RoomDetailBody(
        rooms: widget.rooms,
      ),
    );
  }
}
