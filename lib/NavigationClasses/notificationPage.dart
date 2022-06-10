import 'package:flutter/material.dart';

import '../navigationDrawer.dart';

class NotificationPage extends StatelessWidget {
  static const String routeName = '/notificationPage';

  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        drawer:  const NavigationDrawer(),
        body: const Center(child: Text("This is notification page")));
  }
}