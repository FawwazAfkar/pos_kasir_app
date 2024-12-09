import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'POS App',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () => Get.offNamed('/dashboard'),
          ),
          ListTile(
            title: const Text('Kasir'),
            onTap: () => Get.offNamed('/cashier'),
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () => Get.offNamed('/login'),
          ),
        ],
      ),
    );
  }
}