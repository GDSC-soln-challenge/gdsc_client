import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/login_success/components/body.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = "/login_success";
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
      ),
      body: const Body(),
    );
  }
}
