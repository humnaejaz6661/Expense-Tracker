import 'package:expense_tracker/Controller/controller.dart';
import 'package:expense_tracker/Core/Theme/appcolor.dart';
import 'package:expense_tracker/Model/onboarding_screen_model_class.dart';

import 'package:expense_tracker/View/Home/home_components.dart';
import 'package:expense_tracker/View/Home/home_components.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    //final AppController controller = Get.find<AppController>();
    return GetBuilder<AppController>(
      builder: (controller) => Obx(
        () => Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            //height: double.infinity,
            // height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ],
                stops: [0.0, 0.4],
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Column(
                      children: [
                        Text(
                          "This Month Spend",
                          style: TextStyle(
                              color: Color(0xff736a82),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            HomeScreenComponents.showCustomDialog(controller);
                          },
                          child: Obx(
                            () => Text(
                              " \$${controller.remainingBalance()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "67% below last month",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    HomeScreenComponents.SpendingWallet(
                      "${controller.calcluatetotal()}",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Expense",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        // SizedBox(
                        //   width: 180,
                        // ),
                        Spacer(),
                        Text(
                          "See All",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: controller.mytransaction.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = controller.mytransaction[index];
                          return HomeScreenComponents.expenseTile(item: item);
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//get storage
