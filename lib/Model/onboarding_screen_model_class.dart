import 'package:flutter/material.dart';

class OnboardingScreenModelClass {
  String imagepath;
  String title;
  // String subtitle;
  String date;
  String amount;
  IconData arrowicon;

  OnboardingScreenModelClass({
    required this.imagepath,
    required this.title,
    // required this.subtitle,
    required this.date,
    required this.amount,
    this.arrowicon = Icons.arrow_forward_ios,
  });
}
