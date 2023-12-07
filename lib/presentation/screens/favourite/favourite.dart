import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/presentation/screens/favourite/widget/body.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: translateString("Favourite", "المفضلة"), context: context),
      body: const FavouriteBody(),
    );
  }
}
