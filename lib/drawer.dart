import 'package:flutter/material.dart';
import 'package:ariculture/main.dart';
import 'package:ariculture/page/show_advert_user.dart';
import 'package:ariculture/page/advert_create.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';



class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Adding clickable menu
          ListTile(
            title: const Text('Account'),
            onTap: () {
              // Routing the menu to the main page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'counter')),
              );
            },
          ),
          ListTile(
            title: const Text('Advertisements '),
            onTap: () {
              // Routing the menu to the form page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Show_advert_user()),
              );
            },
          ),
          ListTile(
            title: const Text('Create Ad'),
            onTap: () {
              // Routing the menu to the form page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}