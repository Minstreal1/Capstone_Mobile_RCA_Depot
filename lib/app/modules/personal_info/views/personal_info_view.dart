import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../app/common/widget/app_bar_custom.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/form_field_widget.dart';
import '../../../../app/resource/loading_widget.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';

import '../controllers/personal_info_controller.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  const PersonalInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarCustom(
                callback: () {
                  Get.back();
                },
                title: 'Cập Nhật Tài Khoản'),
            SizedBoxConst.size(context: context, size: 20),
            Expanded(
              child: Obx(() => controller.isLoading.value
                  ? Center(child: LoadingWidget())
                  : Material(
                      child: Container(
                        width: UtilsReponsive.width(
                          375,
                          context,
                        ),
                        height: UtilsReponsive.height(
                          812,
                          context,
                        ),
                        color: Colors.white,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.isLoading.value == true
                                  ? SizedBox()
                                  : SizedBox(),
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      height:
                                          UtilsReponsive.height(80, context),
                                      width: UtilsReponsive.height(80, context),
                                      decoration: BoxDecoration(
                                          color: ColorsManager.primary,
                                          shape: BoxShape.circle),
                                      // child: CachedNetworkImage(
                                      //   fit: BoxFit.fill,
                                      //   imageUrl: controller
                                      //           .account.value.avatarUrl ??
                                      //       '',
                                      //   placeholder: (context, url) =>
                                      //       const CircularProgressIndicator(
                                      //     color: Colors.white,
                                      //   ),
                                      //   errorWidget: (context, url,
                                      //           error) =>
                                      //       Image.asset(ImageAssets.logo),
                                      // ),
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          await controller
                                              .pickImageFromCategory();
                                        },
                                        child: TextConstant.subTile3(context,
                                            text: 'Thay đổi',
                                            color: Colors.blue))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 30, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person),
                                        SizedBoxConst.sizeWith(
                                            context: context, size: 5),
                                        TextConstant.subTile3(
                                          context,
                                          text: "Họ và tên",
                                        ),
                                      ],
                                    ),
                                    Obx(() => controller.isUpdatePhone.value
                                        ? SizedBox()
                                        : controller.isUpdateName.value
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        controller.revertName();
                                                      },
                                                      child: Icon(Icons.close)),
                                                  GestureDetector(
                                                      onTap: () async {
                                                        await controller
                                                            .updateName();
                                                      },
                                                      child: Icon(Icons.check))
                                                ],
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  controller.isUpdateName
                                                      .value = true;
                                                },
                                                child: Icon(Icons.edit)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 20, right: 20, left: 20),
                                child: Obx(() => FormFieldWidget(
                                      controllerEditting:
                                          controller.nameController,
                                      padding: 20,
                                      borderColor: Colors.grey,
                                      radiusBorder: 10,
                                      setValueFunc: (v) {},
                                      isEnabled: controller.isUpdateName.value,
                                    )),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 30, left: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.email),
                                    SizedBoxConst.sizeWith(
                                        context: context, size: 5),
                                    TextConstant.subTile3(
                                      context,
                                      text: "Email",
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 20, right: 20, left: 20),
                                child: FormFieldWidget(
                                  padding: 20,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  borderColor: Colors.grey,
                                  radiusBorder: 10,
                                  isEnabled: false,
                                  setValueFunc: (v) {},
                                  // initValue: ,
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 30, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.phone),
                                        SizedBoxConst.sizeWith(
                                            context: context, size: 5),
                                        TextConstant.subTile3(
                                          context,
                                          text: "Số điện thoại",
                                        ),
                                      ],
                                    ),
                                    Obx(() => controller.isUpdateName.value
                                        ? SizedBox()
                                        : controller.isUpdatePhone.value
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .revertPhone();
                                                      },
                                                      child: Icon(Icons.close)),
                                                  GestureDetector(
                                                      onTap: () async {
                                                        // await controller
                                                        //     .sendMailChangePhone();
                                                      },
                                                      child: Icon(Icons.check))
                                                ],
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  controller.isUpdatePhone
                                                      .value = true;
                                                },
                                                child: Icon(Icons.edit)))
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: UtilsReponsive.paddingOnly(context,
                                      top: 20, right: 20, left: 20),
                                  child: Obx(
                                    () => FormFieldWidget(
                                      controllerEditting:
                                          controller.phoneController,
                                      padding: 20,
                                      borderColor: Colors.grey,
                                      radiusBorder: 10,
                                      isEnabled: controller.isUpdatePhone.value,
                                      setValueFunc: (v) {},
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
