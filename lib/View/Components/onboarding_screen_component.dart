import 'package:expense_tracker/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnboardingScreenComponent {
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

  static Widget textWidget(
      String text, Color? color, double fontsize, FontWeight fontweight) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontsize, color: color, fontWeight: fontweight),
    );
  }

  static Widget navigationItem(int index, IconData icon, String label) {
    Controller controller = Get.find<Controller>();

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => controller.changeIndex(index),
      child: Obx(() {
        bool isSelected = controller.currentIndex.value == index;
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Color(0xff7853e0) : Colors.grey,
                size: 25,
              ),
              Text(label,
                  style: TextStyle(
                      color: isSelected ? Color(0xff7853e0) : Colors.grey,
                      fontSize: 12)),
            ],
          ),
        );
      }),
    );
  }

  static Widget SpendingWallet() {
    return Container(
      height: 70,
      //width: 320,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffffffff), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: Icon(
            Icons.account_balance_wallet_outlined,
            size: 18,
          ),
          title: OnboardingScreenComponent.textWidget(
              "Spending Wallet", Colors.black, 15, FontWeight.w400),
          trailing: Wrap(
            spacing: 10,
            children: [
              OnboardingScreenComponent.textWidget(
                  "\$5,631.22", Colors.black, 15, FontWeight.w400),
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
}
