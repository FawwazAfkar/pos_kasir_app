import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueGrey[900] ?? Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              tileColor: Colors.blueGrey[700],
              title: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.white),
              title: Text(
                'Dashboard',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Get.toNamed('/dashboard'),
            ),
            ListTile(
              leading: Icon(Icons.point_of_sale, color: Colors.white),
              title: Text(
                'Kasir',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Get.toNamed('/cashier'),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Get.toNamed('/login'),
            ),
          ],
        ),
      ),
    );
  }
}