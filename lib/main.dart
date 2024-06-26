import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:rct/common%20copounents/locale_provider.dart';
import 'package:rct/model/auth/login_model.dart';
import 'package:rct/model/auth/register_model.dart';
import 'package:rct/model/build_types_model.dart';
import 'package:rct/model/order_model.dart';
import 'package:rct/routes.dart';
import 'package:rct/splash.dart';
import 'package:rct/theme.dart';
import 'package:rct/view-model/cubits/build_types_and_floors/build_types_and_floors_cubit.dart';
import 'package:rct/view-model/cubits/designs/designs_cubit.dart';
import 'package:rct/view-model/cubits/login/login_cubit.dart';
import 'package:rct/view-model/cubits/notifications/notifications_cubit.dart';
import 'package:rct/view-model/cubits/order%20number/order_number_cubit.dart';
import 'package:rct/view-model/cubits/order/order_cubit.dart';
import 'package:rct/view-model/cubits/preferable/preferable_cubit.dart';
import 'package:rct/view-model/cubits/register/register_cubit.dart';
import 'package:rct/view-model/cubits/sketches/sketches_cubit.dart';
import 'package:rct/view-model/cubits/types/types_cubit.dart';

late FlutterSecureStorage secureStorage;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  secureStorage = const FlutterSecureStorage();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(
          create: (_) => LoginModel(),
        ),
        ChangeNotifierProvider<RegisterModel>(
          create: (_) => RegisterModel(),
        ),
        ChangeNotifierProvider<OrderModel>(
          create: (_) => OrderModel(),
        ),
        ChangeNotifierProvider<BuildTypesModel>(
          create: (_) => BuildTypesModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        )
      ],
      child: const ScreenUtilInit(
        designSize: Size(393, 852),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => SketchesCubit(),
        ),
        BlocProvider(
          create: (context) => DesignsCubit(),
        ),
        BlocProvider(
          create: (context) => TypesCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationsCubit(),
        ),
        BlocProvider(
          create: (context) => OrderNumberCubit(),
        ),
        BlocProvider(
          create: (context) => BuildTypesAndFloorsCubit(),
        ),
        BlocProvider(
          create: (context) => OrderCubit(),
        ),
        BlocProvider(
          create: (context) => PreferableCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'RCT App',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: provider.locale,
        // home: const BuildingStructScreen(),
        routes: routes,
      ),
    );
  }
}
