import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/resource/assets_manager.dart';
import '/app/resource/color_manager.dart';
import '/app/resource/form_field_widget.dart';
import '/app/resource/reponsive_utils.dart';
import '/app/resource/text_style.dart';
import '/app/resource/util_common.dart';
import '/app/routes/app_pages.dart';

import '../controllers/check_point_controller.dart';

class CheckPointView extends GetView<CheckPointController> {
  const CheckPointView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Đổi điểm'),
          centerTitle: true,
          actions: [
            Obx(() => controller.isMoney.value
                ? GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.HISTORY_CHECKPOINT);
                    },
                    child: Icon(Icons.history))
                : GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.MY_VOUCHER);
                    },
                    child: TextConstant.subTile3(context,
                        text: 'Mã của tôi',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)))
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextConstant.titleH2(context,
                      text: 'Điểm:', fontWeight: FontWeight.w600),
                  SizedBoxConst.sizeWith(context: context),
                  Obx(
                    () => TextConstant.titleH2(context,
                        text: '${controller.point.value}',
                        color: ColorsManager.primary),
                  ),
                ],
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              backgroundColor: WidgetStateProperty.all(
                                  controller.isMoney.value
                                      ? ColorsManager.primary
                                      : Colors.grey),
                              padding: WidgetStateProperty.all(
                                  const EdgeInsets.all(5))),
                          child: TextConstant.subTile2(context,
                              text: 'Đổi tiền',
                              color: controller.isMoney.value
                                  ? Colors.white
                                  : Colors.black),
                          onPressed: () async {
                            controller.isMoney.value = true;
                          }),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              backgroundColor: WidgetStateProperty.all(
                                  !controller.isMoney.value
                                      ? ColorsManager.primary
                                      : Colors.grey),
                              padding: WidgetStateProperty.all(
                                  const EdgeInsets.all(5))),
                          child: TextConstant.subTile2(context,
                              text: 'Đổi mã giảm giá',
                              color: !controller.isMoney.value
                                  ? Colors.white
                                  : Colors.black),
                          onPressed: () async {
                            controller.isMoney.value = false;
                          }),
                    ),
                  ],
                ),
              ),
              SizedBoxConst.size(context: context, size: 20),
              Obx(() => controller.isMoney.value
                  ? _bodyChangeMoney(context)
                  : ListView.separated(
                      itemCount: controller.listVoucher.value.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          SizedBoxConst.size(context: context),
                      itemBuilder: (context, index) => Container(
                        padding: UtilsReponsive.paddingAll(context, padding: 5),
                        clipBehavior: Clip.antiAlias,
                        height: UtilsReponsive.height(80, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorsManager.primary),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: UtilsReponsive.height(80, context),
                              height: UtilsReponsive.height(80, context),
                              decoration: UtilCommon.shadowBox(context),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: '',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(ImageAssets.logo),
                              ),
                            ),
                            SizedBoxConst.sizeWith(context: context),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                        children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${controller.listVoucher[index].name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: const Color(0xff979797),
                                                fontSize: UtilsReponsive.height(
                                                    14, context)),
                                      ),
                                      TextSpan(
                                        text:
                                            '  ${controller.listVoucher[index].pointToRedeem!.toInt()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: UtilsReponsive.height(
                                                    14, context)),
                                      ),
                                    ])),
                                TextConstant.subTile3(context,
                                    text:
                                        '${controller.listVoucher[index].description}',
                                    fontWeight: FontWeight.w500),
                                SizedBoxConst.size(context: context),
                                GestureDetector(
                                  onTap: () {
                                    controller.takeVoucher(controller.listVoucher[index].voucherId!);
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: TextConstant.subTile3(context,
                                        text: 'Đổi', color: Colors.blue),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ))
            ],
          ),
        ));
  }

  Column _bodyChangeMoney(BuildContext context) {
    return Column(
      children: [
        _componentInput(
            context, 'Số tài khoản', controller.numberBankController),
        SizedBoxConst.size(
          context: context,
        ),
        _componentInput(
            context, 'Tên ngân hàng', controller.nameBankController),
        SizedBoxConst.size(
          context: context,
        ),
        _componentInput(
            context, 'Số điểm chuyển', controller.numPointController),
        SizedBoxConst.size(
          context: context,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextConstant.subTile1(context, text: 'Số tiền quy đổi'),
            Obx(
              () => TextConstant.subTile1(context,
                  text: '${controller.price.value} VNĐ',
                  color: ColorsManager.primary),
            ),
          ],
        ),
        SizedBoxConst.size(context: context, size: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor:
                      WidgetStateProperty.all(ColorsManager.primary),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(14))),
              child: TextConstant.subTile2(context,
                  text: 'Xác nhận đổi điểm', color: Colors.white),
              onPressed: () async {
                controller.createFormWithDraw();
              }),
        )
      ],
    );
  }

  Column _componentInput(
      BuildContext context, String text, TextEditingController controllerE) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextConstant.subTile3(context, text: text),
        SizedBoxConst.size(
          context: context,
        ),
        FormFieldWidget(
            controllerEditting: controllerE,
            padding: 15,
            radiusBorder: 15,
            borderColor: Colors.grey,
            setValueFunc: (value) {
              controller.updatePrice();
            })
      ],
    );
  }
}
