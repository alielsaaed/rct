import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rct/view-model/functions/check_token.dart';
import 'package:rct/view/auth/login_screen.dart';
import 'dart:async';

import 'package:rct/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () async {
      bool token = await Checktoken().hasToken();
      if (kDebugMode) {
        print("Token: $token");
      }
      token
          ? Navigator.pushReplacementNamed(context, HomeScreen.id)
          : Navigator.pushReplacementNamed(context, LoginScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.png', // Replace with your image path
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
