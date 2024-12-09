import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxDouble todaySales = 0.0.obs;
  final RxInt totalTransactions = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSalesSummary();
  }

  void fetchSalesSummary() {
    // Simulasi pengambilan data penjualan
    todaySales.value = 5000000.0;
    totalTransactions.value = 45;
  }

  void logout() {
    Get.offNamed('/login');
  }
}