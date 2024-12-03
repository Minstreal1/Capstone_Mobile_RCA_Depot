import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
   //TODO: Implement HomeController

  final count = 0.obs;
  final isLockUpdate = true.obs;
  final isLoading = false.obs;

  final email = ''.obs;
  final error = ''.obs;
  final name = ''.obs;
  final otp = ''.obs;
  // final errorName = ''.obs;


  final isUpdateName = false.obs;
  final isUpdatePhone = false.obs;
  TextEditingController phoneController = TextEditingController(text: '');

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  @override
  Future<void> onInit() async {
    phoneController.text = '0798220222';
    nameController.text = 'Nguyễn Văn A';
    emailController.text = 'Chưa cập nhật';
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

  void setEmailData(String value) {
    if (GetUtils.isEmail(value)) {
      email(value);
      error('');
    } else {
      error('Sai định dạng email vd: abc@gmail.com');
    }
  }

  void setNameData(String value) {
    name(value);
  }

  bool validation() {
    if (name.value.isEmpty || error.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  fetchDataPersonal() async {
    // await authApi
    //     .getPersonal(idClient: BaseCommon.instance.accountSession!.clientId)
    //     .then((value) {
    //   account.value = value;
    // }).catchError((error) {
    //   isLoading(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
    // isLoading(false);
  }

  onTapEdit() {
    isLockUpdate(false);
  }

  Future pickImageFromCategory() async {
    
  }

  revertName() {
    isUpdateName.value = false;
  }

  updateName() async {
   
  }

  revertPhone() {
    isUpdatePhone.value = false;
  }

  changePhone(String code) {
    
  }


}