import 'package:flutter/material.dart';

class GeneralUtils {

  double delayDuration(double parentDuration, int position){
    return double.parse("${parentDuration + (0.5 * (position + 1))}");
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

}