import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/resource/text_style.dart';
import 'package:rca_depot/app/resource/util_common.dart';
import 'package:rca_depot/app/routes/app_pages.dart';
import '../../../../app/resource/color_manager.dart';
import '/app/resource/form_field_widget.dart';
import '/app/resource/reponsive_utils.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          color: ColorsManager.primary,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.white)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    TextConstant.titleH2(context,
                        text: 'Đăng ký', color: Colors.white),
                  ],
                ),
                SizedBoxConst.size(context: context),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(size.height * 0.02),
                  decoration: UtilCommon.shadowBox(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConstant.subTile1(context,
                          text: 'Thông tin đăng nhập'),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile2(context,
                          text: 'Tên đăng nhập', color: ColorsManager.primary),
                      SizedBoxConst.size(context: context),
                      Obx(() => FormFieldWidget(
                            padding: 20,
                            setValueFunc: (value) {
                            },
                            borderColor: ColorsManager.primary,
                            radiusBorder: 15,
                            controllerEditting: controller.usernameController,
                            errorText: controller.usernameError.value,
                          )),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile2(context,
                          text: 'Mật khẩu', color: ColorsManager.primary),
                      SizedBoxConst.size(context: context),
                      Obx(() => FormFieldWidget(
                            padding: 20,
                            isObscureText: !controller.visiblePassword.value,
                            controllerEditting: controller.passwordController,
                            errorText: controller.passwordError.value,
                            setValueFunc: (value) {
                              controller.validationPassword();
                            },
                            borderColor: ColorsManager.primary,
                            radiusBorder: 15,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.visiblePassword.value =
                                      !controller.visiblePassword.value;
                                },
                                child: Icon(controller.visiblePassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          )),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile1(context, text: 'Thông tin cá nhân'),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile2(context,
                          text: 'Họ và tên', color: ColorsManager.primary),
                      SizedBoxConst.size(context: context),
                      Obx(() => FormFieldWidget(
                            padding: 20,
                            controllerEditting: controller.nameController,
                            errorText: controller.nameError.value,
                            setValueFunc: (value) {
                              controller.validationName();
                            },
                            borderColor: ColorsManager.primary,
                            radiusBorder: 15,
                          )),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile2(
                        context,
                        text: 'Tên đại lý',
                        color: ColorsManager.primary,
                      ),
                      SizedBoxConst.size(context: context),
                      Obx(() => FormFieldWidget(
                            padding: 20,
                            controllerEditting: controller.depotNameController,
                            errorText: controller.depotNameError.value,
                            setValueFunc: (value) {
                              controller.validationName();
                            },
                            borderColor: ColorsManager.primary,
                            radiusBorder: 15,
                          )),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile2(
                        context,
                        text: 'Số điện thoại',
                        color: ColorsManager.primary,
                      ),
                      SizedBoxConst.size(context: context),
                      Obx(() => FormFieldWidget(
                            padding: 20,
                            controllerEditting: controller.phoneController,
                            errorText: controller.phoneError.value,
                            setValueFunc: (value) {
                            },
                            borderColor: ColorsManager.primary,
                            radiusBorder: 15,
                          )),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile2(
                        context,
                        text: 'Địa chỉ',
                        color: ColorsManager.primary,
                      ),
                      SizedBoxConst.size(context: context),
                      Obx(() => GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.GOOGLE_MAP_AUTOCOMPLETE);
                        },
                        child: FormFieldWidget(
                              errorText: controller.addressError.value,
                              controllerEditting: controller.addressController,
                              padding: 20,
                              setValueFunc: (value) {
                                controller.validationPassword();
                              },
                              borderColor: ColorsManager.primary,
                              radiusBorder: 15,
                              isEnabled: false,
                              maxLine: 3,
                            ),
                      )),
                      SizedBoxConst.size(context: context),
                      GestureDetector(
                        onTap: () async {
                          Get.back();
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextConstant.subTile3(
                            context,
                            text: "Bạn đã có tài khoản?",
                            color: ColorsManager.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: context.width),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.all(
                                ColorsManager.primary),
                            padding:
                                WidgetStateProperty.all(EdgeInsets.all(14)),
                          ),
                          child: Obx(() => controller.isLoading.value
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                              : Text('Đăng ký',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02))),
                          onPressed: () async {
                            await controller.register();
                          },
                        ),
                      ),
                      SizedBoxConst.size(context: context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
