import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/modules/google-map-autocomplete/model/data_search_model.dart';
import 'package:rca_depot/app/modules/login/controllers/login_controller.dart';
import 'package:rca_depot/app/modules/sign_up/model/payload_signup.dart';
import 'package:rca_depot/app/resource/util_common.dart';
import 'package:rca_depot/app/service/auth.dart';
import '/app/resource/reponsive_utils.dart';
import '/app/routes/app_pages.dart';

class SignUpController extends BaseController {
  //TODO: Implement SignUpController

  final count = 0.obs;
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController depotNameController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');

  Rx<String> usernameError = ''.obs;
  Rx<String> passwordError = ''.obs;
  Rx<String> emailError = ''.obs;
  Rx<String> phoneError = ''.obs;
  Rx<String> nameError = ''.obs;
  Rx<String> depotNameError = ''.obs;
  Rx<String> addressError = ''.obs;

  final isLoading = false.obs;
  final visiblePassword = false.obs;

  DataSearchModel selectedDataModel = DataSearchModel();

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

  void validationNameDepot() {
    if (depotNameController.text.trim().isEmpty) {
      depotNameError.value = 'Tên không được để trống';
      return;
    }
    depotNameError.value = '';
  }

  void validationName() {
    if (nameController.text.trim().isEmpty) {
      nameError.value = 'Tên không được để trống';
      return;
    }
    nameError.value = '';
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

  void validationEmail() {
    if (emailController.text.trim().isEmpty) {
      emailError.value = 'Email không được để trống';
      return;
    }
    if (!emailController.text.isEmail) {
      emailError.value = 'Email sai định dạng';
      return;
    }
    emailError.value = '';
  }

  void validation({required ValidationType type}) {
    switch (type) {
      case ValidationType.phone:
        validationPhone();
        break;
      case ValidationType.password:
        validationPassword();
        break;
      case ValidationType.email:
        validationEmail();
      case ValidationType.name:
        validationName();
        break;
      case ValidationType.depot:
        validationNameDepot();
        break;
      default:
    }
    isEnableButton.value = (phoneError.isEmpty &&
        passwordError.isEmpty &&
        emailError.isEmpty &&
        nameError.isEmpty &&
        depotNameError.isEmpty &&
        depotNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty);
  }

  Future<void> register() async {
    try {
      if (!isLoading.value) {
        isLoading.value = true;
        List<String> nameFull = nameController.text.split(' ');
        PayLoadSignUp payload = PayLoadSignUp(
          username: phoneController.text,
          password: passwordController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          firstName: nameFull.first,
          lastName: nameFull.sublist(1).join(' '),
          address: addressController.text,
          depotName: depotNameController.text,
          location: addressController.text,
          latitude: selectedDataModel.lat,
          longitude: selectedDataModel.lng,
        );
        AuthService().register(payload: payload).then((value) {
          Get.offAllNamed(Routes.LOGIN);
          UtilCommon.snackBar(text: 'Đăng kí thành công');
        }).catchError(handleError);
      }
    } catch (e) {
      print("Failed to register: $e");
      isLoading.value = false;
      if (e
          .toString()
          .contains('The email address is already in use by another account')) {
        phoneError('The email address is already in use by another account');
      } else {
        SnackBarCheck.snackBar(text: "Something wrong: $e", isFail: false);
      }
    }
  }
}
