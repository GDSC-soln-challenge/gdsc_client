import 'package:flutter/material.dart';
import 'package:gdsc_client/routes.dart';
import 'package:gdsc_client/screens/splashScreen/logo_splash.dart';
import 'package:gdsc_client/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: LogoSplash.routeName,
      routes: routes,
    );
  }
}
