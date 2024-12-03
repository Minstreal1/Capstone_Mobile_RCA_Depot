import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/model/payment_detail.dart';
import 'package:rca_depot/app/service/main_service.dart';

class ScheduleDetailController extends BaseController {
  //TODO: Implement ScheduleDetailController
  ScheduleDetailController({required this.schedule});
  final count = 0.obs;
  PaymentDetail schedule;
  MainService service = MainService();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  
}
