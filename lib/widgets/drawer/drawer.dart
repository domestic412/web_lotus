import 'package:flutter/material.dart';

class DrawerWeb extends StatelessWidget {
  const DrawerWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Tracking'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Quote'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Quote'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Quote'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Quote'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Quote'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
