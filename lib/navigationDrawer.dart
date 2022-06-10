import 'package:flutter/material.dart';
import 'package:run_wheelz/routes/NavDrawerPageRoutes.dart';
import 'package:run_wheelz/widgets/createDrawerBodyItem.dart';
import 'package:run_wheelz/widgets/createDrawerHeader.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer( backgroundColor: Colors.grey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, NavDrawerPageRoutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, NavDrawerPageRoutes.profile),
          ),

          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Events',
            onTap: () =>
                Navigator.pushReplacementNamed(context, NavDrawerPageRoutes.event),
          ),
          const Divider(),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Notifications',
            onTap: () =>
                Navigator.pushReplacementNamed(context, NavDrawerPageRoutes.notification),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Contact Info',
            onTap: () =>
                Navigator.pushReplacementNamed(context, NavDrawerPageRoutes.contact),
          ),
          ListTile(
            title: const Text('App version 1.0.0',style: TextStyle(
                color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}