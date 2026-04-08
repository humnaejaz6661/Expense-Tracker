import 'package:expense_tracker/Model/category_screen_model_class.dart';
import 'package:expense_tracker/Model/chart_screen_model_class.dart';
import 'package:expense_tracker/Model/onboarding_screen_model_class.dart';
import 'package:expense_tracker/View/account_screen.dart';
import 'package:expense_tracker/View/category_screen.dart';
import 'package:expense_tracker/View/chart_screen.dart';
import 'package:expense_tracker/View/expense_screen.dart';
import 'package:expense_tracker/View/Home/home_screen.dart';
import 'package:expense_tracker/View/bottom_navbar.dart';
import 'package:expense_tracker/View/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppController extends GetxController {
  RxList<OnboardingScreenModelClass> mytransaction =
      <OnboardingScreenModelClass>[].obs;
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  //TextEditingController descriptioncontroller = TextEditingController();

  void save(GlobalKey<FormState> anyKey) {
    if (anyKey.currentState!.validate()) {
      String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
      final newEntry = OnboardingScreenModelClass(
        imagepath: selectedCategory.value.iconpath,
        title: selectedCategory.value.name,
        //  date: DateTime.now().toString(),
        date: formattedDate,
        amount: "\$${amountcontroller.text}",
        //  arrowicon: Icons.arrow_forward_ios,
      );

      mytransaction.add(newEntry);

      Get.offAll(() => BottomNavbarr());
    }
  }

  var selectedCategory = Category(name: "", iconpath: "").obs;

  void selectCategory(Category category) {
    selectedCategory.value = category;
    //titlecontroller.text = category.name;

    titlecontroller.clear();
    amountcontroller.clear();
    Get.find<AppController>().currentIndex.value = 0;
    Get.to(() => ExpenseScreen());
  }

  double calcluatetotal() {
    double currentTotal = 0.0;
    for (var item in mytransaction) {
      String onlyNumber = item.amount
          .replaceAll('\$', ""); // remove dollarsign and return number
      double amount = double.tryParse(onlyNumber) ??
          0.0; // tryParse string ko double ma convert krta ha
      currentTotal = currentTotal + amount;
    }
    return currentTotal;
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
  // for dialoug box
  TextEditingController nameController = TextEditingController();

  void saveData() {
    String text = nameController.text.trim();

    if (text.isEmpty) {
      Get.snackbar("Error", "Please enter amount");
    } else {
      displayAmount.value = text;

      Get.back();

      nameController.clear();
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  RxString displayAmount = "20000.".obs;
  double remainingBalance() {
    double initialwallet = double.tryParse(displayAmount.value) ?? 0.0;
    double expense = calcluatetotal();
    return initialwallet - expense;
  }

  //for total amount jo top pr show ho rahu ha

  //chart list
  final List<ChartData> chartData = [
    ChartData('Feb', 150, 120),
    ChartData('Mar', 220, 140),
    ChartData('Apr', 180, 160),
    ChartData('May', 170, 230),
    ChartData('Jun', 140, 110),
    ChartData('Jul', 300, 200),
  ];
  // final List<Widget> screens = [
  //   OnboardingScreen(),
  //   TransactionScreen(),
  //   AnalyticsPage(),
  //   AccountScreen(),
  // ];
}
