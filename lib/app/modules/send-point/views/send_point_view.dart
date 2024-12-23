import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/common/widget/app_bar_custom.dart';
import 'package:rca_depot/app/modules/send-point/views/qr_code.dart';
import 'package:rca_depot/app/resource/color_manager.dart';
import 'package:rca_depot/app/resource/form_field_widget.dart';
import 'package:rca_depot/app/resource/reponsive_utils.dart';
import 'package:rca_depot/app/resource/text_style.dart';

import '../controllers/send_point_controller.dart';

class SendPointView extends GetView<SendPointController> {
  const SendPointView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:
      body: SafeArea(
          child: SingleChildScrollView(
              padding: UtilsReponsive.paddingAll(context),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarCustom(
                        callback: () {
                          Get.back();
                        },
                        title: 'Chuyển điểm'),
                    SizedBoxConst.size(context: context),
                    Container(
                      padding: UtilsReponsive.paddingAll(context),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextConstant.subTile3(context,
                                  text: 'THÔNG TIN KHÁCH HÀNG',
                                  fontWeight: FontWeight.w500),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => QrViewSendPoint());
                                  },
                                  child: Icon(Icons.qr_code))
                            ],
                          ),
                          SizedBoxConst.size(context: context),
                          Obx(
                            () => Visibility(
                                visible: controller.user.value.id != null,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        TextConstant.subTile3(context,
                                            text: 'Khách hàng',
                                            fontWeight: FontWeight.w500),
                                        SizedBoxConst.sizeWith(
                                            context: context),
                                        TextConstant.subTile3(context,
                                            text:
                                                '${controller.user.value.firstName} ${controller.user.value.lastName}'),
                                      ],
                                    ),
                                    SizedBoxConst.size(
                                        context: context, size: 5),
                                    Row(
                                      children: [
                                        TextConstant.subTile3(context,
                                            text: 'Email',
                                            fontWeight: FontWeight.w500),
                                        SizedBoxConst.sizeWith(
                                            context: context),
                                        TextConstant.subTile3(context,
                                            text:
                                                '${controller.user.value.email}'),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                          SizedBoxConst.size(context: context),
                        ],
                      ),
                    ),
                    SizedBoxConst.size(context: context),
                    TextConstant.subTile3(context, text: 'Số điểm cần chuyển'),
                    SizedBoxConst.size(context: context),
                    FormFieldWidget(
                      padding: 5,
                      controllerEditting: controller.pointNum,
                      setValueFunc: (value) {},
                      textInputType: TextInputType.number,
                      borderColor: Colors.black,
                      radiusBorder: 16,
                    ),
                    SizedBoxConst.size(context: context),
                    Obx(
                      () => ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: context.width),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.sendPoint();
                            },
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
                            child: controller.isLockButton.value
                                ? CupertinoActivityIndicator()
                                : TextConstant.subTile2(
                                    context,
                                    text: 'Xác nhận',
                                  ),
                          )),
                    ),
                  ]))),
    );
  }
}
