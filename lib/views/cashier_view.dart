import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/custom_input_field.dart';

class CashierView extends GetView<CashierController> {
  const CashierView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kasir')),
      drawer: const SidebarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    hintText: 'Nama Produk',
                    onChanged: (value) => controller.productName.value = value,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomInputField(
                    hintText: 'Harga',
                    onChanged: (value) => controller.productPrice.value = double.tryParse(value) ?? 0.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: controller.addProduct,
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return ListTile(
                        title: Text(product.name),
                        trailing: Text('Rp ${product.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                )),
            Obx(() => Text(
                  'Total: Rp ${controller.getTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
              onPressed: controller.completeTransaction,
              child: const Text('Selesaikan Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}