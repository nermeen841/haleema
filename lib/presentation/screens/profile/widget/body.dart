import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/app_icons.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/core/widgets/space_widget.dart';
import 'package:halema/presentation/screens/children/children.dart';
import 'package:halema/presentation/screens/children/cubit/children_cubit.dart';
import 'package:halema/presentation/screens/driver/cubit/driver_cubit.dart';
import 'package:halema/presentation/screens/driver/driver.dart';
import 'package:halema/presentation/screens/my_acconut/my_account.dart';
import 'package:halema/presentation/screens/profile/screens/delete_account/delete_account.dart';
import 'package:halema/presentation/screens/profile/screens/wallet/cubit/wallet_cubit.dart';
import 'package:halema/presentation/screens/profile/screens/wallet/wallet.dart';
import 'package:halema/presentation/screens/profile/widget/profile_item.dart';

import '../../auth/cubit/auth_cubit.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      width: double.infinity,
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
          children: [
            const VerticalSpace(value: 15),
            ProfileItem(
                title:
                    translateString("personal information", "البيانات الشخصيه"),
                icon: AppIcons.profileIcon,
                ontap: () {
                  GetIt.I<AuthCubit>().getProfileData();
                  MagicRouter.navigateTo(const MyAccountScreen());
                }),
            const VerticalSpace(value: 2),
            ProfileItem(
              title: translateString("Children", "الأطفال"),
              icon: AppIcons.boyGirlIcon,
              ontap: () {
                GetIt.I<ChildrenCubit>().getchildren();
                MagicRouter.navigateTo(const ChildrenScreen());
              },
            ),
            const VerticalSpace(value: 2),
            ProfileItem(
              title: translateString("Driver", "السائق"),
              icon: AppIcons.driverIcon,
              ontap: () {
                GetIt.I<DriverCubit>().getDrivers();
                MagicRouter.navigateTo(const DriverScreen());
              },
            ),
            const VerticalSpace(value: 2),
            ProfileItem(
              title: translateString("Wallet", "المحفظه"),
              icon: AppIcons.walletPinkIcon,
              ontap: () {
                GetIt.I<WalletCubit>().allTransaction();
                GetIt.I<WalletCubit>().latestTransaction();
                GetIt.I<WalletCubit>().totalAmount();
                MagicRouter.navigateTo(const WalletScreen());
              },
            ),
            const VerticalSpace(value: 2),
            ProfileItem(
              title: translateString("Delete Account", "حذف الحساب"),
              icon: AppIcons.profileDeleteIcon,
              ontap: () =>
                  MagicRouter.navigateTo(const DeleteAccountWarningScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
