import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var errorMessage = ''.obs;

  void login() {
    if (username.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = 'Username and Password cannot be empty';
      return;
    }

    // Mock login validation
    if (username.value == 'admin' && password.value == 'password') {
      Get.toNamed('/dashboard');
    } else {
      errorMessage.value = 'Invalid Username or Password';
    }
  }
}