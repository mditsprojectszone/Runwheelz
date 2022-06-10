import 'package:flutter/material.dart';

import '../navigationDrawer.dart';

class ContactPage extends StatelessWidget {
  static const String routeName = '/contactPage';

  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
        ),
        drawer:  const NavigationDrawer(),
        body: const Center(child: Text("This is contacts page")));
  }
}