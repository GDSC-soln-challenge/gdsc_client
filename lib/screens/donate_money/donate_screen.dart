import 'package:flutter/material.dart';

import 'components/body.dart';

class DonateMoneyScreen extends StatelessWidget {
  const DonateMoneyScreen({super.key});
  static String routeName = "/donate_money";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donate Money"),
      ),
      body: const Body(),
    );
  }
}
