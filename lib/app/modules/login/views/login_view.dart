import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/form_field_widget.dart';
import '../../../../app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: UtilsReponsive.width(20, context),
        vertical: UtilsReponsive.height(20, context),
      ),
      color: ColorsManager.primary,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: _avatar(context)),
            SizedBoxConst.size(context: context),
            Text('DEPOT'.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.03)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(size.height * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxConst.size(context: context, size: 20),
                  Text('Số điện thoại',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.primary,
                          fontSize: MediaQuery.of(context).size.height * 0.02)),
                  SizedBoxConst.size(context: context, size: 20),
                  Obx(() => FormFieldWidget(
                        padding: 20,
                        controllerEditting: controller.phoneController,
                        errorText: controller.phoneError.value,
                        setValueFunc: (value) {
                          // controller.validat2ionPhone();
                        },
                        borderColor: ColorsManager.primary,
                        radiusBorder: 15,
                      )),
                  SizedBoxConst.size(context: context, size: 20),
                  Text('Mật khẩu',
                      style: TextStyle(
                          color: ColorsManager.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.02)),
                  SizedBoxConst.size(context: context, size: 20),
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
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Get.toNamed(Routes.SIGN_UP);
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.primary),
                      ),
                    ),
                  ),
                  SizedBoxConst.size(context: context),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            WidgetStateProperty.all(ColorsManager.primary),
                        padding: WidgetStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: Obx(() => controller.isLoading.value
                          ? const CupertinoActivityIndicator(
                              color: Colors.white,
                            )
                          : Text('Đăng nhập',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02))),
                      onPressed: () async {
                        await controller.login();
                      },
                    ),
                  ),
                  SizedBoxConst.size(context: context, size: 20),
                  SizedBoxConst.size(context: context)
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }

  SizedBox _avatar(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(100, context),
      width: UtilsReponsive.height(100, context),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: UtilsReponsive.height(90, context),
        width: UtilsReponsive.height(90, context),
        padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 5),
            shape: BoxShape.circle),
        child: Image.asset(
          'assets/images/rca_logo.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
