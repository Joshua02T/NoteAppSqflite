import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_list/bindings/binding.dart';
import 'package:homework_list/constants/routes/routes.dart';
import 'package:homework_list/constants/themes/themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        initialBinding: MyBindings(),
        initialRoute: Routes.homepage,
        getPages: Routes.pages);
  }
}
