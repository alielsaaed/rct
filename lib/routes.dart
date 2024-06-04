import 'package:flutter/cupertino.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/splash.dart';
import 'package:rct/view/auth/login_screen.dart';
import 'package:rct/view/auth/register_screen.dart';
import 'package:rct/view/calculations%20and%20projects/building_struct_screen.dart';
import 'package:rct/view/calculations%20and%20projects/confirmation_screen.dart';
import 'package:rct/view/calculations%20and%20projects/floor_details_screen.dart';
import 'package:rct/view/calculations%20and%20projects/measurment_of_field_screen.dart';
import 'package:rct/view/calculations%20and%20projects/total_cost_screen.dart';
import 'package:rct/view/designs%20and%20sketches/custom_designs_and_diagrams_screen.dart';
import 'package:rct/view/designs%20and%20sketches/designs_and_screen.dart';
import 'package:rct/view/designs%20and%20sketches/designs_screen.dart';
import 'package:rct/view/designs%20and%20sketches/sketches_details_screen.dart';
import 'package:rct/view/designs%20and%20sketches/sketches_screen.dart';
import 'package:rct/view/edit_profile_screen.dart';
import 'package:rct/view/home_screen.dart';
import 'package:rct/view/language_screen.dart';
import 'package:rct/view/notification%20screens/notifications_screen.dart';
import 'package:rct/view/notification%20screens/payment_recipt_screen.dart';
import 'package:rct/view/partners_screen.dart';
import 'package:rct/view/zeft.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.id: (context) => const HomeScreen(),
  RegisterScreen.id: (context) => RegisterScreen(),
  SplashScreen.id: (context) => const SplashScreen(),
  MeasurmentOfFieldScreen.id: (context) => const MeasurmentOfFieldScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  name.id: (context) => const name(),
  const PaymentReciptScreen().screenId: (context) =>
      const PaymentReciptScreen(),
  NotificationsScreen.screenId: (context) => const NotificationsScreen(),
  const EditProfileScreen().screenId: (context) => const EditProfileScreen(),
  AppRoutes.designsScreen: (context) => const DesignsScreen(),
  AppRoutes.diagramsScreen: (context) => const SketchesScreen(),
  AppRoutes.diagramsDetailsScreen: (context) => const DiagramsDetailsScreen(),
  AppRoutes.floorDetails: (context) => const FloorDetailsScreen(),
  AppRoutes.customDesignAndDiagramsScreen: (context) =>
      const CustomDesignAndDiagramsScreen(),
  AppRoutes.totalCostScreen: (context) => const TotalCostScreen(),
  AppRoutes.confirmationScreen: (context) => const ConfirmationScreen(),
  AppRoutes.designAndScreen: (context) => const DesignAndScreen(),
  AppRoutes.buildingStructScreen: (context) => const BuildingStructScreen(),
  AppRoutes.partnersScreen: (context) => const PartnersScreen(),
  AppRoutes.languageScreen: (context) => const LanguageScreen(),
};
