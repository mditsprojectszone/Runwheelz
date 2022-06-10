import 'package:flutter/material.dart';

import '../navigationDrawer.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profilePage';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Profile"),
        ),
        drawer:  const NavigationDrawer(),
        body: const Center(child: Text("This is profile page")));
  }
}