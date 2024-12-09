import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (value) => controller.username.value = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => controller.password.value = value,
              ),
              Obx(() => Text(controller.errorMessage.value, style: TextStyle(color: Colors.red))),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}