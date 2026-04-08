import 'package:expense_tracker/Controller/controller.dart';
import 'package:expense_tracker/Core/Theme/appcolor.dart';
import 'package:expense_tracker/Model/chart_screen_model_class.dart';
import 'package:expense_tracker/View/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsPage extends StatelessWidget {
  AppController controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.find<AppController>().currentIndex.value = 0;

              //  Get.offAll(() => BottomNavbarr());
              Get.to(() => BottomNavbarr());
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Analytics",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 330,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Text("Monthly",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54)),
                                Icon(Icons.keyboard_arrow_down,
                                    size: 18, color: Colors.black54),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: AppColors.purple,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Income",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Expense",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: SfCartesianChart(
                      plotAreaBorderWidth: 0, // line ko remove kre ga

                      primaryXAxis: CategoryAxis(
                        majorGridLines: MajorGridLines(
                            width: 0), //back lines of chart ko remove kr do
                        axisLine: AxisLine(width: 0),
                        majorTickLines: MajorTickLines(size: 0),
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 300,
                        interval: 98,
                        maximumLabels: 6,
                        axisLine: AxisLine(width: 0),
                        majorTickLines: MajorTickLines(
                            size:
                                0), //remove small line jo number k sath hoti ha
                        labelFormat: r'${value}',
                      ),
                      series: <CartesianSeries<ChartData, String>>[
                        ColumnSeries<ChartData, String>(
                          name: 'Expense',
                          dataSource: controller.chartData,
                          xValueMapper: (ChartData data, _) => data.month,
                          yValueMapper: (ChartData data, _) => data.expense,
                          color: AppColors.green,
                          width: 0.7,
                          spacing: 0.2,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                        ),
                        ColumnSeries<ChartData, String>(
                          name: 'Income',
                          dataSource: controller.chartData,
                          xValueMapper: (ChartData data, _) => data.month,
                          yValueMapper: (ChartData data, _) => data.income,
                          color: AppColors.purple,
                          width: 0.7,
                          spacing: 0.2,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
