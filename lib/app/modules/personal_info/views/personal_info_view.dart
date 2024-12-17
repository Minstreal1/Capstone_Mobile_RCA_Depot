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
                  ? const Center(child: LoadingWidget())
                  : Container(
                      width: UtilsReponsive.width(375, context),
                      height: UtilsReponsive.height(812, context),
                      padding: UtilsReponsive.paddingAll(context),
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
                                    height: UtilsReponsive.height(80, context),
                                    width: UtilsReponsive.height(80, context),
                                    decoration: BoxDecoration(
                                        color: ColorsManager.primary,
                                        shape: BoxShape.circle),
                                   
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        await controller
                                            .pickImageFromCategory();
                                      },
                                      child: TextConstant.subTile3(context,
                                          text: 'Thay đổi', color: Colors.blue))
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: ColorsManager.primary,
                                ),
                                SizedBoxConst.sizeWith(
                                    context: context, size: 5),
                                TextConstant.subTile3(context,
                                    text: "Họ và tên",
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                            SizedBoxConst.size(context: context),
                            FormFieldWidget(
                              controllerEditting: controller.nameController,
                              padding: 20,
                              borderColor: Colors.grey,
                              radiusBorder: 10,
                              setValueFunc: (v) {},
                              // isEnabled: controller.isUpdateName.value,
                            ),
                            SizedBoxConst.size(context: context),
                            Row(
                              children: [
                                Icon(Icons.email, color: ColorsManager.primary,),
                                SizedBoxConst.sizeWith(
                                    context: context, size: 5),
                                TextConstant.subTile3(
                                  context,
                                  text: "Email",
                                  fontWeight: FontWeight.bold
                                ),
                              ],
                            ),
                            SizedBoxConst.size(context: context),
                            FormFieldWidget(
                              padding: 20,
                              fillColor: Colors.grey.withOpacity(0.3),
                              borderColor: Colors.grey,
                              radiusBorder: 10,
                              isEnabled: false,
                              setValueFunc: (v) {},
                              // initValue: ,
                            ),
                            SizedBoxConst.size(context: context),
                            Row(
                              children: [
                                Icon(Icons.phone, color: ColorsManager.primary,),
                                SizedBoxConst.sizeWith(
                                    context: context, size: 5),
                                TextConstant.subTile3(
                                  context,
                                  text: "Số điện thoại",
                                  fontWeight: FontWeight.bold
                                ),
                              ],
                            ),
                            SizedBoxConst.size(context: context),
                            FormFieldWidget(
                              controllerEditting: controller.phoneController,
                              padding: 20,
                              borderColor: Colors.grey,
                              radiusBorder: 10,
                              setValueFunc: (v) {},
                            ),
                          ],
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
