import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gdsc_client/routes.dart';
import 'package:gdsc_client/screens/discover/discover_screen.dart';
import 'package:gdsc_client/screens/splashScreen/logo_splash.dart';
import 'package:gdsc_client/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey =
  //     'pk_test_51MYWo1SACSY9YeDveGdEKoub9aRH4EssPG4V0736QOjuz7obISFmv5mFh2t7wibtuwDmsf1uF5RV4Z8qVSyHVRrA00sQs604Xh';
  // await Stripe.instance.applySettings();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("prefs.getString: ${prefs.getString('token')}");
  runApp(MyApp(token: prefs.getString('token')));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({super.key, required this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // initialRoute: LogoSplash.routeName,
      // initialRoute:
      //     token == null ? LogoSplash.routeName : DiscoverPage.routeName,
      home: token == null ? const LogoSplash() : DiscoverPage(token: token),
      routes: routes,
    );
  }
}
