import 'package:get/get.dart';
import '../models/product_model.dart';

class CashierController extends GetxController {
  final RxList<Product> products = <Product>[].obs;
  final RxString productName = ''.obs;
  final RxDouble productPrice = 0.0.obs;

  void addProduct() {
    if (productName.value.isNotEmpty && productPrice.value > 0) {
      products.add(Product(
        name: productName.value, 
        price: productPrice.value
      ));
      productName.value = '';
      productPrice.value = 0.0;
    }
  }

  double getTotalPrice() {
    return products.fold(0, (total, product) => total + product.price);
  }

  void completeTransaction() {
    if (products.isNotEmpty) {
      Get.snackbar(
        'Transaksi Berhasil', 
        'Total: Rp ${getTotalPrice().toStringAsFixed(2)}',
        snackPosition: SnackPosition.BOTTOM,
      );
      products.clear();
    }
  }
}