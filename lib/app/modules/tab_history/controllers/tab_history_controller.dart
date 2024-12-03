import 'package:get/get.dart';
import 'package:rca_depot/app/model/payment_detail.dart';
import '../../../../app/base/base_controller.dart';
import '../../../../app/model/schedule_cart.dart';
import '../../../../app/service/main_service.dart';

class TabHistoryController extends BaseController {
  //TODO: Implement TabCalendarController

  RxList<PaymentDetail> listPayment = <PaymentDetail>[].obs;
  @override
  void onInit() {
    fetchListScheduleByStatus();
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

  fetchListScheduleByStatus() {
    isLoading(true);
    MainService().fetchListPayment().then((data) {
      listPayment(data);
      listPayment.value.reversed;
      isLoading(false);
    }).catchError(handleError);
  }
}

