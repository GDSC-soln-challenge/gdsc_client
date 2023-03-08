import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/sign_in/sign_in_screen.dart';
import 'package:gdsc_client/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoSplash extends StatefulWidget {
  const LogoSplash({super.key});
  static String routeName = "/logoSplash";
  @override
  State<StatefulWidget> createState() {
    return _LogoSplash();
  }
}

class _LogoSplash extends State<LogoSplash> {
  int splashtime = 3;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    Navigator.pop(context);
    if (_seen) {
      Navigator.pushNamed(context, SignInScreen.routeName);
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushNamed(context, SplashScreen.routeName);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //vertically align center
                children: <Widget>[
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/images/success.jpg")),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    //margin top 30
                    child: const Text(
                      "NAME OF APP",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text("Version: 1.0.0",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                        )),
                  ),
                ])));
  }
}
