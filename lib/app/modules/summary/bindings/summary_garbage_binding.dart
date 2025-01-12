import 'package:get/get.dart';

import '../controllers/summary_garbage_controller.dart';

class SummaryGarbageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SummaryGarbageController>(
      () => SummaryGarbageController(),
    );
  }
}
