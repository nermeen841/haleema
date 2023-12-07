// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/colors.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/utiles/map.dart';
import 'package:halema/presentation/screens/home/home.dart';
import 'package:halema/presentation/screens/layout/widget/bottom_items.dart';
import 'package:halema/presentation/screens/layout/widget/drawer.dart';
import 'package:halema/presentation/screens/order/order.dart';
import 'package:provider/provider.dart';

import '../auth/cubit/auth_cubit.dart';
import '../messages/messages.dart';
import '../profile/profile.dart';

class LayoutScreen extends StatefulWidget {
  final int? index;
  const LayoutScreen({super.key, this.index});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = const [
    HomeScreen(),
    OrderScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;

  @override
  void initState() {
    Provider.of<MapProvider>(context, listen: false).start();
    setState(() {
      currentIndex = widget.index ?? 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbarNoTitle(),
      backgroundColor: backgroundColor,
      drawer: const DrawerItems(),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: screenHeight(context) * 0.1,
        // margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            screenWidth(context) * 0.05,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              screenWidth(context) * 0.05,
            ),
            topRight: Radius.circular(
              screenWidth(context) * 0.05,
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: colorGrey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.white,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });

              if (value == 3) {
                GetIt.I<AuthCubit>().getProfileData();
              }
            },
            items: items(context: context, index: currentIndex),
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
