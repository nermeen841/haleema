import 'package:get_it/get_it.dart';
import 'package:halema/core/utiles/cubit/app_cubit.dart';
import 'package:halema/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:halema/presentation/screens/children/cubit/children_cubit.dart';
import 'package:halema/presentation/screens/driver/cubit/driver_cubit.dart';
import 'package:halema/presentation/screens/messages/cubit/message_cubit.dart';
import 'package:halema/presentation/screens/notifications/cubit/notification_cubit.dart';
import 'package:halema/presentation/screens/order/cubit/orders_cubit.dart';
import 'package:halema/presentation/screens/profile/screens/wallet/cubit/wallet_cubit.dart';
import 'package:halema/presentation/screens/support/cubit/support_cubit.dart';

import '../../presentation/screens/chnage_phone/cubit/change_phone_cubit.dart';
import '../../presentation/screens/favourite/cubit/favourite_cubit.dart';
import '../../presentation/screens/home/cubit/setter_cubit.dart';

Future<void> init() async {
  GetIt.instance.registerLazySingleton<AppCubit>(() => AppCubit());
  GetIt.instance.registerLazySingleton<AuthCubit>(() => AuthCubit());
  GetIt.instance.registerLazySingleton<SupportCubit>(() => SupportCubit());
  GetIt.instance
      .registerLazySingleton<ChangePhoneCubit>(() => ChangePhoneCubit());

  GetIt.instance.registerSingleton<SetterCubit>(SetterCubit());
  GetIt.instance.registerSingleton<ChildrenCubit>(ChildrenCubit());
  GetIt.instance.registerSingleton<DriverCubit>(DriverCubit());
  GetIt.instance.registerSingleton<OrdersCubit>(OrdersCubit());
  GetIt.instance.registerSingleton<FavouriteCubit>(FavouriteCubit());
  GetIt.instance.registerSingleton<MessageCubit>(MessageCubit());
  GetIt.instance.registerSingleton<NotificationCubit>(NotificationCubit());
  GetIt.instance.registerSingleton<WalletCubit>(WalletCubit());
}
