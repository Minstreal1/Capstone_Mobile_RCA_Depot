import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../app/base/base_controller.dart';
import '../../../../app/model/schedule_cart.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/service/main_service.dart';

class TabCalendarController extends BaseController {
  //TODO: Implement TabCalendarController

  RxList<ScheduleCard> listSchedule = <ScheduleCard>[].obs;
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
    MainService().fetchListScheduleByStatusByUser(status: 'ACCEPTED').then((data) {
      listSchedule(data);
      listSchedule.value.reversed;
      isLoading(false);
    }).catchError(handleError);
  }
}
