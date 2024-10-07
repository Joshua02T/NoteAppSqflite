import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_list/constants/colors/colors.dart';
import 'package:homework_list/constants/components/customtextfield.dart';
import 'package:homework_list/view/addscreen/controller/addcontroller.dart';

class AddList extends StatelessWidget {
  const AddList({super.key});

  @override
  Widget build(BuildContext context) {
    AddListController controller = Get.put(AddListController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        title: const Text('Add List'),
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          Form(
              key: controller.mykey,
              child: Column(
                children: [
                  CustomTextField(
                    mycontroller: controller.title,
                    labeltext: 'Title',
                    myvalidator: controller.myvalidator,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    mycontroller: controller.content,
                    labeltext: 'content',
                    myvalidator: controller.myvalidator,
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () {
                      controller.insertData();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    textColor: MyColors.white,
                    minWidth: 150,
                    height: 40,
                    color: MyColors.blue,
                    child: const Text('Add'),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
