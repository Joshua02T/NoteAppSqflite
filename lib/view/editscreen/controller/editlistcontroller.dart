import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_list/sql/sqfdb.dart';
import 'package:homework_list/view/homepage/controller/hpcontroller.dart'; // Import HomePageController

class EditListController extends GetxController {
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  SqlDb sqldb = SqlDb();

  late int id;

  @override
  void onInit() {
    final Map<String, dynamic> args = Get.arguments;
    id = args['listid'];
    title.text = args['title'];
    content.text = args['content'];
    super.onInit();
  }

  String? myvalidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid text';
    }
    return null;
  }

  Future<void> saveEdits() async {
    if (mykey.currentState!.validate()) {
      int response = await sqldb.updateData(
          "UPDATE lists SET title = '${title.text}', content = '${content.text}' WHERE id = $id");

      if (response > 0) {
        Get.find<HomePageController>()
            .updateItemInList(id, title.text, content.text);

        Get.back();
      }
    }
  }
}
