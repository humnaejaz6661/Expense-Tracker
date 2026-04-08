import 'package:expense_tracker/Controller/controller.dart';
import 'package:expense_tracker/Core/Theme/appcolor.dart';
import 'package:expense_tracker/Model/onboarding_screen_model_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreenComponents {
  static Widget iconContainer(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
          child: IconButton(
              padding: EdgeInsets.zero, onPressed: () {}, icon: Icon(icon))),
    );
  }

  static Widget navigationItem(int index, IconData icon, String label) {
    AppController controller = Get.find<AppController>();

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        controller.changeIndex(index);
      },
      child: Obx(() {
        bool isSelected = controller.currentIndex.value == index;

        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.primaryColor : Colors.grey,
                size: 25,
              ),
              Text(label,
                  style: TextStyle(
                      color: isSelected ? AppColors.primaryColor : Colors.grey,
                      fontSize: 12)),
            ],
          ),
        );
      }),
    );
  }

  static Widget SpendingWallet(
    String spendingamount,
  ) {
    return Container(
      height: 70,
      //width: 320,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: Icon(
            Icons.account_balance_wallet_outlined,
            size: 18,
          ),
          title: Text(
            "Spending Wallet",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          trailing: Wrap(
            spacing: 10,
            children: [
              Text(
                spendingamount,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showCustomDialog(AppController controller) {
    Get.defaultDialog(
      title: "Enter your Amount",
      radius: 10,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                hintText: " Amount",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.saveData();
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget expenseTile({required OnboardingScreenModelClass item}) {
    return Container(
      height: 75,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: ListTile(
            leading: Image.asset(
              item.imagepath,
              height: 25,
            ),
            title: Text(
              item.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              item.date,
              style: const TextStyle(
                  color: AppColors.offwhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            trailing: Wrap(
              spacing: 10,
              children: [
                Text(
                  item.amount,
                  style: const TextStyle(
                      color: AppColors.brown,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
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
  }
}
