import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';
import 'package:halema/presentation/screens/see_all/widget/body.dart';

class SeeAllScreen extends StatefulWidget {
  final String title;
  final String searchtitle;
  final int type;
  const SeeAllScreen(
      {super.key,
      required this.title,
      required this.searchtitle,
      required this.type});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  @override
  void initState() {
    GetIt.I<SetterCubit>().filterOption(false);
    GetIt.I<SetterCubit>().isFilterring = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: widget.title, context: context),
      body: SeeAllBody(
        searchtitle: widget.searchtitle,
        type: widget.type,
      ),
    );
  }
}
