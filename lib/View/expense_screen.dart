import 'package:expense_tracker/Core/Theme/appcolor.dart';
import 'package:expense_tracker/Core/customTextfiled.dart';
import 'package:expense_tracker/View/Components/expense_screen_components.dart';
import 'package:expense_tracker/Controller/controller.dart';
import 'package:expense_tracker/View/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseScreen extends StatelessWidget {
  //AppController controller = Get.find<AppController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              // alignment: Alignment(0.2, 0.0),
              padding: EdgeInsets.only(left: 9),
              //  visualDensity: VisualDensity.compact, // touch area ko kam krne k liye use krte ha
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
                //Get.to(() => BottomNavbarr());
              },
            ),
            title: Text(
              "Add Expense ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          backgroundColor: const Color(0xffefeef1),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 1.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primaryColor, AppColors.secondaryColor],
                  stops: [0.0, 0.4],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Image.asset(
                        controller.selectedCategory.value.iconpath,
                        height: 45,
                        width: 45,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.selectedCategory.value.name,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomTextField(
                        hintText: 'Title',
                        controller: controller.titlecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Expense Title";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          hintText: 'Amount',
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: controller.amountcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Expense Amount";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.save(formKey);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(colors: [
                                AppColors.lightPurpule,
                                AppColors.primaryColor
                              ])),
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
