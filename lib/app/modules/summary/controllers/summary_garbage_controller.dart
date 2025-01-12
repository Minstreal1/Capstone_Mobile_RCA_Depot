import 'package:get/get.dart';
import 'package:rca_depot/app/modules/summary/model/summary_dashboard.dart';
import '/app/base/base_controller.dart';
import '/app/service/main_service.dart';

class SummaryGarbageController extends BaseController {
  //TODO: Implement SummaryGarbageController

  final count = 0.obs;
  Rx<SummaryDashBoard> data = SummaryDashBoard().obs;
  final total = 0.0.obs;
  @override
  void onInit() {
    fetchDashBoard();
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

  fetchDashBoard() {
    if (!isLoading.value) {
      isLoading(true);
      MainService().fetchDashBoard().then((v) {
        data(v);
        v.dataAnalyze!.forEach((e)=>total.value+=e.totalWeight!);
        isLoading(false);
      }).catchError(handleError);
    }
  }
}
