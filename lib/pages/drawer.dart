import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
        child: Text('Welcome User!'),
      ),
      ListTile(
        leading: Icon(Icons.brightness_2_outlined),
        title: const Text('Theme'),
        subtitle: Text('Based on system settings'),
       
      ),
      ListTile(
        leading: Icon(Icons.update),
        title: const Text('Version 1.0'),
        subtitle: Text("Made with ❤️ by Rahul"),
      ),
      

    ],
  ),
    );
  }
}