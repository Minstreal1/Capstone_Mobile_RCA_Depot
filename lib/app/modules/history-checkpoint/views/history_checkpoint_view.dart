import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/modules/history-checkpoint/model/history_withdraw.dart';
import '/app/resource/cast_ui.dart';
import '/app/resource/color_manager.dart';
import '/app/resource/reponsive_utils.dart';
import '/app/resource/text_style.dart';
import '/app/resource/util_common.dart';

import '../controllers/history_checkpoint_controller.dart';

class HistoryCheckpointView extends GetView<HistoryCheckpointController> {
  const HistoryCheckpointView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<HistoryCheckpointController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử rút tiền'),
        centerTitle: true,
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBoxConst.size(context: context, size: 20),
              Expanded(
                  child: Obx(() => ListView.separated(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(20, context)),
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) =>
                          _cardData(context, controller.listData[index]),
                      separatorBuilder: (context, index) =>
                          SizedBoxConst.size(context: context),
                      itemCount: controller.listData.value.length)))
            ],
          )),
    );
  }

  Widget _cardData(BuildContext context, HistoryWithDraw data) {
  
    return GestureDetector(
      onTap: () {
      },
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration:
              UtilCommon.shadowBox(context, colorSd: ColorsManager.primary),
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
                        // color: Colors.white,
                        size: UtilsReponsive.height(16, context),
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                          text: UtilCommon.convertEEEDateTime(data.createdAt),
                          // color: Colors.white,
                          fontWeight: FontWeight.w500,
                          context),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Số tài khoản:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        color: ColorsManager.primary,
                        text: '${data.bankAccountNumber}',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Tên chủ thẻ:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        color: ColorsManager.primary,
                        text: '${data.bankAccountName}',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Ngân hàng:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        color: ColorsManager.primary,
                        text: '${data.bankName}',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Số điểm:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        color: ColorsManager.primary,
                        text:
                            '${data.numberPoint} - ${data.numberPoint * 1000} VNĐ',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(context,
                          text: 'Trạng thái:', size: 10),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      CastUI.statusCast(context, statusData: data.status)
                    ],
                  ),
                ],
              )),
            ],
          )),
    );
  }
}
