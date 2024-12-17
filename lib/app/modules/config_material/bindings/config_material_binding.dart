import 'package:get/get.dart';

import '../controllers/config_material_controller.dart';

class ConfigMaterialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfigMaterialController>(
      () => ConfigMaterialController(),
    );
  }
}
