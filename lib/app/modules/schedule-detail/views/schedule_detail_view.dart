import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';

import '../controllers/schedule_detail_controller.dart';

class ScheduleDetailView extends GetView<ScheduleDetailController> {
  const ScheduleDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.count;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin chi tiết'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextConstant.subTile1(context,
                          text: 'Thông tin chung',
                          color: ColorsManager.primary),
                      Container(
                        height: 2,
                        width: UtilsReponsive.width(150, context),
                        color: ColorsManager.primary,
                      ),
                      SizedBoxConst.size(context: context),
                      _textData(context,
                          title: 'Khách hàng:',
                          content:
                          '${controller.schedule.collectorDepotPayment?.collector?.user?.firstName} ${controller.schedule.collectorDepotPayment?.collector?.user?.lastName}'),
                          // ''),
                              // '${controller.dataDetail.value.residentId!.user!.firstName} ${controller.dataDetail.value.residentId!.user!.lastName}'),
                      _textData(context,
                          title: 'SĐT:',
                          content:
                          '${controller.schedule.collectorDepotPayment?.collector?.user?.phoneNumber} '),
                              // '${controller.dataDetail.value.residentId!.user!.phoneNumber}'),
                      // SizedBoxConst.size(context: context),
                      // _textData(context,
                      //     title: 'Người thu gom:',
                      //     content:
                      //         '${controller.dataDetail.value.collector!.user!.firstName} ${controller.dataDetail.value.collector!.user!.lastName}'),
                      // _textData(context,
                      //     title: 'SĐT:',
                      //     content:
                      //         '${controller.dataDetail.value.collector!.user!.phoneNumber}'),
                      // SizedBoxConst.size(context: context),
                      _textData(context,
                          title: 'Trạng thái:',
                          content: 'Hoàn thành',
                          color: Colors.green),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile1(context,
                          text: 'Chi tiết rác thu gom',
                          color: ColorsManager.primary),
                      Container(
                        height: 2,
                        width: UtilsReponsive.width(150, context),
                        color: ColorsManager.primary,
                      ),
                      SizedBoxConst.size(context: context),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ColorsManager.primary,
                            borderRadius: BorderRadius.circular(
                                UtilsReponsive.height(15, context))),
                        child: Column(
                          children: [
                            _textData2(context,
                                title: 'Loại rác',
                                content2: 'Điểm',
                                content: 'Số lượng(kg)',
                                color: Colors.white),
                            SizedBoxConst.size(context: context),
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: controller
                                  .schedule.cdPaymentDetail!.length,
                              separatorBuilder: (context, index) =>
                                  SizedBoxConst.size(context: context),
                              itemBuilder: (context, index) => _textData2(
                                  context,
                                  title: controller.schedule
                                      .cdPaymentDetail![index].material!.name! +'\n(${controller.schedule.cdPaymentDetail![index].quantity!})',
                                  content2:
                                      '${(controller.schedule.cdPaymentDetail![index].material!.price! * controller.schedule.cdPaymentDetail![index].quantity!).toStringAsFixed(2)}',
                                  content:
                                      '${controller.schedule.cdPaymentDetail![index].material!.price!} ',
                                  color: Colors.white),
                            ),
                            SizedBoxConst.size(context: context, size: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextConstant.titleH3(context,
                                    text: 'Tổng', color: Colors.white),
                                TextConstant.titleH3(context,
                                    text: '${controller.schedule.collectorDepotPayment!.amount}  điểm',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }

  Row _textData(BuildContext context,
      {required String title,
      required String content,
      Color color = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextConstant.subTile2(context,
                text: title, color: Colors.black)),
        Expanded(
          child: TextConstant.subTile2(context,
              text: content, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }

  Row _textData2(BuildContext context,
      {required String title,
      required String content,
      required String content2,
      Color color = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
            child: TextConstant.subTile3(context, text: title, color: color)),
        Expanded(
          child: TextConstant.subTile3(context,
              text: content, fontWeight: FontWeight.bold, color: color),
        ),
        SizedBoxConst.sizeWith(context: context),
        Expanded(
          child: TextConstant.subTile3(context,
              text: content2, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
