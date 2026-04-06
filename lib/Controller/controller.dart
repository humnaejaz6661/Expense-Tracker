import 'package:expense_tracker/Model/category_screen_model_class.dart';
import 'package:expense_tracker/Model/onboarding_screen_model_class.dart';
import 'package:expense_tracker/View/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  List<OnboardingScreenModelClass> mytransaction = [
    OnboardingScreenModelClass(
        imagepath: "assets/images/house.png",
        title: "Resturant Expense",
        date: "31 March 2026",
        amount: "\$400",
        arrowicon: Icons.arrow_forward_ios),
    OnboardingScreenModelClass(
        imagepath: "assets/images/house.png",
        title: "Home Expense",
        date: "16 March 2026",
        amount: "\$920",
        arrowicon: Icons.arrow_forward_ios),
    OnboardingScreenModelClass(
        imagepath: "assets/images/house.png",
        title: "Shopping Expense",
        date: "1 April 2026",
        amount: "\$130",
        arrowicon: Icons.arrow_forward_ios),
    OnboardingScreenModelClass(
        imagepath: "assets/images/house.png",
        title: "Bike Expense",
        date: "23 March 2026",
        amount: "\$999",
        arrowicon: Icons.arrow_forward_ios),
    OnboardingScreenModelClass(
        imagepath: "assets/images/book.png",
        title: "Study Expense",
        date: "21 June 2025",
        amount: "\$563",
        arrowicon: Icons.arrow_forward_ios),
    OnboardingScreenModelClass(
        imagepath: "assets/images/other.png",
        title: "Pet Expense",
        date: "09 January 2026",
        amount: "\$293",
        arrowicon: Icons.arrow_forward_ios),
  ];

  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  void save() {
    if (formKey.currentState!.validate()) {
      Get.offAll(() => OnboardingScreen());
    }
  }

  List<Category> myCategory = [
    Category(
      iconpath: "assets/images/add.png",
      name: "Add",
    ),
    Category(
      iconpath: "assets/images/grocery.png",
      name: "Groceries",
    ),
    Category(
      iconpath: "assets/images/travel.png",
      name: "Travel",
    ),
    Category(
      iconpath: "assets/images/car.png",
      name: "Car",
    ),
    Category(
      iconpath: "assets/images/house.png",
      name: "Home",
    ),
    Category(
      iconpath: "assets/images/insurance.png",
      name: "Insurance",
    ),
    Category(
      iconpath: "assets/images/book.png",
      name: "Education",
    ),
    Category(
      iconpath: "assets/images/marketing.png",
      name: "Marketing",
    ),
    Category(
      iconpath: "assets/images/shopping.png",
      name: "Shopping",
    ),
    Category(
      iconpath: "assets/images/internet.png",
      name: "Internet",
    ),
    Category(
      iconpath: "assets/images/water.png",
      name: "Water",
    ),
    Category(
      iconpath: "assets/images/rent.png",
      name: "Rent",
    ),
    Category(
      iconpath: "assets/images/dumbbell.png",
      name: "Gym",
    ),
    Category(
      iconpath: "assets/images/notification.png",
      name: "Subscription",
    ),
    Category(
      iconpath: "assets/images/vacation.png",
      name: "Vacation",
    ),
    Category(
      iconpath: "assets/images/other.png",
      name: "Other",
    ),
  ];
}
