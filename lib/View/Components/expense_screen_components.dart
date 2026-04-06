import 'package:expense_tracker/View/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseScreenComponents {
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
                  Get.back();
                },
              ),
            )),
        SizedBox(
          width: 62,
        ),
        Text(
          "Add Expense ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  static Widget customtextField({
    required String hinttext,
    TextInputType? keyboardtype,
    TextEditingController? controller,
    String? Function(String?)? validation,
    IconData? prefixicon,
  }) {
    return TextFormField(
      keyboardType: keyboardtype,
      controller: controller,
      validator: validation,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        prefixIcon: Transform.translate(
          offset: Offset(4, 0),
          child: Icon(
            prefixicon,
            color: Colors.grey,
            size: 30,
          ),
        ),
        fillColor: Color(0xffffffff),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 1, color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 1, color: Colors.purple)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      ),
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
}
