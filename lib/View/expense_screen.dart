import 'package:expense_tracker/View/Components/expense_screen_components.dart';
import 'package:expense_tracker/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseScreen extends StatelessWidget {
  Controller controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefeef1),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xffb092f9),
                Color(0xffefeef1),
              ],
              stops: [0.0, 0.4],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ExpenseScreenComponents.CategoryBar(),
                  SizedBox(
                    height: 60,
                  ),
                  ExpenseScreenComponents.customtextField(
                      hinttext: "Title",
                      controller: controller.titlecontroller,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Expense Title";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  ExpenseScreenComponents.customtextField(
                      hinttext: "Amount",
                      controller: controller.amountcontroller,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Expense Amount";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  ExpenseScreenComponents.customtextField(
                      hinttext: "Description",
                      controller: controller.descriptioncontroller,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Expense Description";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.save();
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 234, 228, 249),
                            Color(0xffaf8ef9),
                          ])),
                      child: Center(
                        child: ExpenseScreenComponents.textWidget(
                            "Save", Colors.black, 20, FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
