import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Menu'),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () => Get.toNamed('/dashboard'),
          ),
          ListTile(
            title: Text('Kasir'),
            onTap: () => Get.toNamed('/cashier'),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () => Get.toNamed('/login'),
          ),
        ],
      ),
    );
  }
}