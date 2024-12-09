import 'package:get/get.dart';
import '../models/sales_model.dart';

class DashboardController extends GetxController {
  var sales = <Sale>[].obs;

  void addSale(Sale sale) {
    sales.add(sale);
    updateSalesSummary();
  }

  void updateSalesSummary() {
    // Calculate total sales and transactions
    double totalSales = 0;
    int totalTransactions = sales.length;
    for (var sale in sales) {
      totalSales += sale.amount;
    }
    this.totalSales.value = totalSales;
    this.totalTransactions.value = totalTransactions;
  }

  var totalSales = 0.0.obs;
  var totalTransactions = 0.obs;
}