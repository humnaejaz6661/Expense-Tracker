import 'package:expense_tracker/Controller/controller.dart';
import 'package:expense_tracker/Core/Theme/appcolor.dart';
import 'package:expense_tracker/Core/customTextfiled.dart';
import 'package:expense_tracker/Model/category_screen_model_class.dart';
import 'package:expense_tracker/View/Components/category_screen_components.dart';
import 'package:expense_tracker/View/Components/expense_screen_components.dart';
import 'package:expense_tracker/View/bottom_navbar.dart';
import 'package:expense_tracker/View/expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  // final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      //  init: AppController(),
      builder: (controller) => Scaffold(
        extendBodyBehindAppBar: true,
        //  backgroundColor: Color(0xffefeef1),
        appBar: AppBar(
          leading: IconButton(
            // alignment: Alignment(0.2, 0.0),
            padding: EdgeInsets.only(left: 9),
            //  visualDensity: VisualDensity.compact, // touch area ko kam krne k liye use krte ha
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.to(() => BottomNavbarr());
            },
          ),
          title: Text(
            "Select Category ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                    ),
                    CustomTextField(
                      hintText: "Search for Category",
                      prefixIcon: Icons.search,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            // Vertical spacing lines ke darmiyan
                            // crossAxisSpacing: 8,
                            //childAspectRatio: 1.0,
                            mainAxisExtent: 90),
                        itemCount: controller.myCategory.length,
                        itemBuilder: (context, index) {
                          final item = controller.myCategory[index];
                          return CategoryGrid(
                            item: item,
                            onTap: () {
                              controller.selectCategory(item);
                            },
                          );
                        }),
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
