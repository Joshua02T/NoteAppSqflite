import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_list/constants/colors/colors.dart';
import 'package:homework_list/sql/sqfdb.dart';
import 'package:homework_list/view/homepage/controller/hpcontroller.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String content;
  final int listid;
  const CustomCard({
    super.key,
    required this.title,
    required this.content,
    required this.listid,
  });

  @override
  Widget build(BuildContext context) {
    SqlDb sqlDb = SqlDb();
    return InkWell(
      onTap: () => Get.toNamed('/edit',
          arguments: {'title': title, 'content': content, 'listid': listid}),
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 5,
        child: ListTile(
          trailing: IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "Delete List",
                  middleText: "Are you sure you want to delete this list?",
                  textCancel: "No",
                  textConfirm: "Yes",
                  confirmTextColor: MyColors.white,
                  cancelTextColor: MyColors.blue,
                  buttonColor: MyColors.blue,
                  onCancel: () {},
                  onConfirm: () async {
                    int response = await sqlDb
                        .deleteData("DELETE FROM lists WHERE id = $listid");

                    if (response > 0) {
                      Get.find<HomePageController>().removeItemFromList(listid);
                    }

                    Get.back();
                  });
            },
            icon: Icon(
              Icons.delete,
              color: MyColors.blue,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 17),
          ),
          subtitle: Text(
            content,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyColors.black),
          ),
        ),
      ),
    );
  }
}
