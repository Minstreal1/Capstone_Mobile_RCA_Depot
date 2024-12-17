import 'package:get/get.dart';

import '../controllers/google_map_autocomplete_controller.dart';

class GoogleMapAutocompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoogleMapAutocompleteController>(
      () => GoogleMapAutocompleteController(),
    );
  }
}
