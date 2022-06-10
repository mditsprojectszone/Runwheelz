import 'package:flutter/material.dart';

import '../navigationDrawer.dart';

class EventPage extends StatelessWidget {
  static const String routeName = '/eventPage';

  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Events"),
        ),
        drawer: const NavigationDrawer(),
        body: const Center(child: Text("Hey! this is events list page")));
  }
}