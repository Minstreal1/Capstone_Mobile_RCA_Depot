import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/modules/tab-calendar/controllers/tab_calendar_controller.dart';
import '../../../../app/modules/tab-calendar/views/tab_calendar_view.dart';
import '../../../../app/modules/tab_account/views/tab_account_view.dart';
import '../../../../app/modules/tab_history/controllers/tab_history_controller.dart';
import '../../../../app/modules/tab_history/views/tab_history_view.dart';
import '../../../../app/modules/tab_home/controllers/tab_home_controller.dart';
import '../../../../app/modules/tab_home/views/tab_home_view.dart';

class HomeController extends GetxController {
  RxList<Widget> body = RxList([
    TabHomeView(),
    TabAccountView()
  ]);
  final indexSelected = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTapped(int index) async {
    switch (index) {
      case 0:
        Get.find<TabHomeController>().fetchListScheduleByStatus();
        indexSelected(0);
        break;
      case 1:
        indexSelected(1);
        break;
      default:
    }
  }
  onTapMainButton()async{
  
  }

}
