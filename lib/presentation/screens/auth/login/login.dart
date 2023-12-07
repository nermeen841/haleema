import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/utiles/cubit/app_cubit.dart';
import 'package:halema/core/utiles/map.dart';
import 'package:halema/presentation/screens/auth/login/widget/app_bar.dart';
import 'package:halema/presentation/screens/auth/login/widget/body.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    GetIt.I<AppCubit>().toggle = false;
    GetIt.I<AppCubit>().toggleRegister = false;
    Provider.of<MapProvider>(context, listen: false).start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      bloc: GetIt.I<AppCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kMainColor,
          appBar: (!GetIt.I<AppCubit>().toggle &&
                  !GetIt.I<AppCubit>().toggleRegister)
              ? loginAppbar(
                  title: "",
                  fromLogin: true,
                  context: context,
                )
              : (GetIt.I<AppCubit>().toggleRegister)
                  ? loginAppbar(
                      context: context,
                      title: translateString(
                          "Create new account", "انشاء حساب جديد"),
                    )
                  : loginAppbar(
                      context: context,
                      title: translateString(
                          "Check phone number", "التحقق من رقم الجوال"),
                    ),
          body: const LoginBody(),
        );
      },
    );
  }
}
