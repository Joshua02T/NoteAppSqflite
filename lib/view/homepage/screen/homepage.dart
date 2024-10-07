import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_list/constants/colors/colors.dart';
import 'package:homework_list/constants/components/hbcard.dart';
import 'package:homework_list/view/homepage/controller/hpcontroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        backgroundColor: MyColors.blue,
        child: Icon(
          Icons.add,
          color: MyColors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(title: const Text('Homework Lists')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: MyColors.blue,
            ),
          );
        } else {
          if (controller.homeworkList.isEmpty) {
            return const Center(
              child: Text(
                'No Homework lists!',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.homeworkList.length,
            itemBuilder: (context, i) {
              return CustomCard(
                title: controller.homeworkList[i]['title'],
                content: controller.homeworkList[i]['content'],
                listid: controller.homeworkList[i]['id'],
              );
            },
          );
        }
      }),
    );
  }
}
