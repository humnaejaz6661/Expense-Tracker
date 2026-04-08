import 'package:expense_tracker/Core/Theme/appcolor.dart';
import 'package:expense_tracker/Model/category_screen_model_class.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.item,
    required this.onTap, // Controller ki bajaye hum function mangwa rahe hain
  });

  final Category item;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.selectCategory(item);
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 12, right: 12, left: 12),
            padding: EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.white,
            ),
            child: Center(
              child: Image.asset(
                item.iconpath,
                height: 25,
              ),
            ),
          ),
          //  ),
          Text(
            item.name,
            style: TextStyle(
                color: AppColors.blackPurple,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
