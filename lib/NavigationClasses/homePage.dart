import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../navigationDrawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/contactPage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        drawer:  const NavigationDrawer(),
        body: const Center(child: Text("This is home page")));
  }
}
