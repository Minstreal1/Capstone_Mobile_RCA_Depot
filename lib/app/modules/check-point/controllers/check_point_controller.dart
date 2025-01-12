import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/base/base_controller.dart';
import '/app/model/voucher.dart';
import '/app/modules/check-point/model/draw_money.dart';
import '/app/resource/util_common.dart';
import '/app/routes/app_pages.dart';
import '/app/service/main_service.dart';

class CheckPointController extends BaseController {
  //TODO: Implement CheckPointController

  final count = 0.obs;
  final isMoney = true.obs;

  Rx<double> point = 0.0.obs;
  Rx<double> price = 0.0.obs;

  TextEditingController numberBankController = TextEditingController(text: '');
  TextEditingController nameBankController = TextEditingController(text: '');
  TextEditingController ownerBankController = TextEditingController(text: '');

  TextEditingController numPointController = TextEditingController(text: '');
  RxList<Voucher> listVoucher = <Voucher>[].obs;

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
    MainService().fetchPoint().then((v) {
      point(v);
    }).catchError(handleError);
    MainService().getVoucher().then((v) {
      listVoucher(v);
    }).catchError(handleError);
  }

  updatePrice() {
    price.value = (double.tryParse(numPointController.text) ?? 0) * 1000.0;
  }

  createFormWithDraw() {
    double numPoint = double.tryParse(numPointController.text) ?? 0;
    String nameBank = nameBankController.text;
    String numBank = numberBankController.text;
    String ownerBank = ownerBankController.text;
    if (numPoint <= point.value) {
      DrawMoneyPayload payload = DrawMoneyPayload(
          numberPoint: numPoint,
          bankName: nameBank,
          bankAccountName: ownerBank,
          bankAccountNumber: numBank);
      MainService().createWithDrawMoney(payload: payload).then((v) {
        UtilCommon.snackBar(text: 'Tạo đơn thành công');
      }).catchError(handleError);
    } else {
      UtilCommon.snackBar(text: 'Số tiền không đủ', isFail: true);
    }
  }

  takeVoucher(int id) {
    MainService().takeVoucher(id: id).then((v) {
      UtilCommon.snackBar(text: 'Đổi thành công');
      Get.toNamed(Routes.MY_VOUCHER);
    }).catchError(handleError);
  }
}
