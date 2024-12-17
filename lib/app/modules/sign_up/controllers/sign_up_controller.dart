import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/modules/google-map-autocomplete/model/data_search_model.dart';
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

  void validationName() {
    if (nameController.text.trim().isEmpty) {
      nameError.value = 'Name can not blank';
      log('s');
      return;
    }
    nameError.value = '';
  }

  void validationEmail() {
    if (phoneController.text.trim().isEmpty) {
      phoneError.value = 'Email can not blank';
      return;
    }
    if (!phoneController.text.trim().isEmail) {
      phoneError.value = 'Email wrong format';
      return;
    }
    phoneError.value = '';
  }

  void validationPassword() {
    if (passwordController.text.trim().isEmpty) {
      passwordError.value = 'Password can not blank';
      return;
    }
    passwordError.value = '';
  }

  Future<void> register() async {
    try {
      if (!isLoading.value) {
        isLoading.value = true;
        PayLoadSignUp payload = PayLoadSignUp(
          username: usernameController.text,
          password: passwordController.text,
          email: '${usernameController}@gmail.com',
          phoneNumber: phoneController.text,
          firstName: nameController.text.split(' ')[0],
          lastName: nameController.text.split(' ')[1],
          address: addressController.text,
          depotName: depotNameController.text,
          location: addressController.text,
          latitude: selectedDataModel.lat,
          longitude: selectedDataModel.lng,
        );
        AuthService().register(payload: payload).then((value){
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
