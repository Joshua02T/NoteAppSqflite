import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:homework_list/view/addscreen/screen/add.dart';
import 'package:homework_list/view/editscreen/screen/editlist.dart';
import 'package:homework_list/view/homepage/screen/homepage.dart';

class Routes {
  static const String add = '/add';
  static const String edit = '/edit';
  static const String homepage = '/homepage';

  static final List<GetPage> pages = [
    GetPage(name: '/homepage', page: () => const HomePage()),
    GetPage(name: '/add', page: () => const AddList()),
    GetPage(name: '/edit', page: () => const EditList())
  ];
}
