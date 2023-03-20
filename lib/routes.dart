import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/complete_profile/complete_profile_screen.dart';
import 'package:gdsc_client/screens/discover/discover_screen.dart';
import 'package:gdsc_client/screens/donate_money/donate_screen.dart';
import 'package:gdsc_client/screens/forgot_password/forgot_password_screen.dart';
import 'package:gdsc_client/screens/home/home_screen.dart';
import 'package:gdsc_client/screens/login_success/login_success_screen.dart';
import 'package:gdsc_client/screens/sign_in/sign_in_screen.dart';
import 'package:gdsc_client/screens/sign_up/sign_up_screen.dart';
import 'package:gdsc_client/screens/splash/splash_screen.dart';
import 'package:gdsc_client/screens/splashScreen/logo_splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccess.routeName: (context) => const LoginSuccess(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => const OtpScreen(),
  LogoSplash.routeName: (context) => const LogoSplash(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DonateMoneyScreen.routeName: (context) => const DonateMoneyScreen(),
  DiscoverPage.routeName: (context) => const DiscoverPage(),
};
