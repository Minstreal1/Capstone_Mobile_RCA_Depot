import 'package:get/get.dart';

import '../controllers/calendar_detail_controller.dart';

class CalendarDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarDetailController>(
      () => CalendarDetailController( ),
    );
  }
}
