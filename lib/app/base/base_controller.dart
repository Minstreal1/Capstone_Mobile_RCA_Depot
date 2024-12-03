import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import '/app/resource/util_common.dart';

abstract class BaseController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isFetchData = false.obs;
  Rx<bool> isFetchMore = false.obs;
  Rx<bool> isLockButton = false.obs;
  Rx<bool> isEnableButton = false.obs;

  FutureOr<Null> handleError(dynamic error) async {
    try {
      log("errApi:" + error.toString());
      isLockButton(false);
      isLoading(false);
      UtilCommon.snackBar(text: '${error.message}', isFail: true);
    } catch (e) {
      UtilCommon.snackBar(text: '$error', isFail: true);
    }
  }
}
