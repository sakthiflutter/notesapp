import 'package:flutter/material.dart';

import 'colour.dart';
import 'dimension.dart';

ThemeData get lightTheme => ThemeData(
  primaryColor: AppColors.primaryColor,
  cardColor: AppColors.cardColor,
  iconTheme: IconThemeData(color: AppColors.iconColor),
  buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFF5F1F1)),
  brightness: Brightness.light,
  backgroundColor: const Color(0xFF252525),

  iconButtonTheme:  IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3B3B3B))
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),

        )
      ),

        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3B3B3B))
    )
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF252525),


    titleTextStyle: TextStyle(
      fontSize: 25,
      color: Color(0xFFFDFDFD)
    )
  ),
  dividerColor: AppColors.dividerColor,
  canvasColor: Colors.transparent,
  scaffoldBackgroundColor: const Color(0xFF252525),
  fontFamily: "Poppins",
  primaryTextTheme: TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
        fontSize: AppDimentions.largeText, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: AppDimentions.bodyTextMedium,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: AppDimentions.bodyTextLarge,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: AppDimentions.bodyTextMedium,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: AppDimentions.bodyTextSmall,
    ),
  ),


);