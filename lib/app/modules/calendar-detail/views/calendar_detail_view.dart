import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/modules/calendar-detail/views/qr_code.dart';
import '../../../../app/base/base_view.dart';
import '../../../../app/common/widget/app_bar_custom.dart';
import '../../../../app/model/material_type.dart';
import '../../../../app/modules/models/item_collected.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/form_field_widget.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';

import '../controllers/calendar_detail_controller.dart';

class CalendarDetailView extends BaseView<CalendarDetailController> {
  const CalendarDetailView({super.key});
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: context.width),
            child: ElevatedButton(
              onPressed: () {
                controller.createQrPayment();
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(ColorsManager.primary),
                padding: WidgetStateProperty.all(EdgeInsets.all(14)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextConstant.subTile2(
                    context,
                    text: 'Tạo QR Code',
                  ),
                   TextConstant.subTile2(
                    context,
                    text: 'Tổng: ${controller.sumData.value.toPrecision(2)}',
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ],
              ),
            )),
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
                    title: 'Chi tiết'),
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
                                  Get.to(()=> QrView());
                                },
                                child: Icon(Icons.qr_code))
                        ],
                      ),
                      SizedBoxConst.size(context: context),
                      Obx(()=> Visibility(
                          visible: controller.user.value.id!=null,
                          child: Column(
                          children: [
                            Row(
                          children: [
                            TextConstant.subTile3(context,
                                text: 'Khách hàng', fontWeight: FontWeight.w500),
                            SizedBoxConst.sizeWith(context: context),
                            TextConstant.subTile3(context, text: '${controller.user.value.firstName} ${controller.user.value.lastName}'),
                          ],
                        ),
                        SizedBoxConst.size(context: context, size: 5),
                        Row(
                          children: [
                            TextConstant.subTile3(context,
                                text: 'Email',
                                fontWeight: FontWeight.w500),
                            SizedBoxConst.sizeWith(context: context),
                            TextConstant.subTile3(context, text: '${controller.user.value.email}'),
                          ],
                        ),
                          ],
                        )),
                      )
                    ],
                  ),
                ),
                SizedBoxConst.size(context: context),
                TextConstant.subTile2(context, text: 'Thông tin thu gom'),
                Row(
                  children: [
                    Obx(
                      () => Expanded(
                        child: DropdownButton<MaterialTypeData>(
                          value: controller.selectedDropdown.value,
                          onChanged: (MaterialTypeData? newValue) {
                            controller.selectedDropdown.value = newValue!;
                          },
                          items: controller.listMaterialType.value
                              .map<DropdownMenuItem<MaterialTypeData>>(
                                  (MaterialTypeData value) {
                            return DropdownMenuItem<MaterialTypeData>(
                              value: value,
                              child: Text(value.name!),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          controller
                              .addNewItem(controller.selectedDropdown.value);
                        },
                        child: Icon(Icons.add))
                  ],
                ),
                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.listItemAdd.value.length,
                    separatorBuilder: (context, index) =>
                        SizedBoxConst.size(context: context),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                              TextConstant.subTile2(context,
                                  text: controller.listItemAdd[index].name!),
                              TextConstant.subTile3(context,
                                  text:
                                      '1kg = ${controller.listItemAdd[index].price} điểm',
                                  fontWeight: FontWeight.w500),
                                                          ],
                                                        ),
                                                         GestureDetector(
                              onTap: () {
                                controller
                                    .removeItem(controller.listItemAdd[index]);
                              },
                              child: Icon(Icons.close))
                            ],
                          ),
                          SizedBoxConst.size(context: context),
                          FormFieldWidget(
                            padding: 5,
                            setValueFunc: (value) {
                              controller.listItemAdd[index].weight =
                                  double.tryParse(value) ?? 0;
                              controller.calculation();
                            },
                            borderColor: Colors.black,
                            radiusBorder: 16,
                          ),
                          SizedBoxConst.sizeWith(context: context),
                         
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
