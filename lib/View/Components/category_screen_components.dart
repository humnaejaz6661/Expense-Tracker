import 'package:expense_tracker/View/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreenComponents {
  static Widget CategoryBar() {
    return Row(
      children: [
        Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: IconButton(
                // alignment: Alignment(0.2, 0.0),
                padding: EdgeInsets.only(left: 9),
                //  visualDensity: VisualDensity.compact, // touch area ko kam krne k liye use krte ha
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.to(OnboardingScreen());
                },
              ),
            )),
        SizedBox(
          width: 62,
        ),
        Text(
          "Select Category ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // static Widget Searchfield() {
  //   return TextField(
  //     decoration: InputDecoration(
  //       hintText: "Search for Categories",
  //       hintStyle: TextStyle(color: Colors.grey),
  //       filled: true,
  //       prefixIcon: Transform.translate(
  //         offset: Offset(4, 0),
  //         child: Icon(
  //           Icons.search,
  //           color: Colors.grey,
  //           size: 30,
  //         ),
  //       ),
  //       fillColor: Color(0xffffffff),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(30),
  //         borderSide: BorderSide.none,
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(30),
  //         borderSide: BorderSide(color: Color(0xffffffff)),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(30),
  //         borderSide: BorderSide(color: Color(0xffffffff), width: 2),
  //       ),
  //       contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
  //     ),
  //   );
  // }

  static Widget textWidget(
      String text, Color? color, double fontsize, FontWeight fontweight) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontsize, color: color, fontWeight: fontweight),
    );
  }
}
