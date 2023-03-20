import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gdsc_client/constants.dart';
import 'package:gdsc_client/screens/home/home_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/splashScreen/logo_splash.dart';

class NavigationDrawer extends StatefulWidget {
  final token;
  const NavigationDrawer({super.key, this.token});

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String? userId;
  late String email;
  late String name;
  bool? loading = true;
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    print("jwtDecodedToken: ${jwtDecodedToken}");
    print("id: ${jwtDecodedToken['id']}");
    userId = jwtDecodedToken['id'].toString();
    getUserProfile();
  }

  void deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Navigator.pushNamed(context, LogoSplash.routeName);
  }

  // get user profile from backend using userId and set email
  void getUserProfile() async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/auth/profile/$userId"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    print("response.statusCode: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("response.body: ${response.body}");
      Map<String, dynamic> user = jsonDecode(response.body);
      print("user: $user");
      print("user['email']: ${user['data']['email']}");
      setState(() {
        email = user['data']['email'];
        name = user['data']['name'];
      });
      loading = false;
    } else {
      print("response.statusCode: ${response.statusCode}");
      print("response.body: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          builHeader(context),
          buildMenuItems(context),
        ],
      )),
    );
  }

  Widget builHeader(BuildContext context) {
    return Material(
      color: kPrimaryColor,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(children: [
            const CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png")),
            const SizedBox(height: 12),
            Text(
              loading == true ? "Loading..." : name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              loading == true ? "Loading..." : email,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen())),
          ),
          ListTile(
              leading: const Icon(Icons.post_add_outlined),
              title: const Text("Posts"),
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, HomeScreen.routeName),
                  }),
          ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Favorites"),
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, HomeScreen.routeName),
                  }),
          ListTile(
              leading: const Icon(Icons.update),
              title: const Text("Updates"),
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, HomeScreen.routeName),
                  }),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, HomeScreen.routeName),
                  }),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () => {
                    deleteToken(),
                  }),
        ],
      ),
    );
  }
}
