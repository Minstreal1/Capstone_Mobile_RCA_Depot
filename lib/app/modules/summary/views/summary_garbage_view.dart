import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/common/widget/app_bar_custom.dart';
import 'package:rca_depot/app/resource/assets_manager.dart';
import 'package:rca_depot/app/resource/color_manager.dart';
import 'package:rca_depot/app/resource/reponsive_utils.dart';
import 'package:rca_depot/app/resource/text_style.dart';
import 'package:rca_depot/app/resource/util_common.dart';

import '../controllers/summary_garbage_controller.dart';

class SummaryGarbageView extends GetView<SummaryGarbageController> {
  const SummaryGarbageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: UtilsReponsive.height(80, context),
        width: double.infinity,
        color: ColorsManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextConstant.titleH2(context,
                text: 'Tổng cộng', size: 18, color: Colors.white),
            Obx(() => TextConstant.titleH3(context,
                text: '${controller.total}KG', size: 16, color: Colors.white),),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            AppBarCustom(
                callback: () {
                  Get.back();
                },
                title: 'Thống kê'),
            SizedBoxConst.size(context: context, size: 20),
            Obx(() =>controller.isLoading.value? const CircularProgressIndicator(): ListView.separated(
              shrinkWrap: true,
              itemCount: controller.data.value.dataAnalyze!.length,
              separatorBuilder: (context, index) =>
                  SizedBoxConst.size(context: context),
              itemBuilder: (context, index) => _cardSummary(context,
                  title: controller
                      .data.value.dataAnalyze![index].materialTypeName!,
                  content:
                      '${controller.data.value.dataAnalyze![index].totalWeight} KG'),
            ),)
          ],
        ),
      )),
    );
  }

  Container _cardSummary(BuildContext context,
      {required String title, required String content}) {
    return Container(
      decoration: UtilCommon.shadowBox(context),
      child: Row(
        children: [
          Container(
            height: UtilsReponsive.height(80, context),
            width: UtilsReponsive.height(80, context),
            decoration: UtilCommon.shadowBox(context),
            child: Image.asset(ImageAssets.logo)
          ),
          SizedBoxConst.sizeWith(context: context),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConstant.subTile2(context,
                    text: title, size: 16, color: ColorsManager.primary),
                TextConstant.subTile3(context,
                    text: content, size: 14, color: Colors.grey),
              ],
            ),
          ),
          SizedBoxConst.sizeWith(context: context),
        ],
      ),
    );
  }
}
