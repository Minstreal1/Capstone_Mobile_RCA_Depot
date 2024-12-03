import 'package:get/get.dart';
import 'package:rca_depot/app/model/payment_detail.dart';

import '../controllers/schedule_detail_controller.dart';

class ScheduleDetailBinding extends Bindings {
  @override
  void dependencies() {
      PaymentDetail schedule = Get.arguments as PaymentDetail;
    Get.lazyPut<ScheduleDetailController>(
      () => ScheduleDetailController(schedule: schedule),
    );
  }
}
