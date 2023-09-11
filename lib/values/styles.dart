import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prune/values/colors.dart';
import 'package:prune/values/fonts.dart';

class AppStyles {

  static ThemeData lightTheme = ThemeData().copyWith(
    backgroundColor: LTColors.pryBackground,
    primaryColorLight: LTColors.pryLighter,
    primaryColorDark: LTColors.pryDark,
    cardTheme: CardStyles.theme,
    primaryColor: LTColors.pry,
    scaffoldBackgroundColor: LTColors.pryBackground,
    appBarTheme: _appBarTheme,
    textButtonTheme: ButtonStyles.textButtonTheme,
    canvasColor: Colors.transparent, //
    cupertinoOverrideTheme: const CupertinoThemeData(
        //changes iOS cursor color
        primaryColor: LTColors.pryDark,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      // this changes Android cursor
        cursorColor: LTColors.pryDark,
        selectionColor: LTColors.pryLighter
    )
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark, color: Colors.white);


}

class TextStyles {

  static const TextStyle bodyLightTheme = TextStyle(
      fontFamily: Fonts.familyName,
      color: LTColors.pryBodyText,
      fontSize: FontSizes.bodyText,
      fontWeight: FontWeight.normal,
      height: 1.2
  );
  
  static const TextStyle pryBody = TextStyle(
    fontSize: FontSizes.bodyText,
    fontWeight: FontWeight.normal,
    color: LTColors.pryBodyText,
  );

  static const TextStyle pryH2 = TextStyle(
    color: LTColors.pryBodyText,
    fontWeight: FontWeight.bold,
    fontSize: FontSizes.h2Text,
  );

  static const TextStyle pryH4 = TextStyle(
    color: LTColors.pryBodyText,
    fontWeight: FontWeight.bold,
    fontSize: FontSizes.h4Text,
  );

  static TextStyle pryNormalH4 = pryH4.copyWith(fontWeight: FontWeight.normal);

  static const TextStyle pryH5 = TextStyle(
    color: LTColors.pryBodyText,
    fontWeight: FontWeight.bold,
    fontSize: FontSizes.h5Text,
  );

  static TextStyle secH5 = pryH5.copyWith(color: LTColors.secBodyText);

  static TextStyle pryNormalH5 = pryH5.copyWith(fontWeight: FontWeight.normal);

  static TextStyle secNormalH5 = secH5.copyWith(fontWeight: FontWeight.normal);

  static TextStyle lighterSecNormalH5 = secH5.copyWith(fontWeight: FontWeight.normal, color: LTColors.secLighterBodyText);

  static TextStyle boldPryBody = pryBody.copyWith(fontWeight: FontWeight.bold);

  static TextStyle secBody = pryBody.copyWith(color: LTColors.secBodyText);

  static TextStyle boldSecBody = secBody.copyWith(fontWeight: FontWeight.bold);

  static TextStyle boldSecSmallBody = boldSecBody.copyWith(fontSize: FontSizes.smallBodyText);

  static TextStyle secSmallBody = secBody.copyWith(fontSize: FontSizes.smallBodyText);

  static TextStyle secSmallerBody = secBody.copyWith(fontSize: FontSizes.smallerBodyText);

  static TextStyle lightSecBody = pryBody.copyWith(color: LTColors.secLightBodyText);

  static TextStyle lighterSecSmallBody = pryBody.copyWith(color: LTColors.secLighterBodyText, fontSize: FontSizes.smallBodyText);

  static TextStyle lighterSecBody = pryBody.copyWith(color: LTColors.secLighterBodyText, fontSize: FontSizes.bodyText);

  static const TextStyle h2 = TextStyle(
    fontSize: FontSizes.h2Text,
    fontWeight: FontWeight.w700,
    color: LTColors.headingText,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: FontSizes.h3Text,
    fontWeight: FontWeight.w700,
    color: LTColors.headingText,
  );

  static const TextStyle appBar = TextStyle(
    fontSize: FontSizes.appBarTitle,
    fontWeight: FontWeight.w700,
    color: LTColors.pryBodyText,
  );

  static const TextStyle pryTextFieldHint = TextStyle(color: LTColors.pryTextFieldHint);

  static const pryTextButton = TextStyle(
    fontSize: FontSizes.textButtonText,
    fontWeight: FontWeight.w600,
    color: LTColors.pryTextButtonText,
  );

  static const secTextButton = TextStyle(
    fontSize: FontSizes.textButtonText,
    fontWeight: FontWeight.w600,
    color: LTColors.secTextButtonText,
  );

  static const pryButton = TextStyle(color: LTColors.pryButtonText, fontWeight: FontWeight.w600, fontSize: 16);

  static TextStyle lightPryButton = pryButton.copyWith(color: LTColors.lightPryButtonText);


}

class ButtonStyles {

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.textButtonText,
    ))),
  );

}

class CardStyles {

  static CardTheme theme = CardTheme(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

}
