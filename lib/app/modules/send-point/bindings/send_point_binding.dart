import 'package:get/get.dart';

import '../controllers/send_point_controller.dart';

class SendPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendPointController>(
      () => SendPointController(),
    );
  }
}
