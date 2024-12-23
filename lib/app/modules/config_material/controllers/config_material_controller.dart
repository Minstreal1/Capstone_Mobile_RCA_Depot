import 'dart:developer';

import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_common.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/model/depot_information.dart';
import 'package:rca_depot/app/model/material_type.dart';
import 'package:rca_depot/app/routes/app_pages.dart';
import 'package:rca_depot/app/service/main_service.dart';

class ConfigMaterialController extends BaseController {
  //TODO: Implement ConfigMaterialController

  final count = 0.obs;
  RxList<MaterialTypeData> listMaterialDataOwner = <MaterialTypeData>[].obs;
  Rx<DepotInformation> dataDepot = DepotInformation().obs;
  final isLoading = false.obs;
  final waiting = false.obs;
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
    isLoading.value = true;
    listMaterialDataOwner.value = await MainService().fetchMissingMaterial();
    dataDepot.value = await MainService()
        .fetchOwnDepot(id: BaseCommon.instance.accountSession!.id!);
    log('LengMiss: ${listMaterialDataOwner.length}');
    log('LengOwn: ${dataDepot.value.depotMaterials!.length}');
    if (listMaterialDataOwner.isNotEmpty) {}
    isLoading.value = false;
  }

  updateAll() async {
    // log('${listMaterialDataOwner[0].price}');
    waiting(true);
    MainService()
        .updateMaterial(listMaterial: listMaterialDataOwner, updateInit: true)
        .then((val) {
      waiting(false);
      Get.offAllNamed(Routes.HOME);
    }).catchError(handleError);
  }
}
