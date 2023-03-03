import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/discover/components/body.dart';

import '../../components/navigation_drawer.dart';

class DiscoverPage extends StatelessWidget {
  static String routeName = "/home";

  const DiscoverPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      drawer: const NavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: const Body(),
    );
  }
}
