import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/common/widget/app_bar_custom.dart';
import '/app/resource/assets_manager.dart';
import '/app/resource/color_manager.dart';
import '/app/resource/form_field_widget.dart';
import '/app/resource/loading_widget.dart';
import '/app/resource/reponsive_utils.dart';
import '/app/resource/text_style.dart';

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
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Image.asset(ImageAssets.logo),
                                    ),
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
                                      fillColor: controller.isLockUpdate.value
                                          ? Colors.grey.withOpacity(0.3)
                                          : Colors.white,
                                      radiusBorder: 10,
                                      setValueFunc: (v) {},
                                      isEnabled: !controller.isLockUpdate.value,
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
                                  controllerEditting:
                                      controller.emailController,
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 20, right: 20, left: 20),
                                child: FormFieldWidget(
                                  controllerEditting:
                                      controller.phoneController,
                                  padding: 20,
                                  borderColor: Colors.grey,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  radiusBorder: 10,
                                  isEnabled: false,
                                  setValueFunc: (v) {},
                                ),
                              ),
                              Obx(() => controller.isLockUpdate.value
                                  ? _buttonOpenEdit(context)
                                  : Row(
                                      children: [
                                        Expanded(child: _buttonCancel(context)),
                                        Expanded(child: _buttonConfirm(context))
                                      ],
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

  Padding _buttonCancel(BuildContext context) {
    return Padding(
      padding: UtilsReponsive.paddingOnly(context,
          top: 50, left: 20, right: 20, bottom: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: UtilsReponsive.paddingOnly(context, top: 15, bottom: 15),
        ),

        // ignore: sort_child_properties_last
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Huỷ bỏ',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: UtilsReponsive.formatFontSize(13, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          controller.isLockUpdate.value = true;
        },
      ),
    );
  }

  Padding _buttonOpenEdit(BuildContext context) {
    return Padding(
      padding: UtilsReponsive.paddingOnly(context,
          top: 50, left: 20, right: 20, bottom: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: UtilsReponsive.paddingOnly(context, top: 15, bottom: 15),
        ),

        // ignore: sort_child_properties_last
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Chỉnh sửa',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: UtilsReponsive.formatFontSize(13, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          controller.isLockUpdate.value = false;
        },
      ),
    );
  }

  Padding _buttonConfirm(BuildContext context) {
    return Padding(
      padding: UtilsReponsive.paddingOnly(context,
          top: 50, left: 20, right: 20, bottom: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: UtilsReponsive.paddingOnly(context, top: 15, bottom: 15),
        ),

        // ignore: sort_child_properties_last
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Cập nhật',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: UtilsReponsive.formatFontSize(13, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          controller.updateInformation();
          controller.isLockUpdate.value = true;
        },
      ),
    );
  }
}
