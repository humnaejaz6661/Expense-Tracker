import 'package:expense_tracker/Controller/controller.dart';
import 'package:expense_tracker/View/Home/home_components.dart';
import 'package:expense_tracker/View/account_screen.dart';
import 'package:expense_tracker/View/category_screen.dart';
import 'package:expense_tracker/View/chart_screen.dart';
import 'package:expense_tracker/View/Home/home_screen.dart';
import 'package:expense_tracker/View/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomNavbarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.put(AppController());
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: controller.currentIndex.value == 0
            ? AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                  child: HomeScreenComponents.iconContainer(
                      Icons.settings_outlined),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.calendar_month_outlined)),
                    Text(
                      DateFormat('E, d MMMM').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0, top: 8.0, bottom: 8.0),
                    child: HomeScreenComponents.iconContainer(
                        Icons.notifications_outlined),
                  ),
                ],
              )
            : null,
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomeScreen(),
            TransactionScreen(),
            AnalyticsPage(),
            AccountScreen(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(CategoryScreen());
          },
          backgroundColor: Color(0xFF141432),
          elevation: 4,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white, size: 30),
        ),
        bottomNavigationBar: Builder(
          builder: (newContext) {
            return BottomAppBar(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              color: Colors.white,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.currentIndex.value = 0,
                    child: HomeScreenComponents.navigationItem(
                        0, Icons.home_outlined, "Home"),
                  ),
                  GestureDetector(
                    onTap: () => controller.currentIndex.value = 1,
                    child: HomeScreenComponents.navigationItem(
                      1,
                      Icons.account_balance_wallet_outlined,
                      "Transaction",
                    ),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () => controller.currentIndex.value = 2,
                    child: HomeScreenComponents.navigationItem(
                        2, Icons.analytics_outlined, "Analytics"),
                  ),
                  GestureDetector(
                    onTap: () => controller.currentIndex.value = 3,
                    child: HomeScreenComponents.navigationItem(
                        3, Icons.person_outline, "Account"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
