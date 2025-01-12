import 'package:get/get.dart';

import '../controllers/history_checkpoint_controller.dart';

class HistoryCheckpointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryCheckpointController>(
      () => HistoryCheckpointController(),
    );
  }
}
