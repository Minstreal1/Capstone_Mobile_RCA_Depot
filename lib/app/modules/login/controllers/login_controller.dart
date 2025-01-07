import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/resource/util_common.dart';
import '../../../../app/base/base_common.dart';
import '../../../../app/routes/app_pages.dart';
import '../../../../app/service/auth.dart';

enum ValidationType { phone, email, password, name }

class LoginController extends BaseController {
  //TODO: Implement LoginController

  //TODO: Implement LoginController

  final count = 0.obs;
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  Rx<String> phoneError = ''.obs;
  Rx<String> passwordError = ''.obs;

  final visiblePassword = false.obs;

  AuthService authService = AuthService();
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

  void validationPhone() {
    if (phoneController.text.trim().isEmpty) {
      phoneError.value = 'Số điện thoại không được để trống';
      return;
    }
    if (!phoneController.text.trim().isPhoneNumber) {
      phoneError.value = 'Số điện thoại không đúng định dạng';
      return;
    }
    phoneError.value = '';
  }

  void validationPassword() {
    if (passwordController.text.trim().isEmpty) {
      passwordError.value = 'Mật khẩu không được để trống';
      return;
    }
    if (passwordController.text.length < 6) {
      passwordError.value = 'Mật khẩu tối thiểu 6 kí tự';
      return;
    }
    passwordError.value = '';
  }

  void validation({required ValidationType type}) {
    switch (type) {
      case ValidationType.phone:
        validationPhone();
        break;
      case ValidationType.password:
        validationPassword();
        break;
      default:
    }
    isEnableButton.value = (phoneError.isEmpty &&
        passwordError.isEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty);
  }

  Future<void> login() async {
    if (isEnableButton.isTrue && isLockButton.isFalse) {
      isLockButton(true);
      authService
          .login(
        username: phoneController.text,
        password: passwordController.text,
        // username: "depot13",
        // password: "123456"
      )
          .then((token) {
        BaseCommon.instance.saveToken(token).then((_) {
          if (BaseCommon.instance.accountSession!.role ==
              'ROLE_RECYCLING_DEPOT') {
            Get.toNamed(Routes.HOME);
          } else {
            UtilCommon.snackBar(
                text: 'Tài khoản không phải Depot', isFail: true);
          }
        });
      }).catchError(handleError);
    }
  }
}
