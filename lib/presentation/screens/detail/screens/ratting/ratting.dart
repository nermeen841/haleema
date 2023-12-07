import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/detail/screens/ratting/widget/body.dart';
import 'package:halema/presentation/screens/home/cubit/setter_cubit.dart';

class RattingScreen extends StatefulWidget {
  const RattingScreen({super.key});

  @override
  State<RattingScreen> createState() => _RattingScreenState();
}

class _RattingScreenState extends State<RattingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: "", context: context),
      body: BlocConsumer<SetterCubit, SetterState>(
        listener: (context, state) {},
        bloc: GetIt.I<SetterCubit>(),
        builder: (context, state) {
          return (GetIt.I<SetterCubit>().getReviewModel != null)
              ? const RattingBody()
              : loading();
        },
      ),
    );
  }
}
