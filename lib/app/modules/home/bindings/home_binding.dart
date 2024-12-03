import 'package:get/get.dart';
import '../../../../app/modules/tab-calendar/controllers/tab_calendar_controller.dart';
import '../../../../app/modules/tab_account/controllers/tab_account_controller.dart';
import '../../../../app/modules/tab_history/controllers/tab_history_controller.dart';
import '../../../../app/modules/tab_home/controllers/tab_home_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TabAccountController>(
      () => TabAccountController(),
    );
       Get.lazyPut<TabHistoryController>(
      () => TabHistoryController(),
    );
        Get.lazyPut<TabCalendarController>(
      () => TabCalendarController(),
    );
     Get.lazyPut<TabHomeController>(
      () => TabHomeController(),
    );
  }
}
