import 'dart:developer';

import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_common.dart';
import 'package:rca_depot/app/model/depot_information.dart';
import 'package:rca_depot/app/model/material_type.dart';
import 'package:rca_depot/app/routes/app_pages.dart';
import '../../../../app/base/base_controller.dart';
import '../../../../app/model/schedule_cart.dart';
import '../../../../app/resource/util_common.dart';
import '../../../../app/service/main_service.dart';

class TabHomeController extends BaseController {
  //TODO: Implement TabHomeController

  final count = 0.obs;
  RxList<ScheduleCard> listSchedule = <ScheduleCard>[].obs;
  RxList<MaterialTypeData> listMaterialSystem = <MaterialTypeData>[].obs;
  RxList<MaterialTypeData> listMaterialDataOwner = <MaterialTypeData>[].obs;
  Rx<DepotInformation> dataDepot = DepotInformation().obs;
  @override
  void onInit() {
    fetchData();
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

  fetchData() async {
    listMaterialDataOwner.value = await MainService().fetchMissingMaterial();
    dataDepot.value = await MainService()
        .fetchOwnDepot(id: BaseCommon.instance.accountSession!.id!);
    log('LengMiss: ${listMaterialDataOwner.length}');
    log('LengOwn: ${dataDepot.value.depotMaterials!.length}');
    if (listMaterialDataOwner.isNotEmpty) {
      Get.toNamed(Routes.CONFIG_MATERIAL);
    }
  }
}
