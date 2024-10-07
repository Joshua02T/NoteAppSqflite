import 'package:flutter/material.dart';
import 'package:homework_list/constants/colors/colors.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: MyColors.blue,
      iconTheme: IconThemeData(color: MyColors.white),
      elevation: 10,
      shadowColor: MyColors.black,
      titleSpacing: 3,
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    ),
  );
}
