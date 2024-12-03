import 'package:get/get.dart';
import '../../../../app/base/base_controller.dart';
import '../../../../app/model/schedule_cart.dart';
import '../../../../app/resource/util_common.dart';
import '../../../../app/service/main_service.dart';

class TabHomeController extends BaseController {
  //TODO: Implement TabHomeController

  final count = 0.obs;
  RxList<ScheduleCard> listSchedule = <ScheduleCard>[].obs;
  @override
  void onInit() {
    // fetchListScheduleByStatus();
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
    MainService().fetchListScheduleByStatus().then((data) {
      listSchedule(data);
    isLoading(false);

    }).catchError(handleError);
  }
  regisSchdule(int idSchedule){
     MainService().regisSchdule(idSchedule: idSchedule).then((_){
      UtilCommon.snackBar(text: 'Nhận thành công');
      fetchListScheduleByStatus();
     }).catchError(handleError);
  }
}
