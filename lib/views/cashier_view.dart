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
      appBar: AppBar(
        title: Text(
          'Kasir',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama Produk',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.shopping_cart),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Harga Produk',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyle(fontSize: 16, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Tambah Produk', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Obx(() => Expanded(
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (_, index) {
                  final product = controller.products[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(product.name),
                      trailing: Text('Rp${product.price}'),
                    ),
                  );
                },
              ),
            )),
            Obx(() => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Total: Rp${controller.totalPrice}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )),
            ElevatedButton(
              onPressed: controller.completeTransaction,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyle(fontSize: 16, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Selesaikan Transaksi', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}