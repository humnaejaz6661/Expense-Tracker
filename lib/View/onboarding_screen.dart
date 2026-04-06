import 'package:expense_tracker/Controller/controller.dart';

import 'package:expense_tracker/View/Components/onboarding_screen_component.dart';
import 'package:expense_tracker/View/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefeef1),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffb092f9),
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
                Row(
                  children: [
                    OnboardingScreenComponent.iconContainer(
                        Icons.settings_outlined),
                    SizedBox(
                      width: 62,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_month_outlined)),
                        Text(
                          "Fri ,21 Jul ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 62),
                        OnboardingScreenComponent.iconContainer(
                            Icons.notifications_outlined),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    OnboardingScreenComponent.textWidget("This Month Spend",
                        Color(0xff736a82), 15, FontWeight.w400),
                    SizedBox(
                      height: 5,
                    ),
                    OnboardingScreenComponent.textWidget(
                        "\$313.31", Colors.black, 35, FontWeight.w700),
                    SizedBox(
                      height: 5,
                    ),
                    OnboardingScreenComponent.textWidget("67% below last month",
                        Colors.black, 14, FontWeight.w400),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                OnboardingScreenComponent.SpendingWallet(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    OnboardingScreenComponent.textWidget(
                        "Expense", Colors.black, 20, FontWeight.w500),
                    // SizedBox(
                    //   width: 180,
                    // ),
                    Spacer(),
                    OnboardingScreenComponent.textWidget(
                        "See All", Color(0xff747476), 16, FontWeight.w400)
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
                      return Container(
                        height: 75,
                        //width: 320,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: ListTile(
                              leading: Image.asset(
                                item.imagepath,
                                height: 25,
                              ),
                              title: OnboardingScreenComponent.textWidget(
                                  item.title,
                                  Colors.black,
                                  15,
                                  FontWeight.w600),
                              subtitle: OnboardingScreenComponent.textWidget(
                                  item.date,
                                  Color(0xff828282),
                                  12,
                                  FontWeight.w400),
                              trailing: Wrap(
                                spacing: 10,
                                children: [
                                  OnboardingScreenComponent.textWidget(
                                      item.amount,
                                      Color(0xffab6259),
                                      15,
                                      FontWeight.w400),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Icon(
                                      item.arrowicon,
                                      size: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
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
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OnboardingScreenComponent.navigationItem(
                0, Icons.home_outlined, "Home"),
            OnboardingScreenComponent.navigationItem(
                1, Icons.account_balance_wallet_outlined, "Transaction"),
            SizedBox(width: 40),
            OnboardingScreenComponent.navigationItem(
                2, Icons.analytics_outlined, "Analytics"),
            OnboardingScreenComponent.navigationItem(
                3, Icons.person_outline, "Account"),
          ],
        ),
      ),
    );
  }
}
