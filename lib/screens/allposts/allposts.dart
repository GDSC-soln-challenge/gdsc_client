import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/allposts/components/body.dart';

class AllPosts extends StatelessWidget {
  static String routeName = "/posts";
  const AllPosts({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Posts'),
      ),
      body: Body(),
    );
  }
}
