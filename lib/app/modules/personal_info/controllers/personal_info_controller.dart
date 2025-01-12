import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/base/base_controller.dart';
import '/app/modules/personal_info/model/user_information.dart';
import '/app/resource/util_common.dart';
import '/app/service/main_service.dart';

class PersonalInfoController extends BaseController {
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

  late UserInformation user;

  @override
  Future<void> onInit() async {
    fetchDataPersonal();
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
    await MainService().getPersonal().then((value) {
      user = value;
      prepareData();
    }).catchError(handleError);
    isLoading(false);
  }

  prepareData() {
    phoneController.text = user.phoneNumber!;
    nameController.text = '${user.firstName} ${user.lastName}';
    emailController.text = user.email!;
  }

  onTapEdit() {
    isLockUpdate(false);
  }

  updateInformation() {
    isLockUpdate.value = true;
    List<String> nameFull = nameController.text.split(' ');
    MainService()
        .updateInformation(
            firstName: nameFull.first, lastName: nameFull.sublist(1).join(' '))
        .then((v) {
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      fetchDataPersonal();
    });
  }
}
