import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';
import '../models/product_model.dart';
import '../widgets/sidebar.dart';

class CashierView extends StatelessWidget {
  final CashierController controller = Get.put(CashierController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kasir')),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama Produk'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Harga Produk'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  name: nameController.text,
                  price: double.parse(priceController.text),
                );
                controller.addProduct(product);
              },
              child: Text('Tambah Produk'),
            ),
            Obx(() => Expanded(
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (_, index) {
                  final product = controller.products[index];
                  return ListTile(
                    title: Text(product.name),
                    trailing: Text('Rp${product.price}'),
                  );
                },
              ),
            )),
            Obx(() => Text('Total Price: Rp${controller.totalPrice}')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.completeTransaction,
              child: Text('Selesaikan Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}