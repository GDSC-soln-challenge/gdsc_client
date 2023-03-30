import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/discover/components/body.dart';
import '../../components/navigation_drawer.dart';

class DiscoverPage extends StatefulWidget {
  static String routeName = "/discover";
  final token;
  const DiscoverPage({super.key, this.token});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late String userId;
  @override
  void initState() {
    super.initState();
    print("widget: ${widget}");
    print("widget.token: ${widget.token}");
    // Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    // userId = jwtDecodedToken['_id'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      drawer: NavigationDrawer(token: widget.token),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: const Body(),
    );
  }
}
