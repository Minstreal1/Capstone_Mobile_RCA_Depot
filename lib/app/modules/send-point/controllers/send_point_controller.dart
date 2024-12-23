import 'dart:convert';
import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/model/account_session.dart';
import 'package:rca_depot/app/resource/util_common.dart';
import 'package:rca_depot/app/routes/app_pages.dart';
import 'package:rca_depot/app/service/main_service.dart';

class SendPointController extends BaseController {
  //TODO: Implement SendPointController

  final count = 0.obs;
  Rx<AccountSession> user = AccountSession().obs;
  TextEditingController pointNum = TextEditingController(text: '');

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

  getDataUserQr(String token) {
    try {
      final jwtToken = JWT.decode(token!);
      log(jsonEncode(jwtToken.payload));
      user.value = AccountSession.fromJson(jwtToken.payload);
    } catch (e) {
      UtilCommon.snackBar(text: 'QR không hợp lệ', isFail: true);
    }
  }

  sendPoint() {
    int point = int.tryParse(pointNum.text) ?? 0;
    if (!isLockButton.value && (point) > 0) {
      MainService().sendPoint(point: point, userId: user.value.id!).then((v) {
        Get.offAll(Routes.HOME);
        UtilCommon.snackBar(text: 'Chuyển điểm thành công');
      }).catchError(handleError);
    }
  }
}
