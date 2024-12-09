import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/sidebar_widget.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: const SidebarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Card(
                  child: ListTile(
                    title: Text('Penjualan Hari Ini'),
                    subtitle: Text('Rp ${controller.todaySales.value.toStringAsFixed(2)}'),
                  ),
                )),
            Obx(() => Card(
                  child: ListTile(
                    title: Text('Total Transaksi'),
                    subtitle: Text('${controller.totalTransactions.value}'),
                  ),
                )),
            SizedBox(height: 20),
            Text('Grafik Penjualan', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 4),
                        FlSpot(2, 5),
                        FlSpot(3, 7),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}