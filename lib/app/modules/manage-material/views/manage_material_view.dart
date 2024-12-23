import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/modules/config_material/views/config_material_view.dart';
import 'package:rca_depot/app/resource/color_manager.dart';
import 'package:rca_depot/app/resource/reponsive_utils.dart';
import 'package:rca_depot/app/resource/text_style.dart';

import '../controllers/manage_material_controller.dart';

class ManageMaterialView extends GetView<ManageMaterialController> {
  const ManageMaterialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back)),
                    TextConstant.titleH2(context, text: 'Các loại rác'),
                  ],
                ),
                Obx(() => controller.waiting.value
                    ? CupertinoActivityIndicator()
                    : TextButton(
                        onPressed: () {
                          controller.updateAll();
                        },
                        child: TextConstant.subTile3(context,
                            text: 'Cập nhật nhanh',
                            color: ColorsManager.primary),
                      ))
              ],
            ),
            Obx(() => controller.isLoading.value
                ? CupertinoActivityIndicator()
                : Expanded(
                    child: Obx(
                    () => ListView.separated(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(15, context)),
                      itemCount:
                          controller.dataDepot.value.depotMaterials!.length,
                      separatorBuilder: (context, index) =>
                          SizedBoxConst.size(context: context),
                      itemBuilder: (context, index) => ItemMaterial(
                        item: controller.dataDepot.value.depotMaterials![index],
                      ),
                    ),
                  )))
          ],
        ),
      ),
    ));
  }
}
