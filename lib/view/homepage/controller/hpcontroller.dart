import 'package:get/get.dart';

import 'package:homework_list/sql/sqfdb.dart';

class HomePageController extends GetxController {
  SqlDb sqldb = SqlDb();
  RxBool isLoading = false.obs;
  var homeworkList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    List<Map<String, dynamic>> response =
        await sqldb.readData("SELECT * FROM 'lists'");

    homeworkList.assignAll(response);
    isLoading.value = false;
  }

  void removeItemFromList(int id) {
    homeworkList.removeWhere((item) => item['id'] == id);
  }

  void updateItemInList(int id, String newTitle, String newContent) {
    int index = homeworkList.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      Map<String, dynamic> updatedItem = {
        'id': id,
        'title': newTitle,
        'content': newContent,
      };

      homeworkList[index] = updatedItem;
      homeworkList.refresh();
    }
  }
}
