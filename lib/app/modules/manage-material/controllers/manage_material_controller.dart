import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_common.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/model/depot_information.dart';
import 'package:rca_depot/app/model/material_type.dart';
import 'package:rca_depot/app/resource/util_common.dart';
import 'package:rca_depot/app/routes/app_pages.dart';
import 'package:rca_depot/app/service/main_service.dart';

class ManageMaterialController extends BaseController {
  //TODO: Implement ManageMaterialController

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

  fetchData() {
    isLoading.value = true;
    // listMaterialDataOwner.value = await MainService().fetchMissingMaterial();
    MainService()
        .fetchOwnDepot(id: BaseCommon.instance.accountSession!.id!)
        .then((val) {
      dataDepot.value = val;
      isLoading.value = false;
    });
    // log('LengMiss: ${listMaterialDataOwner.length}');
    // log('LengOwn: ${dataDepot.value.depotMaterials!.length}');
  }

  updateAll() async {
    // log(jsonEncode(dataDepot.value.depotMaterials![0]));
    waiting(true);
    MainService()
        .updateMaterial(listMaterial: dataDepot.value.depotMaterials!)
        .then((val) {
      waiting(false);
      fetchData();
      UtilCommon.snackBar(text: 'Cập nhật thành công');
    }).catchError(handleError);
  }
}
