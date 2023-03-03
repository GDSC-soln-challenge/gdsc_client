import 'package:flutter/material.dart';
import 'package:gdsc_client/constants.dart';
import 'package:gdsc_client/screens/home/home_screen.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

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
          child: Column(children: const [
            CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png")),
            SizedBox(height: 12),
            Text(
              "User Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "abc@gmail.com",
              style: TextStyle(
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
                    Navigator.pop(context),
                    Navigator.pushNamed(context, HomeScreen.routeName),
                  }),
        ],
      ),
    );
  }
}
