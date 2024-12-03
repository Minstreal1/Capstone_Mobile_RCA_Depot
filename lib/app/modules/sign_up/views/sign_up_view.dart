import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../app/resource/color_manager.dart';
import '/app/resource/form_field_widget.dart';
import '/app/resource/reponsive_utils.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          color: ColorsManager.primary,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: UtilsReponsive.height(80, context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(size.height * 0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back_ios_new)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Text('Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsManager.primary,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.03)),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text('Tên',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.primary,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Obx(() => FormFieldWidget(
                            padding: 20,
                            controllerEditting: controller.nameController,
                            setValueFunc: (value) {
                              controller.validationName();
                            },
                            borderColor: ColorsManager.primary,
                            radiusBorder: 15,
                            errorText: controller.nameError.value,
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                       Text('Toà nhà',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.primary,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Obx(() => FormFieldWidget(
                            padding: 20,
                            controllerEditting: controller.nameController,
                            setValueFunc: (value) {
                              controller.validationName();
                            },
                            borderColor: ColorsManager.primary,
                            radiusBorder: 15,
                            errorText: controller.nameError.value,
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text('Số điện thoại',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.primary,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Obx(() => FormFieldWidget(
                            padding: 20,
                            controllerEditting: controller.phoneController,
                            errorText: controller.phoneError.value,
                            setValueFunc: (value) {
                              controller.validationEmail();
                            },
                            borderColor: ColorsManager.primary,
                            radiusBorder: 15,
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text('Mật khẩu',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.primary,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Obx(() => FormFieldWidget(
                            errorText: controller.passwordError.value,
                            controllerEditting: controller.passwordController,
                            padding: 20,
                            setValueFunc: (value) {
                              controller.validationPassword();
                            },
                            borderColor: ColorsManager.primary,
                            isObscureText: !controller.visiblePassword.value,
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
                      GestureDetector(
                        onTap: () async {
                          Get.back();
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Bạn đã có tài khoản?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.primary),
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
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(ColorsManager.primary),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(14)),
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
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
