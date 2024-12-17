import 'package:get/get.dart';

import '../controllers/manage_material_controller.dart';

class ManageMaterialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageMaterialController>(
      () => ManageMaterialController(),
    );
  }
}
