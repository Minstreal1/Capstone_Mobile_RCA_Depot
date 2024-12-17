import 'dart:convert';
import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rca_depot/app/base/base_common.dart';
import 'package:rca_depot/app/model/account_session.dart';
import '../../../../app/base/base_controller.dart';
import '../../../../app/model/create_payment_payload.dart';
import '../../../../app/model/material_type.dart';
import '../../../../app/model/schedule_cart.dart';
import '../../../../app/modules/models/item_collected.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';
import '../../../../app/resource/util_common.dart';
import '../../../../app/routes/app_pages.dart';
import '../../../../app/service/main_service.dart';

class CalendarDetailController extends BaseController {
  //TODO: Implement CalendarDetailController
  final count = 0.obs;

  Rx<MaterialTypeData> selectedDropdown = MaterialTypeData().obs;
  RxList<MaterialTypeData> listItemAdd = <MaterialTypeData>[].obs;
  MainService mainService = MainService();
  RxList<MaterialTypeData> listMaterialType = <MaterialTypeData>[].obs;

  Rx<double> sumData = 0.0.obs;
  Rx<AccountSession> user = AccountSession().obs;
  @override
  void onInit() {
    fetchListMaterial();

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

  fetchListMaterial() {
    mainService.fetchOwnDepot(id:BaseCommon.instance.accountSession!.id!).then((dataDepot) {
      listMaterialType(dataDepot.depotMaterials);
      selectedDropdown.value = listMaterialType[0];
    }).catchError(handleError);
   
  }

  addNewItem(MaterialTypeData value) {
    MaterialTypeData? item =
        listItemAdd.value.firstWhereOrNull((item) => item.id == value.id);
    // log(item?.id ?? 'hihi');
    if (item != null) {
      SnackBarCheck.snackBar(text: 'Không được thêm trùng loại', isFail: true);
    } else {
      listItemAdd.add(value);
    }
    calculation();
  }

  removeItem(MaterialTypeData value) {
    MaterialTypeData? item =
        listItemAdd.value.firstWhereOrNull((item) => item.id == value.id);
    if (item != null) {
      listItemAdd.remove(item);
    }
    calculation();
  }

  calculation() {
    sumData(0);
    listItemAdd.forEach((e) {
      sumData += e.weight! * e.price!;
    });
  }

  createQrPayment() {
    CreatePaymentPayload payload = CreatePaymentPayload();
    payload.collectorId = user.value.id;
    payload.materials = listItemAdd.value;
    mainService.createQrPayment(payload: payload).then((value) {
      Get.bottomSheet(
        Container(
          height: UtilsReponsive.height(400, Get.context!),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft:
                    Radius.circular(UtilsReponsive.height(15, Get.context!)),
                topRight:
                    Radius.circular(UtilsReponsive.height(15, Get.context!)),
              ),
              color: Colors.white),
          child: Column(
            children: [
              TextConstant.subTile2(Get.context!,
                  text: 'Mã thanh toán: $value'),
              TextConstant.subTile2(Get.context!, text: 'Tổng cộng: $sumData'),
              QrImageView(
                data: value.toString(),
                version: QrVersions.auto,
                size: 200.0,
              ),
              ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: Get.context!.width),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.HOME);
                    },
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all(ColorsManager.primary),
                      padding: WidgetStateProperty.all(EdgeInsets.all(14)),
                    ),
                    child: TextConstant.subTile2(
                      Get.context!,
                      text: 'Xác nhận đã thanh toán',
                    ),
                  )),
            ],
          ),
        ),
        isDismissible: false,
      );
      log('Id $value');
    }).catchError(handleError);
  }

  getDataUserQr(String token) {
   try {
      final jwtToken = JWT.decode(token!);
    log(jsonEncode(jwtToken.payload));
    user.value = AccountSession.fromJson(jwtToken.payload);
   } catch (e) {
     UtilCommon.snackBar(text: 'QR không hợp lệ',isFail: true);
   }
  }
}
