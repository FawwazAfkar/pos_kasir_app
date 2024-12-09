import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/sidebar.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
              'Total Penjualan: Rp${controller.totalSales}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
            SizedBox(height: 8),
            Obx(() => Text(
              'Total Transaksi: ${controller.totalTransactions}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.sales.isEmpty) {
                  return Center(child: Text('Belum ada data transaksi', style: TextStyle(fontSize: 16)));
                }
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: controller.sales
                                .asMap()
                                .entries
                                .map((e) => FlSpot(
                                      e.key.toDouble(),
                                      e.value.amount,
                                    ))
                                .toList(),
                            isCurved: true,
                            color: Colors.blueAccent,
                            barWidth: 3,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.blueAccent.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}