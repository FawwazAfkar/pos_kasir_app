import 'package:get/get.dart';
import '../models/product_model.dart';
import '../models/sales_model.dart';
import 'dashboard_controller.dart';

class CashierController extends GetxController {
  var products = <Product>[].obs;
  var totalPrice = 0.0.obs;

  void addProduct(Product product) {
    products.add(product);
    totalPrice.value += product.price;
  }

  void completeTransaction() {
    if (products.isNotEmpty) {
      final sale = Sale(
        date: DateTime.now(),
        amount: totalPrice.value,
      );
      Get.find<DashboardController>().addSale(sale);
      products.clear();
      totalPrice.value = 0.0;
    }
  }
}