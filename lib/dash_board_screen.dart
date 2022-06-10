import 'package:flutter/material.dart';
import 'package:run_wheelz/NavigationClasses/contactPage.dart';
import 'package:run_wheelz/NavigationClasses/homePage.dart';
import 'package:run_wheelz/routes/NavDrawerPageRoutes.dart';

import 'NavigationClasses/eventPage.dart';
import 'NavigationClasses/notificationPage.dart';
import 'NavigationClasses/profilePage.dart';
class DashBoardScreen extends StatelessWidget{
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes:  {
        NavDrawerPageRoutes.home: (context) => const HomePage(),
        NavDrawerPageRoutes.contact: (context) => const ContactPage(),
        NavDrawerPageRoutes.event: (context) => const EventPage(),
        NavDrawerPageRoutes.profile: (context) => const ProfilePage(),
        NavDrawerPageRoutes.notification: (context) => const NotificationPage(),
      },
    );
  }
}