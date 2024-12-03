import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/resource/reponsive_utils.dart';
import '/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController

  final count = 0.obs;
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  Rx<String> nameError = ''.obs;
  Rx<String> phoneError = ''.obs;
  Rx<String> passwordError = ''.obs;

  final isLoading = false.obs;
  final visiblePassword = false.obs;

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
  //   try {
  //     if (!isLoading.value) {
  //       isLoading.value = true;
       
       
  //     }
  //   } catch (e) {
  //     print("Failed to register: $e");
  //     isLoading.value = false;
  //     if (e
  //         .toString()
  //         .contains('The email address is already in use by another account')) {
  //       phoneError('The email address is already in use by another account');
  //     } else {
  //       SnackBarCheck.snackBar(text: "Something wrong: $e", isFail: false);
  //     }
  //   }
  }
}
