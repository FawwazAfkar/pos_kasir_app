import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxString username = ''.obs;
  final RxString password = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  void login() {
    isLoading.value = true;
    errorMessage.value = '';

    // Simulasi login
    if (username.value == 'admin' && password.value == 'password') {
      Get.offNamed('/dashboard');
    } else {
      errorMessage.value = 'Username atau password salah';
    }
    
    isLoading.value = false;
  }
}