import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Store/email_auth_provider.dart';
import 'package:provider/src/provider.dart';

Widget customDrawer(BuildContext context) => Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      const UserAccountsDrawerHeader(
        accountName: Text("teyouale"),
        accountEmail: Text("teyouale@gmail.com"),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text(
            "E",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.home), title: Text("Home"),
        onTap: () {
            Navigator.pushReplacementNamed(context, "home");
        },
      ),
      ListTile(
        leading: Icon(Icons.settings), title: Text("Settings"),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.contacts), title: Text("Contact Us"),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading:  Icon(Icons.logout ,color: Theme.of(context).iconTheme.color),
        title: const Text("Logout"),
        onTap: () {
          context.read<AuthenticationService>().signOut(context);
        },
      ),
    ],
  ),
);
