import 'package:flutter/material.dart';
import 'package:haleema/core/constants/constants.dart';
import 'package:haleema/presentation/screens/detail/screens/rooms/add_new_room_body.dart';

class AddRoomScreen extends StatefulWidget {
  final bool edit;
  const AddRoomScreen({super.key, required this.edit});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: (widget.edit)
              ? translateString("Edit Room", "تعديل الغرفة ")
              : translateString("Add new Room", "أضافه غرفة جديده"),
          context: context),
      body: AddRoomBody(edit: widget.edit),
    );
  }
}
