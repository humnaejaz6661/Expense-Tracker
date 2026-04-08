import 'package:expense_tracker/Controller/controller.dart';
import 'package:expense_tracker/View/bottom_navbar.dart';
import 'package:expense_tracker/View/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.find<AppController>().currentIndex.value = 0;
                Get.to(() => BottomNavbarr());
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Text(
            "Transaction Screen",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
