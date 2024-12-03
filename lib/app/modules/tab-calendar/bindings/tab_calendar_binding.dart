import 'package:get/get.dart';

import '../controllers/tab_calendar_controller.dart';

class TabCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabCalendarController>(
      () => TabCalendarController(),
    );
  }
}
