import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/common/widget/app_bar_custom.dart';
import 'package:rca_depot/app/model/payment_detail.dart';
import '../../../../app/model/schedule_cart.dart';
import '../../../../app/modules/tab_history/controllers/tab_history_controller.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';
import '../../../../app/resource/util_common.dart';
import '../../../../app/routes/app_pages.dart';

class TabHistoryView extends GetView<TabHistoryController> {
  const TabHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
          padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCustom(callback: Get.back, title: 'Lịch sử'),
              SizedBoxConst.size(context: context, size: 10),
              Obx(
                () => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        primary: false,
                        itemBuilder: (context, index) =>
                            _cardData(context, controller.listPayment[index]),
                        separatorBuilder: (context, index) =>
                            SizedBoxConst.size(context: context),
                        itemCount: controller.listPayment.value.length),
              )
            ],
          )),
    ));
  }

  Widget _cardData(BuildContext context, PaymentDetail payment) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SCHEDULE_DETAIL, arguments: payment);
      },
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(UtilsReponsive.height(15, context)),
              border: Border.all(color: ColorsManager.primary)),
          padding: EdgeInsets.symmetric(
              vertical: UtilsReponsive.height(10, context),
              horizontal: UtilsReponsive.height(10, context)),
          child: Row(
            children: [
              SizedBoxConst.sizeWith(context: context, size: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: ColorsManager.primary,
                        size: UtilsReponsive.height(16, context),
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                          text: UtilCommon.convertEEEDateTime(
                              payment.collectorDepotPayment!.createdAt ??
                                  DateTime.now()),
                          fontWeight: FontWeight.w500,
                          context),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Khách hàng:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        text:
                            '${payment.collectorDepotPayment!.collector?.user?.firstName} ${payment.collectorDepotPayment!.collector?.user?.lastName}',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Giá trị:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        text: '${payment.collectorDepotPayment!.amount} điểm',
                      ),
                    ],
                  ),
                ],
              ))
            ],
          )),
    );
  }
}
