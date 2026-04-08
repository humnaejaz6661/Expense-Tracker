import 'package:expense_tracker/View/category_screen.dart';
import 'package:expense_tracker/View/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseScreenComponents {
  static Widget CategoryBar() {
    return Row(
      children: [
        Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: IconButton(
                // alignment: Alignment(0.2, 0.0),
                padding: EdgeInsets.only(left: 9),
                //  visualDensity: VisualDensity.compact, // touch area ko kam krne k liye use krte ha
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.to(CategoryScreen());
                },
              ),
            )),
        SizedBox(
          width: 62,
        ),
        Text(
          "Add Expense ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
