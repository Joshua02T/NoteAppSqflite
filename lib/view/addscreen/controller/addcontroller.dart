import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_list/sql/sqfdb.dart';
import 'package:homework_list/view/homepage/controller/hpcontroller.dart'; // Import the HomePageController

class AddListController extends GetxController {
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  SqlDb sqlDb = SqlDb();

  String? myvalidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid text';
    }
    return null;
  }

  insertData() async {
    if (mykey.currentState!.validate()) {
      int response = await sqlDb.insertData(
        "INSERT INTO 'lists' ('title', 'content') VALUES ('${title.text}', '${content.text}')",
      );

      if (response > 0) {
        HomePageController homeController = Get.find<HomePageController>();
        await homeController.loadData();

        Get.back();
      }
    }
  }
}
