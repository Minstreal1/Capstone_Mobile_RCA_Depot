import 'package:get/get.dart';

import '../controllers/check_point_controller.dart';

class CheckPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckPointController>(
      () => CheckPointController(),
    );
  }
}
