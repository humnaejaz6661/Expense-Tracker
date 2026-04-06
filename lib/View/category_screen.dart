import 'package:expense_tracker/Controller/controller.dart';
import 'package:expense_tracker/View/Components/category_screen_components.dart';
import 'package:expense_tracker/View/Components/expense_screen_components.dart';
import 'package:expense_tracker/View/expense_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
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
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CategoryScreenComponents.CategoryBar(),
                SizedBox(
                  height: 30,
                ),
                ExpenseScreenComponents.customtextField(
                    hinttext: "Category for Search", prefixicon: Icons.search),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing:
                            2, // Vertical spacing lines ke darmiyan
                        //crossAxisSpacing: 0,
                        childAspectRatio: 1.0,
                        mainAxisExtent: 90),
                    itemCount: controller.myCategory.length,
                    itemBuilder: (context, index) {
                      final item = controller.myCategory[index];

                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ExpenseScreen());
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffffffff),
                              ),
                              child: Center(
                                child: Image.asset(
                                  item.iconpath,
                                  height: 25,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          CategoryScreenComponents.textWidget(item.name,
                              Color(0xff211b38), 14, FontWeight.w400),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
