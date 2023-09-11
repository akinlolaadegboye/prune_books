import 'package:flutter/material.dart';

class LTEdgeInsets {
  static const EdgeInsets screen = EdgeInsets.symmetric(horizontal: Dimens.screenHorMargin, vertical: Dimens.screenVertMargin);
}



class Dimens {

  // Screens
  static const double screenVertMargin = 30;
  static const double screenHorMargin = 30;

  // Button dimens
  static const double buttonHeight = 53.0;
  static const double buttonHozPadding = 10.0;
  static const double buttonBorderRadius = 16.0;
  static const double buttonElevation = 1.0;
  static const double buttonDisabledElevation = 0.0;



  // Views
  static const double textFieldVerticalSpacing = 20.0;
  static const double borderWidth = 1;
  static const widgetsBiggerInterspace = 25.0;
  static const widgetsInterspace = 15.0;


}
