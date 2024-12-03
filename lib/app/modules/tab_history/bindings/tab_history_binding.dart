import 'package:get/get.dart';

import '../controllers/tab_history_controller.dart';

class TabHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabHistoryController>(
      () => TabHistoryController(),
    );
  }
}
