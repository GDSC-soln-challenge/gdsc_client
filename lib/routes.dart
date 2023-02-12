import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/splash/sign_in/sign_in_screen.dart';
import 'package:gdsc_client/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
};
